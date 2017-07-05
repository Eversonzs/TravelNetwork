<?php
	include('config/core.php');
	include('config/pagination.php');

	if (!is_logged()){
			header('location: index-register.php');
			die();
	}

	$id_user_loggeado = $_SESSION['id_user'];

	$id_event = filtra($_GET['id_event'], $connection);
	
	if(!$query = mysqli_query($connection, "SELECT * FROM tbl_participants WHERE id_user='$id_user_loggeado' AND id_event='$id_event'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}
	if (mysqli_num_rows($query)>0 || check_permission($connection, "delete_event")){

		if(!$query_event_information = mysqli_query($connection, "SELECT * FROM tbl_events INNER JOIN tbl_participants ON tbl_events.id_event = tbl_participants.id_event INNER JOIN tbl_users ON tbl_participants.id_user = tbl_users.id_user WHERE tbl_events.id_event='$id_event' AND tbl_participants.id_user='$id_user_loggeado'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_event_information)>0){
			while ($row = mysqli_fetch_assoc($query_event_information)){
				$event_information[] = $row;
			}
			$smarty->assign("event_information", $event_information);
		}

		$string_query_people = "SELECT id as id_user, n as name, s as surname, u as user_name, p as profile_photo, h as header_photo FROM (SELECT B.id_user as id, name as n, surname as s, user_name as u, profile_photo as p, header_photo as h FROM tbl_friends as f2 INNER JOIN tbl_users AS B ON f2.id_user = B.id_user WHERE f2.id_friend='$id_user_loggeado' UNION ALL SELECT A.id_user as id, name as n, surname as s, user_name as u, profile_photo as p, header_photo as h FROM tbl_friends AS f1 INNER JOIN tbl_users AS A ON f1.id_friend = A.id_user WHERE f1.id_user='$id_user_loggeado') as t1 GROUP BY id_user, name, surname, user_name, profile_photo, header_photo";
		if(!$query_invite_people = mysqli_query($connection, $string_query_people)){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_invite_people)>0){
			while ($row = mysqli_fetch_assoc($query_invite_people)){
				$event_participants[] = $row;
			}
		}

		if(!$query_already_invite = mysqli_query($connection, "SELECT * FROM tbl_participation WHERE id_event='$id_event'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_already_invite)>0){
			while ($row = mysqli_fetch_assoc($query_already_invite)){
				$already_invite[] = $row;
			}
			$smarty->assign("already_invite", $already_invite);
		}

		if(isset($_GET['id_user'])){
			$id_user = filtra($_GET['id_user'], $connection);

			if(!$query_invite = mysqli_query($connection, "SELECT * FROM tbl_participation WHERE id_event='$id_event' AND id_user_reciver='$id_user'")){
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			if (mysqli_num_rows($query_invite)<1){
				if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_participation(id_user_sender, id_event, id_user_reciver) VALUES('$id_user_loggeado', '$id_event', '$id_user')")){
					$smarty->assign('message', 'ERROR: SQL error trying to invite this user. ' .mysqli_error($connection));
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
				}
			}
		}

	}

	else{
		$smarty->assign('message','You are not part of this event.');
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	



	$x_pagina=20;
	  
	// Eseguo la paginazione
	$p = new Pagination($connection, $string_query_people, $x_pagina, "pagina");

	if($record_s = $p->Show()){
	$smarty->assign("event_participants",$record_s);
	/*passo il numero di righe per decidere se inserire o no la scelta del numero di prodotti per pagina*/
	$smarty->assign("num_tot",mysqli_num_rows($query_invite_people));
	}

	if($link = $p->link(3)){
		$smarty->assign('_prima',$link['primo']);
		$smarty->assign('_prec',$link['precedente']);
		$smarty->assign('_corr',$link['corrente']);	
		$smarty->assign('_succ',$link['successivo']);     
		$smarty->assign('_ultima',$link['ultimo']);	
	}


	$smarty -> display('invite_people.tpl');
	mysqli_close($connection);
?>