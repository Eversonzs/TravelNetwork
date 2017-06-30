<?php
	include ('config/core.php');
	include('config/pagination.php');

	if (!is_logged()){
		header('location: index-register.php');
		die();
	}

	$id_user = filtra($_GET['id_user'], $connection);
	$id_user_logged = $_SESSION['id_user'];

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

	if(!$query_followers_number = mysqli_query($connection, "SELECT count(*) as followers FROM tbl_friends WHERE id_user='$id_user'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_followers_number)>0){
		while ($row = mysqli_fetch_assoc($query_followers_number)){
			$followers_number = $row['followers'];
		}
		$smarty->assign("followers_number", $followers_number);
	}

	if(!$query_already_following = mysqli_query($connection, "SELECT count(*) as already_following FROM tbl_friends WHERE id_user='$id_user' AND id_friend='$id_user_logged'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_already_following)>0){
		while ($row = mysqli_fetch_assoc($query_already_following)){
			$already_following = $row['already_following'];
		}
	} else{
		$already_following = 0;
	}
	$smarty->assign("already_following", $already_following);

	$string_query_following = "SELECT * FROM tbl_friends INNER JOIN tbl_users ON tbl_friends.id_user = tbl_users.id_user WHERE tbl_friends.id_friend='$id_user'";

	if(!$query_following = mysqli_query($connection, $string_query_following)){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	$x_pagina=20;

	// Eseguo la paginazione
	$p = new Pagination($connection, $string_query_following, $x_pagina, "pagina");

	if($record_s = $p->Show()){
	$smarty->assign("following",$record_s);
	/*passo il numero di righe per decidere se inserire o no la scelta del numero di prodotti per pagina*/
	$smarty->assign("num_tot",mysqli_num_rows($query_following));
	}

	if($link = $p->link(3)){
		$smarty->assign('_prima',$link['primo']);
		$smarty->assign('_prec',$link['precedente']);
		$smarty->assign('_corr',$link['corrente']);	
		$smarty->assign('_succ',$link['successivo']);     
		$smarty->assign('_ultima',$link['ultimo']);	
	}

	$smarty -> display('timeline-following.tpl');
?>