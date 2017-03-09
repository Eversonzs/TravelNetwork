<?php
include('config/core.php');

	if (is_logged()){
		header('location: newsfeed.php');
		die(); 
	}

	if(isset($_POST['check'])){	
		if($_POST['firstname'] == '' || $_POST['lastname'] == '' || $_POST['username'] == ''|| $_POST['Email'] == ''|| $_POST['password'] == ''){
			$smarty->assign('error','ERRORE: Riempire tutti i campi obbligatori');
			$smarty->display('error.tpl');
			die();//termina lo script php
		}

		$email = filtra($_POST['Email'], $connection); 
		if(!$query = mysqli_query($connection, "SELECT id_user from tbl_users WHERE email='$email'")){
		    $smarty->assign('error','ERRORE: Errore durante la query, riprova!'.mysql_error());
			$smarty->display('error.tpl');
			mysqli_close($connection);
			die();
		}
		if(mysqli_num_rows($query) > 0){
			$smarty->assign('error','ERRORE: Email non disponibile');
			$smarty->display('error.tpl');
			mysqli_close($connection);
			die();
		}

		$name = filtra($_POST['firstname'], $connection);
		$surname = filtra($_POST['lastname'], $connection);
		$user_name = filtra($_POST['username'], $connection);
		$email = filtra($_POST['Email'], $connection);
		$user_password = filtra($_POST['password'], $connection);

		if(!mysqli_query($connection, "INSERT INTO tbl_users (user_name, user_password, name, surname, email) VALUES ('$user_name','$user_password','$name', '$surname', '$email')")){
			$smarty->assign('error','ERRORE: Errore durante la registrazione, riprova!');
			$smarty->display('error.tpl');
			mysqli_close($connection);
			die();
		}

		$smarty->assign('error','You are now register.');
		$smarty->display('error.tpl');
		mysqli_close($connection);
		die();

		//header('location: newsfeed.php');

	}

?>