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

	if(!$query_events = mysqli_query($connection, "SELECT count(*) as events_number FROM tbl_events")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_events)>0){
		while ($row = mysqli_fetch_assoc($query_events)){
			$events_number= $row['events_number'];
		}
		$smarty->assign("events_number", $events_number);
	}

	if(!$query_users = mysqli_query($connection, "SELECT user_name, profile_photo FROM tbl_users LIMIT 5")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_users)>0){
		while ($row = mysqli_fetch_assoc($query_users)){
			$users[] = $row;
		}
		$smarty->assign("users", $users);
	}

	if(!$query_users2 = mysqli_query($connection, "SELECT user_name, profile_photo, signup_date FROM tbl_users LIMIT 20")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_users2)>0){
		while ($row = mysqli_fetch_assoc($query_users2)){
			$users2[] = $row;
		}
		$smarty->assign("users2", $users2);
	}

$smarty -> display('index.tpl');
?>