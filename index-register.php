<?php
include('config/core.php');

	if (is_logged())
	{
		header('location: newsfeed.php');
		die(); 
	}

	if( isset($_POST['check'])){
		if( $_POST['password'] == '' || $_POST['Email'] == ''){
			$smarty->assign("message","Fill the fields");
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		$email = filtra( $_POST['Email'], $connection);
		$password = filtra( $_POST['password'], $connection);

		$query = "SELECT * FROM tbl_users WHERE email='$email' and user_password='$password'";

		if(!$result = mysqli_query($connection, $query)){
			$smarty->assign("message","ERROR: SQL error during the registration, try again! " . mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		} else{	
			while ($row = mysqli_fetch_assoc($result) ){ //guardamos cada registro en una variable para mostrarlo
				$_SESSION['id_user'] = $row['id_user'];
				$_SESSION['user_name'] = $row['user_name'];
				header('location: newsfeed.php');
			}
		}
	}

$smarty -> display('index-register.tpl');

?>