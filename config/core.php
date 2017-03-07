
<?php


require('config/config.php');
require('Smarty/libs/Smarty.class.php');

/* Caricamento librerie smarty e creazione istanza */
class Setup_Smarty extends Smarty{
	function Setup_Smarty()
	{
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
	if(mysqli_connect_errno())
	{
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
	}

	session_start(); # conexion iniciada para cualquiera.

	function is_logged()
	{
	 global $smarty;
	 if(isset($_SESSION['id_user']))
	 	return 1;
	 else
	 	return 0;
	 }

	function filtra( $var, $connection )
	{
 		return htmlentities(mysqli_real_escape_string( $connection, $var ));
	}

?>