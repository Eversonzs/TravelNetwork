<?php
include('config/core.php');

if (!is_logged()){
	header('location: index-register.php');
	die(); 
}

	$id_permissions = $_POST['permissions'];
	$group = filtra($_POST['group'], $connection);

	if(!$query_id_group = mysqli_query($connection, "SELECT id_group FROM tbl_groups WHERE tbl_groups.group='$group'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_id_group)>0){
		while ($row = mysqli_fetch_assoc($query_id_group)){
			$id_group = $row['id_group'];
		}
	}

	if(check_permission($connection, "delete_group")){
		
		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_permissions_groups WHERE id_group='$id_group'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
		
		foreach ($id_permissions as $permissions) {
			if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_permissions_groups(id_permission, id_group) VALUES ('$permissions', '$id_group')")){
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}
		}

		header('location: group_manager.php?group='."$group".'');

	}

	mysqli_close($connection);
	die();

	$smarty -> display('group_manager.tpl');

?>