<?php
require('config/core.php');

	$logout = $_SESSION['id_user'];
	session_unset();
	session_destroy();
	header('location: index.php');

?>