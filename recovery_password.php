<?php
include('config/core.php');

	if (is_logged())
	{
		header('location: newsfeed.php');
		die(); 
	}

	if( isset($_POST['check'])){
		
	}

$smarty -> display('recovery_password.tpl');

?>