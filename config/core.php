<?php

require('config/config.php');
require('Smarty/libs/Smarty.class.php');

/* Caricamento librerie smarty e creazione istanza */
class Setup_Smarty extends Smarty{
	function Setup_Smarty(){
		parent::__construct();
		$this->template_dir = 'Smarty/templates/';
		$this->compile_dir = 'Smarty/templates_c/';
		$this->config_dir = 'Smarty/configs/';
		$this->cache_dir = 'Smarty/cache/';
		$this->caching = false;
		$this->assign('app_name', 'travel_network'); // project name
	}
}

//creo l'istanza
$smarty = new Smarty;
$smarty = new Setup_Smarty();
/* fine caricamento smarty 
--------------------------------------------------------------------------------------------------------------------------*/

// NOTA: una vez que tenemos el objeto Smarty debemos tener nuestro index.tpl en nuestra carpeta templates dentro de smarty

	$connection = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

	if(mysqli_connect_errno()){
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

	session_start(); #conexion iniciada para cualquiera.

	function is_logged(){
	 if(isset($_SESSION['id_user']))
	 	return 1;
	 else
	 	return 0;
	 }

	function my_random(){
	    $lunghezza=8;
		$caratteri_disponibili ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		$codice = "";
		for($i = 0; $i<$lunghezza; $i++){
			$codice = $codice.substr($caratteri_disponibili,rand(0,strlen($caratteri_disponibili)-1),1);
	}
		return $codice;
	}

	function check_permission($connection, $permission){
		if(isset($_SESSION['id_user'])){
			$id_user = $_SESSION['id_user'];
			if(!$result = mysqli_query($connection, "SELECT * FROM tbl_users_groups INNER JOIN tbl_permissions_groups ON tbl_users_groups.id_group = tbl_permissions_groups.id_group INNER JOIN tbl_permissions ON tbl_permissions_groups.id_permission = tbl_permissions.id_permission WHERE id_user='$id_user' AND permission='$permission'")){
				$smarty->assign("message", "ERROR: SQL error " . mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			if (mysqli_num_rows($result)>0)
				return 1;
			else
				return 0;
		}
	}

	if (is_logged()){
		if (check_permission($connection, "write")){
			$smarty->assign("write", 1);
		}

		if (check_permission($connection, "comment")){
			$smarty->assign("comment", 1);
		}

		if (check_permission($connection, "read")){
			$smarty->assign("read", 1);
		}

		if (check_permission($connection, "friend_request")){
			$smarty->assign("friend_request", 1);
		}

		if (check_permission($connection, "modify_publication")){
			$smarty->assign("modify_publication", 1);
		}

		if (check_permission($connection, "modify_comment")){
			$smarty->assign("modify_comment", 1);
		}

		if (check_permission($connection, "modify_location")){
			$smarty->assign("modify_location", 1);
		}

		if (check_permission($connection, "delete_publication")){
			$smarty->assign("delete_publication", 1);
		}

		if (check_permission($connection, "delete_comment")){
			$smarty->assign("delete_comment", 1);
		}

		if (check_permission($connection, "delete_location")){
			$smarty->assign("delete_location", 1);
		}

		if (check_permission($connection, "delete_user")){
			$smarty->assign("delete_user", 1);
		}

		if (check_permission($connection, "delete_group")){
			$smarty->assign("delete_group", 1);
		}

		if (check_permission($connection, "delete_moderator")){
			$smarty->assign("delete_moderator", 1);
		}

		if (check_permission($connection, "valuation")){
			$smarty->assign("valuation", 1);
		}

		if (check_permission($connection, "modify_valuation")){
			$smarty->assign("modify_valuation", 1);
		}

		if (check_permission($connection, "delete_valuation")){
			$smarty->assign("delete_valuation", 1);
		}
	}

	function filtra($var, $connection){
 		return htmlentities(mysqli_real_escape_string($connection, $var));
	}

?>