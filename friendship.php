<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user_logged = $_SESSION['id_user'];
	$id_user = filtra($_REQUEST['id_user'], $connection);
	$follow = filtra($_REQUEST['follow'], $connection);

	if(check_permission($connection, "friend_request")){
		if(!$query = mysqli_query($connection, "SELECT * FROM tbl_friends WHERE id_user='$id_user' AND id_friend='$id_user_logged'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if (mysqli_num_rows($query)<=0){

			if($follow=="follow"){
				if(!$query_follow = mysqli_query($connection, "INSERT INTO tbl_friends(id_user, id_friend, friendship_date) VALUES('$id_user', '$id_user_logged',DATE_FORMAT(NOW(),'%Y-%c-%d'))")){
					$smarty->assign('message', 'ERROR: SQL error trying to follow, please try again. ' .mysqli_error($connection));
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
				}
			}
		}

		if(mysqli_num_rows($query)>0) {

			if ($follow=="unfollow") {
				if(!$query_unfollow = mysqli_query($connection, "DELETE FROM tbl_friends WHERE id_user='$id_user' AND id_friend='$id_user_logged'")){
					$smarty->assign('message', 'ERROR: SQL error trying to unfollow, please try again. ' .mysqli_error($connection));
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
				}
			}
		}

		header('location: timeline.php?id_user='."$id_user".'');
	}

	mysqli_close($connection);
	die();

	$smarty -> display('timeline.tpl');

?>