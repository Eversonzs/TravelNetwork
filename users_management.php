<?php
include('config/core.php');
	if (!is_logged()){
		header('location: newsfeed.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];

	if (isset($_REQUEST['users'])) {
		$users = filtra($_REQUEST['users'], $connection);
	}

	if(check_permission($connection, "delete_group")){

		if(!$query_groups = mysqli_query($connection, "SELECT * FROM tbl_groups")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_groups)>0){
			while ($row = mysqli_fetch_assoc($query_groups)){
				$groups[] = $row;
			}
			$smarty->assign("groups", $groups);
		}

		if($users == "all"){
			if(!$query_users = mysqli_query($connection, "SELECT * FROM tbl_users")){
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			if (mysqli_num_rows($query_users)>0){
				while ($row = mysqli_fetch_assoc($query_users)){
					$all_users[] = $row;
				}
				$smarty->assign("users", $all_users);
			}
		}else{
			if(!$query_users = mysqli_query($connection, "SELECT * FROM tbl_users INNER JOIN tbl_users_groups ON tbl_users.id_user = tbl_users_groups.id_user WHERE tbl_users_groups.id_group='$users'")){
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			if (mysqli_num_rows($query_users)>0){
				while ($row = mysqli_fetch_assoc($query_users)){
					$users_groups[] = $row;
				}
				$smarty->assign("users", $users_groups);
			}

		}
		
	} else{
		header('location: index.php');
		die();
	}

$smarty -> display('users_management.tpl');

?>