<?php
include('config/core.php');

	if (is_logged())
	{
		header('location: newsfeed.php');
		die(); 
	}

	if( isset($_POST['check']))
	{
		if( $_POST['password'] == '' || $_POST['Email'] == '')
		{
			header('location: index.php');
		}

		$email = filtra( $_POST['Email'], $connection);
		$password = filtra( $_POST['password'], $connection);

		$query = "SELECT * FROM tbl_users WHERE email='$email' and user_password='$password'";

		if(!$result = mysqli_query($connection, $query))
		{
			header('location: newsfeed.php');
		}
		else
		{	
			while ( $row = mysqli_fetch_assoc($result) ) //guardamos cada registro en una variable para mostrarlo
			{
				$_SESSION['id_user'] = $row['id_user'];
				$_SESSION['user_name'] = $row['user_name'];
				header('location: newsfeed.php');
			}

		}
	}



$smarty -> display('index-register.tpl');

?>