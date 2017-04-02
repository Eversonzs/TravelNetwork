<?php
include('config/core.php');

if (!is_logged()){
	header('location: index-register.php');
	die(); 
}

	$id_permissions_admin = $_POST['permission_admin'];
	$id_permissions_active_user = $_POST['permission_active_user'];
	$id_permissions_banned_user = $_POST['permission_banned_user'];
	$id_permissions_moderator = $_POST['permission_moderator'];

	echo "ADMIN: ";
	foreach ($id_permissions_admin as $id_permission_admin) {
		echo $id_permission_admin . "<br>";
	}

	echo "ACTIVE_USER: ";
	foreach ($id_permissions_active_user as $id_permission_active_user) {
		echo $id_permission_active_user . "<br>";
	}
	
	echo "BANNED_USER: ";
	foreach ($id_permissions_banned_user as $id_permission_banned_user) {
		echo $id_permission_banned_user . "<br>";
	}

	echo "MODERATOR: ";
	foreach ($id_permissions_moderator as $id_permission_moderator) {
		echo $id_permission_moderator . "<br>";
	}

?>