<?php
include('config/core.php');
	if (is_logged()){
		header('location: newsfeed.php');
		die(); 
	}

	if(!$query_users = mysqli_query($connection, "SELECT count(*) as number_users FROM tbl_users")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_users)>0){
		while ($row = mysqli_fetch_assoc($query_users)){
			$number_users[] = $row;
		}
		$smarty->assign("number_users", $number_users);
	}

$smarty -> display('index.tpl');
?>