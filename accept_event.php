<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user_loggeado = $_SESSION['id_user'];
	$id_event = filtra($_GET['id_event'], $connection);


	if(check_permission($connection, "write")){

		if(!$query_insert = mysqli_query($connection, "UPDATE tbl_participation SET yes_or_not='yes' WHERE id_event='$id_event' AND id_user_reciver='$id_user_loggeado'")){
			$smarty->assign('message', 'ERROR: SQL error trying to insert the register. ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_participants(id_user, id_event, type_participation) VALUES('$id_user_loggeado', '$id_event', 'participant')")){
			$smarty->assign('message', 'ERROR: SQL error trying to insert the register. ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		header("location: events_invitation.php");

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