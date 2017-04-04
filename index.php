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
			$number_users = $row['number_users'];
		}
		$smarty->assign("number_users", $number_users);
	}

	if(!$query_published = mysqli_query($connection, "SELECT count(*) as publishing_number FROM tbl_publications")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_published)>0){
		while ($row = mysqli_fetch_assoc($query_published)){
			$publishing_number= $row['publishing_number'];
		}
		$smarty->assign("publishing_number", $publishing_number);
	}

$smarty -> display('index.tpl');
?>