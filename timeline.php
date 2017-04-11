<?php
	include ('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die();
	}

	$id_user = filtra($_GET['id_user'], $connection);
	$id_user_logged = $_SESSION['id_user'];

	if(!$query = mysqli_query($connection, "SELECT * FROM tbl_publications AS A INNER JOIN tbl_publications_users AS B ON A.id_publication = B.id_publication INNER JOIN tbl_users ON tbl_users.id_user = B.id_user INNER JOIN tbl_gallery AS C ON A.id_publication = C.id_publication WHERE B.id_user = '$id_user' ORDER BY A.publication_date DESC")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query)>0){
		while ($row = mysqli_fetch_assoc($query)){
			$publications[] = $row;
		}
		$smarty->assign("publication",$publications);
	}

	if(!$query_user = mysqli_query($connection, "SELECT id_user, name, surname, profile_photo, header_photo FROM tbl_users WHERE id_user='$id_user'")){
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
		$user = "There is not data.";
	}

	$smarty->assign("user",$user);

	if(!$query_comments = mysqli_query($connection, "SELECT * FROM tbl_publications_users INNER JOIN tbl_comments ON tbl_publications_users.id_publication = tbl_comments.id_publication INNER JOIN tbl_users ON tbl_comments.id_user = tbl_users.id_user WHERE tbl_publications_users.id_user = '$id_user' ORDER BY tbl_comments.commentDate")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_comments)>0){
		while ($row = mysqli_fetch_assoc($query_comments)){
			$comments[] = $row;
		}
		$smarty->assign("comments",$comments);
	}

	if(!$query_followers = mysqli_query($connection, "SELECT count(*) as followers FROM tbl_friends WHERE id_user='$id_user'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_followers)>0){
		while ($row = mysqli_fetch_assoc($query_followers)){
			$followers = $row['followers'];
		}
		$smarty->assign("followers", $followers);
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

	$smarty -> display('timeline.tpl');
	mysqli_close($connection);
?>