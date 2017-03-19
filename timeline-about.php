<?php
	include ('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die();
	}

	$id_user = filtra($_GET['id_user'], $connection);

	if($id_user == isset($_SESSION['id_user'])){
		if(!$query_user = mysqli_query($connection, "SELECT id_user, name, surname, user_name, email, user_password, cellphone, continent, country, city, DATE_FORMAT(born_date, '%Y') as year_born, DATE_FORMAT(born_date, '%M') as month_born, DATE_FORMAT(born_date, '%c') as month_born_number, DATE_FORMAT(born_date, '%d') as day_born, signup_date, about_me, profile_photo, header_photo FROM tbl_users INNER JOIN tbl_locations ON tbl_users.id_location = tbl_locations.id_location WHERE id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_user)>0){
			while ($row = mysqli_fetch_assoc($query_user)){
				$user[] = $row;
			}

		} else{
			$smarty->assign('message','ERROR: There is not data! ');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	} else{
		if(!$query_user = mysqli_query($connection, "SELECT id_user, name, surname, user_name, email, cellphone, continent, country, city, DATE_FORMAT(born_date, '%Y') as year_born, DATE_FORMAT(born_date, '%m') as month_born, DATE_FORMAT(born_date, '%c') as month_born_number, DATE_FORMAT(born_date, '%d') as day_born, signup_date, about_me, profile_photo, header_photo FROM tbl_users INNER JOIN tbl_locations ON tbl_users.id_location = tbl_locations.id_location WHERE id_user='$id_user'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query_user)>0){
			while ($row = mysqli_fetch_assoc($query_user)){
				$user[] = $row;
			}

		} else{
			$smarty->assign('message','ERROR: There is not data! ');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
	}

	$smarty->assign("user",$user);

	$smarty -> display('timeline-about.tpl');
?>