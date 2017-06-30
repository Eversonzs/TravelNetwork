<?php
//il controllo del get evita errori di pagina
require('config/core.php');

if(is_logged()){
	            header('location: newsfeed.php');
				die();
			}


if(isset($_GET['hash'])){

	$hash=$_GET['hash'];

	$id=substr($hash, 40);
	$password_old=substr($hash, 0, 40);

	$password=my_random(); //new password of 8 character.

	//controllo che i valori dell�hash corrispondano ai valori salvati nel database
	$result=mysqli_query($connection, "SELECT * FROM tbl_users WHERE id_user=".$id." AND user_password='".$password_old."'");

	if(mysqli_num_rows($result)>0){ 

		$row=mysqli_fetch_array($result);

		$email=$row['email'];

		//salvo la nuova password al posto della vecchia (in md5)
		if(!$result=mysqli_query($connection, "UPDATE tbl_users SET user_password='".sha1(md5($password))."' WHERE id_user=".$id." AND user_password='".$password_old."'")){
		    $smarty->assign('message','ERROR: Query error, try again!'.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

		$header= "From: travelsocialnetwork.com <admintravelnetwork@travelsocialnetwork.com>\n";
		$header .= "Content-Type: text/html; charset=\"iso-8859-1\"\n";
		$header .= "Content-Transfer-Encoding: 7bit\n\n";

		$subject= "travelsocialnetwork.com - new password";

		$mess_invio="<html><body>";
		$mess_invio.="Dear user <br /><br /> Your new password is: ".$password."<br /> Now you can loggin in the next page. <a href=\"http://travelsocialnetwork.altervista.org/index-register.php\" style=\"color: red\">Login</a>.<br /><br />Thanks ";
		$mess_invio.='</body><html>';

		if(mail($email, $subject, $mess_invio, $header)){
		$smarty->assign('message','We have sent a message to your email address.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}

	}else{
	$smarty->assign('message','ERROR: Some information was wrong to recive a new password!');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
	
	}

}else{
$smarty->assign('message','ERROR: There is a problem with the hash!');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
}

mysqli_close($connection);
?>
