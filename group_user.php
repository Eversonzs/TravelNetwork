<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$users_to_show = filtra($_GET['users'], $connection);
	$id_user = filtra($_GET['id_user'], $connection);
	$id_group = filtra($_GET['id_group'], $connection);

	if(check_permission($connection, "delete_publication")){

		if(!$query_verify = mysqli_query($connection, "SELECT * FROM tbl_users_groups WHERE id_user='$id_user' AND id_group='$id_group'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_verify)<1){
			if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_users_groups(id_user, id_group) VALUES('$id_user', '$id_group')")){
				$smarty->assign('message', 'ERROR: SQL error trying to insert the register. ' .mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			$smarty->assign('message', 'You have named the users.');
			$smarty->display('message.tpl');

		}

		header("location: users_management.php?users={$users_to_show}");

	} else{
		$smarty->assign('message','ERROR: You are not able to name users as.! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	mysqli_close($connection);
	die();

	$smarty -> display('users_management.tpl');

?>