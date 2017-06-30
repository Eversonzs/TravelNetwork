<?php
include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];

	if(isset($_POST['check'])){

		if($_POST['firstname'] == '' || $_POST['lastname'] == '' || $_POST['username'] == ''|| $_POST['Email'] == ''|| $_POST['password'] == '' || $_POST['cellphone']=='' || empty($_POST['day'])|| empty($_POST['month']) || empty($_POST['year']) || $_POST['city']=="" || empty($_POST['country'])|| empty($_POST['continent'])){
			$smarty->assign('message','ERROR: You have to fill all the fields. ');
			$smarty->display('message.tpl');
			die();//termina lo script php
		}

		$name = filtra($_POST['firstname'], $connection);
		$surname = filtra($_POST['lastname'], $connection);
		$user_name = filtra($_POST['username'], $connection);
		$email = filtra($_POST['Email'], $connection);
		$password = filtra($_POST['password'], $connection);
		$user_password = sha1(md5($password));

		$cellphone = filtra($_POST['cellphone'], $connection);
		$born_date = $_POST['year'] . "-" . $_POST['month'] . "-" . $_POST['day'];

		$city = filtra($_POST['city'], $connection);
		$country = $_POST['country'];
		$continent = $_POST['continent'];

		$about_me = filtra($_POST['about_me'],$connection);

		if(!$query_city = mysqli_query($connection, "SELECT id_location FROM tbl_locations WHERE LOWER(city)=LOWER('$city')")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysql_error());
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
			$smarty->assign('message', 'ERROR: SQL error during the location registration, try again');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
			}

			if(!$query_city = mysqli_query($connection, "SELECT id_location FROM tbl_locations WHERE LOWER(city)=LOWER('$city')")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
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
		
		if(!mysqli_query($connection, "UPDATE tbl_users SET user_name='$user_name', user_password='$user_password', name='$name', surname='$surname', email='$email', cellphone='$cellphone', id_location='$id_location', born_date='$born_date', about_me='$about_me' WHERE id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error updating data, try again! ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}	

		header('location: timeline-about.php?id_user='."$id_user".'');
		mysqli_close($connection);
		die();
		
	}
?>