<?php
	include ('config/core.php');
	include('config/pagination.php');

	if (!is_logged()){
		header('location: index-register.php');
		die();
	}

	$id_user = filtra($_GET['id_user'], $connection);
	$id_user_logged = $_SESSION['id_user'];

	$string_query_publications = "SELECT * FROM tbl_publications AS A INNER JOIN tbl_publications_users AS B ON A.id_publication = B.id_publication INNER JOIN tbl_users ON tbl_users.id_user = B.id_user INNER JOIN tbl_gallery AS C ON A.id_publication = C.id_publication WHERE B.id_user = '$id_user' ORDER BY A.publication_date DESC";

	if(!$query = mysqli_query($connection, $string_query_publications)){
		$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
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

	if(!$query_average = mysqli_query($connection, "SELECT AVG(valuation) AS average, id_publication FROM tbl_valuations GROUP BY id_publication")){
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

	if(!$query_my_valuations = mysqli_query($connection, "SELECT valuation, id_publication FROM tbl_valuations WHERE id_user='$id_user_logged'")){
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

	$x_pagina=10;

	// Eseguo la paginazione
	$p = new Pagination($connection, $string_query_publications, $x_pagina, "pagina");

	if($record_s = $p->Show()){
	$smarty->assign("publication",$record_s);
	/*passo il numero di righe per decidere se inserire o no la scelta del numero di prodotti per pagina*/
	$smarty->assign("num_tot",mysqli_num_rows($query));
	}

	if($link = $p->link(3)){
		$smarty->assign('_prima',$link['primo']);
		$smarty->assign('_prec',$link['precedente']);
		$smarty->assign('_corr',$link['corrente']);	
		$smarty->assign('_succ',$link['successivo']);     
		$smarty->assign('_ultima',$link['ultimo']);	
	}

	$smarty -> display('timeline.tpl');
	mysqli_close($connection);
?>