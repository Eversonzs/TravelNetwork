<?php
	include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_group = filtra($_REQUEST['id_group'], $connection);

	if (check_permission($connection, "delete_group")){

		if(!$query_delete_group_permissions = mysqli_query($connection, "DELETE FROM tbl_permissions_groups WHERE tbl_permissions_groups.id_group='$id_group'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_users_groups = mysqli_query($connection, "DELETE FROM tbl_users_groups WHERE tbl_users_groups.id_group='$id_group'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete_group = mysqli_query($connection, "DELETE FROM tbl_groups WHERE tbl_groups.id_group='$id_group'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	} else{
		$smarty->assign('message','ERROR: You are not authorized to delete groups! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	header('location: groups.php');

	mysqli_close($connection);
	die();

	$smarty -> display('groups.tpl');
?>