<?php
	include('config/core.php');
	include('config/pagination.php');

	if (!is_logged()){
			header('location: index-register.php');
			die();
	}

	$id_user = $_SESSION['id_user'];

	$id_event = filtra($_GET['id_event'], $connection);


	if(!$query = mysqli_query($connection, "SELECT * FROM tbl_participants WHERE id_user='$id_user' AND id_event='$id_event'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}
	if (mysqli_num_rows($query)>0 || check_permission($connection, "delete_event")){

		if(!$query_event_information = mysqli_query($connection, "SELECT * FROM tbl_events INNER JOIN tbl_participants ON tbl_events.id_event = tbl_participants.id_event INNER JOIN tbl_users ON tbl_participants.id_user = tbl_users.id_user WHERE tbl_events.id_event='$id_event' AND tbl_participants.id_user='$id_user'")){
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

		$string_query_participants = "SELECT * FROM tbl_participants INNER JOIN tbl_users ON tbl_participants.id_user = tbl_users.id_user WHERE tbl_participants.id_event='$id_event'";
		if(!$query_event_participants = mysqli_query($connection, $string_query_participants)){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_event_participants)>0){
			while ($row = mysqli_fetch_assoc($query_event_participants)){
				$event_participants[] = $row;
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
	$p = new Pagination($connection, $string_query_participants, $x_pagina, "pagina");

	if($record_s = $p->Show()){
	$smarty->assign("event_participants",$record_s);
	/*passo il numero di righe per decidere se inserire o no la scelta del numero di prodotti per pagina*/
	$smarty->assign("num_tot",mysqli_num_rows($query_event_participants));
	}

	if($link = $p->link(3)){
		$smarty->assign('_prima',$link['primo']);
		$smarty->assign('_prec',$link['precedente']);
		$smarty->assign('_corr',$link['corrente']);	
		$smarty->assign('_succ',$link['successivo']);     
		$smarty->assign('_ultima',$link['ultimo']);	
	}


	$smarty -> display('event_participants.tpl');
	mysqli_close($connection);
?>