<?php
include ('config/core.php');

	if (isset($_POST['check'])){
		$smarty->assign('name',$_POST['name']);
		$smarty->assign('email',$_POST['email']);
		$smarty->assign('password',$_POST['password']);
		$smarty->assign('register',1);
		$smarty->display('index-register.tpl');
	}
?>