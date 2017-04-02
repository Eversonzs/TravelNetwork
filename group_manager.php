<?php
include('config/core.php');
	if (!is_logged()){
		header('location: newsfeed.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];

	if(check_permission($connection, "delete_group")){

		if(!$query = mysqli_query($connection, "SELECT * FROM tbl_permissions")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query)>0){
			while ($row = mysqli_fetch_assoc($query)){
				$permissions[] = $row;
			}
			$smarty->assign("permissions", $permissions);
		}

		if(!$query_group_permissions = mysqli_query($connection, "SELECT * FROM tbl_permissions_groups INNER JOIN tbl_permissions ON tbl_permissions_groups.id_permission = tbl_permissions.id_permission INNER JOIN tbl_groups ON tbl_permissions_groups.id_group = tbl_groups.id_group")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_group_permissions)>0){
			while ($row = mysqli_fetch_assoc($query_group_permissions)){
				$group_permissions[] = $row;
			}
			$smarty->assign("group_permissions", $group_permissions);
		}

		
	} else{
		header('location: index.php');
		die();
	}


$smarty -> display('group_manager.tpl');
?>