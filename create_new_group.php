<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$group_name = filtra($_POST['group_name'], $connection);

	if(check_permission($connection, "delete_group")){
		if(!$query_comment = mysqli_query($connection, "INSERT INTO tbl_groups(`group`) VALUES('$group_name')")){
			$smarty->assign('message', 'ERROR: SQL error trying to create a new group. ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}else{
			$smarty->assign('message','You have created a new group! ');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	} else{
		$smarty->assign('message','ERROR: You are not enable to create a new group! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	mysqli_close($connection);
	die();

	$smarty -> display('groups.tpl');

?>