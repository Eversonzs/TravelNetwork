<?php
include('config/core.php');

	if (is_logged()){
		header('location: newsfeed.php');
		die(); 
	}

	if(isset($_POST['check'])){

		if($_POST['firstname'] == '' || $_POST['lastname'] == '' || $_POST['username'] == ''|| $_POST['Email'] == ''|| $_POST['password'] == '' || $_POST['cellphone']==''|| empty($_POST['day'])|| empty($_POST['month']) || empty($_POST['year']) || $_POST['city']=="" || empty($_POST['country'])|| empty($_POST['continent'])){
			$smarty->assign('message','ERROR: You have to fill all the fields. ');
			$smarty->display('message.tpl');
			die();//termina lo script php
		}

		$email = filtra($_POST['Email'], $connection); 
		if(!$query_email = mysqli_query($connection, "SELECT id_user from tbl_users WHERE email='$email'")){
		    $smarty->assign('message','ERROR: SQL error during the registration, try again! '.mysql_error());
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
		if(mysqli_num_rows($query_email) > 0){
			$smarty->assign('message','ERROR: This email already exists in the database! ');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		$username = filtra($_POST['username'], $connection); 
		if(!$query_username = mysqli_query($connection, "SELECT id_user from tbl_users WHERE user_name='$username'")){
		    $smarty->assign('message','ERROR: SQL error during the registration, try again! '.mysql_error());
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
		if(mysqli_num_rows($query_username) > 0){
			$smarty->assign('message','ERROR: This username already exists in the database! ');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		$name = filtra($_POST['firstname'], $connection);
		$surname = filtra($_POST['lastname'], $connection);
		$user_name = filtra($_POST['username'], $connection);
		$email = filtra($_POST['Email'], $connection);
		$user_password = filtra($_POST['password'], $connection);
		$cellphone = filtra($_POST['cellphone'], $connection);
		$born_date = $_POST['year'] . "-" . $_POST['month'] . "-" . $_POST['day'];

		$city = filtra($_POST['city'], $connection);
		$country = $_POST['country'];
		$continent = $_POST['continent'];

		if(!$query_city = mysqli_query($connection, "SELECT id_location FROM tbl_locations WHERE city='$city'")){
			$smarty->assign('message','ERROR: SQL error during the registration, try again! '.mysql_error());
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
		if (mysqli_num_rows($query_city)>0){
			while ($row = mysqli_fetch_assoc($query_city)){
				$id_location = $row['id_location'];
			}
		} else{
			if(!mysqli_query($connection, "INSERT INTO tbl_locations (continent, country, city) VALUES ('$continent', '$country', '$city')")){
			$smarty->assign('message', 'ERROR: SQL error during the lacation registration, try again');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
			}

			if(!$query_city = mysqli_query($connection, "SELECT id_location FROM tbl_locations WHERE city='$city'")){
			$smarty->assign('message','ERROR: SQL error during the registration, try again! '.mysql_error());
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
			}

			if (mysqli_num_rows($query_city)>0){
				while ($row = mysqli_fetch_assoc($query_city)){
					$id_location = $row['id_location'];
				}
			}
		}
		if(!mysqli_query($connection, "INSERT INTO tbl_users (user_name, user_password, name, surname, email, cellphone, id_location, born_date, signup_date) VALUES ('$user_name','$user_password','$name', '$surname', '$email', '$cellphone', '$id_location', '$born_date', DATE_FORMAT(NOW(),'%Y-%c-%d'))")){
			$smarty->assign('message','ERROR: SQL error during the registration, try again! ');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		$smarty->assign('message','CONGRATULATION: You are now register! ');
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();

		//header('location: newsfeed.php');
	}
?>