<?php
	include("config/core.php");
	include('config/pagination.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}
	if(isset($_POST['value'])){
		$value = filtra($_POST['value'], $connection);
		$smarty->assign('value', $value);
	}else{
		$value = filtra($_REQUEST['value'], $connection);
		$smarty->assign('value', $value);
	}

	$id_user = $_SESSION['id_user'];

	$string_query_users = "SELECT * FROM tbl_users WHERE upper(tbl_users.user_name) LIKE upper('%$value%') OR upper(tbl_users.name) LIKE upper('%$value%') OR upper(tbl_users.surname) LIKE upper('%$value%') OR upper(tbl_users.email) LIKE upper('%$value%')";

	if(!$query_search = mysqli_query($connection, $string_query_users)){
		$smarty->assign('message', 'ERROR: SQL error ' .mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_search)<=0){
		$smarty->assign('message', 'There are not results. ');
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

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

	$x_pagina=10;
	  
	// Eseguo la paginazione
	$p = new Pagination($connection, $string_query_users, $x_pagina, "pagina");

	if($record_s = $p->Show()){
	$smarty->assign("users",$record_s);
	/*passo il numero di righe per decidere se inserire o no la scelta del numero di prodotti per pagina*/
	$smarty->assign("num_tot",mysqli_num_rows($query_search));
	}

	if($link = $p->link(3)){
		$smarty->assign('_prima',$link['primo']);
		$smarty->assign('_prec',$link['precedente']);
		$smarty->assign('_corr',$link['corrente']);	
		$smarty->assign('_succ',$link['successivo']);     
		$smarty->assign('_ultima',$link['ultimo']);	
	}

	$smarty->display('users_found.tpl');

?>