<?php
	include('config/core.php');

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];
	$id_publication = filtra($_POST['id_publication'], $connection);
	$valuation = filtra($_POST['valuation'], $connection);

	if (check_permission($connection, "valuation")){
		if(!$query_valuation = mysqli_query($connection, "SELECT * FROM tbl_valuations WHERE id_user='$id_user' AND id_publication='$id_publication'")){
			$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		if(mysqli_num_rows($query_valuation)>0){
			if(!$query_update_valuation = mysqli_query($connection, "UPDATE tbl_valuations SET valuation='$valuation', valuation_date=DATE_FORMAT(NOW(),'%Y-%c-%d') WHERE id_user='$id_user' AND id_publication='$id_publication'")){
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}
		} else{
			if(!$query_insert_valuation = mysqli_query($connection, "INSERT INTO tbl_valuations(id_user, id_publication, valuation, valuation_date) VALUES('$id_user', '$id_publication', '$valuation', DATE_FORMAT(NOW(),'%Y-%c-%d'))")){
				$smarty->assign('message','ERROR: SQL error, try again! '.mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}
		}

		
		if(!$query_average = mysqli_query($connection, "SELECT AVG(valuation) AS average, id_publication FROM tbl_valuations WHERE id_publication='$id_publication' GROUP BY  id_publication")){
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

	} else{
		$smarty->assign('message','ERROR: You are not able to give a valuation! ');
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	mysqli_close($connection);
	die();

	$smarty -> display('newsfeed.tpl');

?>