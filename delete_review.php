<?php
	include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];
	$id_review = filtra($_REQUEST['id_review'], $connection);
	$id_event= filtra($_REQUEST['id_event'], $connection);

	if(!$query_user = mysqli_query($connection, "SELECT * FROM tbl_reviews WHERE id_user='$id_user' AND id_review='$id_review'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
	}

	if ((mysqli_num_rows($query_user)>0) || check_permission($connection, "delete_reviews")){
		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_reviews WHERE id_review='$id_review'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
	} else{
		$smarty->assign('message','ERROR: You are not authorized to delete this review! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	header('location: event_page.php?id_event='."$id_event".'');
	
	mysqli_close($connection);
	die();

	$smarty -> display('timeline.tpl');
?>