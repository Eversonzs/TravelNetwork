<?php
	include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user_logged = $_SESSION['id_user'];
	$id_user = filtra($_REQUEST['id_user'], $connection);
	$id_comment = filtra($_REQUEST['id_comment'], $connection);

	if(!$query_user = mysqli_query($connection, "SELECT * FROM tbl_comments WHERE id_user='$id_user_logged' AND id_comment='$id_comment'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
	}

	if (mysqli_num_rows($query_user)>0){
		if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_comments WHERE id_comment='$id_comment'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	} elseif (!$query_user = mysqli_query($connection, "SELECT * FROM tbl_comments WHERE id_comment='$id_comment'")) {
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if(mysqli_num_rows($query_user)>0){
		while ($row = mysqli_fetch_assoc($query_user)){
			$id_publication = $row['id_publication'];
		}
			if(!$query_publication = mysqli_query($connection, "SELECT * FROM tbl_publications_users WHERE id_publication='$id_publication' AND id_user='$id_user_logged'")) {
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			} else{
				if(mysqli_num_rows($query_publication)>0){
					if(!$query_delete = mysqli_query($connection, "DELETE FROM tbl_comments WHERE id_comment='$id_comment'")){
						$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
						$smarty->display('message.tpl');
						mysqli_close($connection);
						die();
					}

				}
			}
	} else{
		$smarty->assign('message','ERROR: You are not authorized to delete this comment.! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	header('location: timeline.php?id_user='."$id_user".'');
	mysqli_close($connection);
	die();

	$smarty -> display('timeline.tpl');
?>