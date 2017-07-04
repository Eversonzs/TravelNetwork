<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];
	$description_review = filtra($_POST['description'], $connection);
	$id_event = filtra($_POST['id_event'], $connection);

	if(check_permission($connection, "write") && $description_review !=""){
		if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_reviews(id_event, id_user, review, review_date) VALUES('$id_event', '$id_user', '$description_review', DATE_FORMAT(NOW(),'%Y-%c-%d'))")){
			$smarty->assign('message', 'ERROR: SQL error trying to publish your review. ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	} else{
		$smarty->assign('message','ERROR: The review is empty or you are not enable to publish! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	header('location: event_page.php?id_event='."$id_event".'');
	
	mysqli_close($connection);
	die();

	$smarty -> display('event_page.tpl');

?>