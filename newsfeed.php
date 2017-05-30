<?php
include('config/core.php');

if (!is_logged()){
		header('location: index-register.php');
		die();
	}

	$id_user = $_SESSION['id_user'];


	if(!$query_publication = mysqli_query($connection, "SELECT * FROM tbl_friends INNER JOIN tbl_users ON tbl_friends.id_user = tbl_users.id_user  INNER JOIN tbl_publications_users ON tbl_publications_users.id_user = tbl_users.id_user INNER JOIN tbl_publications ON tbl_publications.id_publication = tbl_publications_users.id_publication INNER JOIN tbl_gallery ON tbl_gallery.id_publication = tbl_publications.id_publication WHERE tbl_friends.id_friend='$id_user' ORDER BY tbl_publications.publication_date DESC")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if (mysqli_num_rows($query_publication)>0){
		while ($row = mysqli_fetch_assoc($query_publication)){
			$publications[] = $row;
		}
		$smarty->assign("publication", $publications);
	}

	if(!$query_user = mysqli_query($connection, "SELECT id_user, name, surname, profile_photo FROM tbl_users WHERE id_user='$id_user'")){
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

	if(!$query_comments = mysqli_query($connection, "SELECT * FROM tbl_publications_users INNER JOIN tbl_comments ON tbl_publications_users.id_publication = tbl_comments.id_publication INNER JOIN tbl_users ON tbl_comments.id_user = tbl_users.id_user ORDER BY tbl_comments.commentDate ASC")){
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

	if(!$query_average = mysqli_query($connection, "SELECT AVG(valuation) AS average, id_publication FROM tbl_valuations GROUP BY  id_publication")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if(mysqli_num_rows($query_average)>0){
		while ($row = mysqli_fetch_assoc($query_average)){
			$average[] = $row;
		}
		$smarty->assign("average",$average);
	}

	if(!$query_my_valuations = mysqli_query($connection, "SELECT valuation, id_publication FROM tbl_valuations WHERE id_user='$id_user'")){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if(mysqli_num_rows($query_my_valuations)>0){
		while ($row = mysqli_fetch_assoc($query_my_valuations)){
			$my_valuations[] = $row;
		}
		$smarty->assign("my_valuations",$my_valuations);
	}

	$smarty -> display('newsfeed.tpl');
	mysqli_close($connection);
?>