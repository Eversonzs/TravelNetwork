<?php
	include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_REQUEST['id_user'];

	if (check_permission($connection, "delete_user")){

		if(!$query_delete_valuations = mysqli_query($connection, "DELETE FROM tbl_valuations WHERE tbl_valuations.id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_comments = mysqli_query($connection, "DELETE FROM tbl_comments WHERE tbl_comments.id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_friends = mysqli_query($connection, "DELETE FROM tbl_friends WHERE tbl_friends.id_user='$id_user' OR  tbl_friends.id_friend='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_users_groups = mysqli_query($connection, "DELETE FROM tbl_users_groups WHERE tbl_users_groups.id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_publications_user = mysqli_query($connection, "DELETE tbl_publications_users.*, tbl_publications.*, tbl_gallery.* FROM tbl_publications_users INNER JOIN tbl_publications ON tbl_publications.id_publication=tbl_publications_users.id_publication INNER JOIN tbl_gallery ON tbl_publications.id_publication=tbl_gallery.id_publication WHERE tbl_publications_users.id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_users_groups = mysqli_query($connection, "DELETE FROM tbl_users WHERE tbl_users.id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	} else{
		$smarty->assign('message','ERROR: You are not authorized to delete users! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	header('location: users_management.php');

	mysqli_close($connection);
	die();

	$smarty -> display('users_management.tpl');
?>