<?php
	include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];
	$id_publication = filtra($_REQUEST['id_publication'], $connection);
	$page = filtra($_REQUEST['page'], $connection);

	if(!$query_user = mysqli_query($connection, "SELECT * FROM tbl_publications_users WHERE id_user='$id_user' AND id_publication='$id_publication'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
	}

	if ((mysqli_num_rows($query_user)>0) || check_permission($connection, "delete_publication")){
		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_publications WHERE id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_publications_users WHERE id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_gallery WHERE id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_valuations WHERE id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_comments WHERE id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_publications_categories WHERE id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
	} else{
		$smarty->assign('message','ERROR: You are not authorized to delete this publication.! '.mysqli_error($connection));
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

	$smarty -> display('timeline.tpl');
?>