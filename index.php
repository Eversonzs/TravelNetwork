<?php
include('config/core.php');
	if (is_logged()){
		header('location: newsfeed.php');
		die(); 
	}
	
$smarty -> display('index.tpl');
?>