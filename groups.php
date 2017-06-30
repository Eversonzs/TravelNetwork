<?php
include('config/core.php');
	if (!is_logged()){
		header('location: newsfeed.php');
		die(); 
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

	} else{
		header('location: index.php');
		die();
	}

$smarty -> display('groups.tpl');

?>