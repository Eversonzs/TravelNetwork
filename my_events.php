<?php
	include('config/core.php');
	include('config/pagination.php');

	if (!is_logged()){
			header('location: index-register.php');
			die();
	}

	$id_user = $_SESSION['id_user'];

	if(!$query_followers = mysqli_query($connection, "SELECT count(*) as followers FROM tbl_friends WHERE id_user='$id_user'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_followers)>0){
		while ($row = mysqli_fetch_assoc($query_followers)){
			$followers = $row['followers'];
		}
		$smarty->assign("followers", $followers);
	}

	$string_query_my_events = "SELECT * FROM tbl_events INNER JOIN tbl_participants ON tbl_events.id_event = tbl_participants.id_event WHERE id_user='$id_user' ORDER BY event_date DESC";
	if(!$query_my_events = mysqli_query($connection, $string_query_my_events)){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_my_events)>0){
		while ($row = mysqli_fetch_assoc($query_my_events)){
			$my_events[] = $row;
		}
	}

	$x_pagina=10;
	  
	// Eseguo la paginazione
	$p = new Pagination($connection, $string_query_my_events, $x_pagina, "pagina");

	if($record_s = $p->Show()){
	$smarty->assign("my_events",$record_s);
	/*passo il numero di righe per decidere se inserire o no la scelta del numero di prodotti per pagina*/
	$smarty->assign("num_tot",mysqli_num_rows($query_my_events));
	}

	if($link = $p->link(3)){
		$smarty->assign('_prima',$link['primo']);
		$smarty->assign('_prec',$link['precedente']);
		$smarty->assign('_corr',$link['corrente']);	
		$smarty->assign('_succ',$link['successivo']);     
		$smarty->assign('_ultima',$link['ultimo']);	
	}
	
	$smarty -> display('my_events.tpl');
	mysqli_close($connection);
?>