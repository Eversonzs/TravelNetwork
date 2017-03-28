<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];
	$description_publication = filtra($_POST['description'], $connection);
	$page = filtra($_POST['page'], $connection);

	if(check_permission($connection, "write") && $description_publication !=""){
		if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_publications(id_location, description, publication_date, valuation, address) VALUES(1, '$description_publication', DATE_FORMAT(NOW(),'%Y-%c-%d'), 0, 'L\'Aquila')")){
			$smarty->assign('message', 'ERROR: SQL error trying to publish. ' .mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		} 

		$id_publication = mysqli_insert_id($connection);

		if(!$query_user_publication = mysqli_query($connection, "INSERT INTO tbl_publications_users(id_publication, id_user) VALUES('$id_publication', '$id_user')")){
				$smarty->assign('message', 'ERROR: SQL error trying to publish. ' .mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

	} else{
		$smarty->assign('message','ERROR: You are not enable to publish! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if($page == "newsfeed"){
		header('location: newsfeed.php');
	} else{
		header('location: timeline.php?id_user='."$id_user".'');
	}

	mysqli_close($connection);
	die();

	$smarty -> display('newsfeed.tpl');

?>