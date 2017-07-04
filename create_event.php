<?php
	include('config/core.php');

	if (!is_logged()){
			header('location: index-register.php');
			die();
	}

	$id_user = $_SESSION['id_user'];

	if(!$query_followers = mysqli_query($connection, "SELECT count(*) as followers FROM tbl_friends WHERE id_user='$id_user'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_followers)>0){
		while ($row = mysqli_fetch_assoc($query_followers)){
			$followers = $row['followers'];
		}
		$smarty->assign("followers", $followers);
	}

	if( isset($_POST['check'])){
		$event_name = filtra($_POST['event_name'], $connection);
		$event_description = filtra($_POST['event_description'], $connection);
		$event_date = filtra($_POST['event_date'], $connection);
		$event_address = filtra($_POST['event_address'], $connection);

		if(check_permission($connection, "create_event")){
			if(!$query_create_event = mysqli_query($connection, "INSERT INTO tbl_events(event_name, event_date, address, description) VALUES('$event_name', '$event_date', '$event_address', '$event_description')")){
				$smarty->assign('message', 'ERROR: SQL error trying to create a new event. ' .mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			$id_event = mysqli_insert_id($connection);

			if(!$query_create_event = mysqli_query($connection, "INSERT INTO tbl_participants(id_user, id_event, type_participation) VALUES('$id_user', '$id_event', 'creator')")){
				$smarty->assign('message', 'ERROR: SQL error trying to create a new event. ' .mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			header('location: event_page.php?id_event='."$id_event".'');

		}else{
			$smarty->assign('message','ERROR: You are not enable to create an event! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
	}

	$smarty -> display('create_event.tpl');
	mysqli_close($connection);
?>