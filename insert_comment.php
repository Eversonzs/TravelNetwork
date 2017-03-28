<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_publication = filtra($_POST['id_publication'], $connection);
	$id_user = $_SESSION['id_user'];
	$comment = filtra($_POST['comment'], $connection);
	$page = filtra($_POST['page'], $connection);

	if(check_permission($connection, "comment") && $comment != ""){
		if(!$query_comment = mysqli_query($connection, "INSERT INTO tbl_comments(id_publication, id_user, comment, commentDate) VALUES('$id_publication', '$id_user', '$comment', DATE_FORMAT(NOW(),'%Y-%c-%d'))")){
			$smarty->assign('message', 'ERROR: SQL error trying to comment. ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		} 

	} else{
		$smarty->assign('message','ERROR: You are not enable to comment! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if($page == "newsfeed"){
		header('location: newsfeed.php');
	} else{
		header('location: timeline.php?id_user='."$id_user".'');
	}

	mysqli_close($connection);
	die();

	$smarty -> display('newsfeed.tpl');

?>