<?php

require('config/core.php');
if(is_logged()){
	            header('location: newsfeed.php');
				die();
			}

/* PARTE DELL�INVIO EMAIL. Si controlla che l'email (=user) sia presente nel db. Estraggo quindi id e password dell'utente e li unisco in un'unica stringa ($hash) da passare nel $_GET. La stringa su cui cliccare � inviata per email, come conferma, e rinvia al file �nuova_password.php�. */
if(isset($_POST['check'])){

	if($_POST['email']==""){
		$smarty->assign('message','ERROR: Insert the email address used for registration.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		 
	}else{
	
	$email=filtra($_POST['email'], $connection);
	
	if(!$query_dati = mysqli_query($connection, "SELECT id_user, email, user_name, user_password FROM tbl_users WHERE upper(email)=upper('$email')")){
			$smarty->assign('message','ERROR: This email does not exist on the data base!'.mysqli_error($connection));
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		} 

		if(mysqli_num_rows($query_dati)>0){
			$row=mysqli_fetch_assoc($query_dati);

			//l�hash ci servir� per recuperare i dati utente e confermare la richiesta
			//la password nel database si presume criptata, con md5 o altro algoritmo
			//al posto di questi due dati, se ne possono usare altri legati all�utente, purch� univoci
			
			
			
			$hash=$row['user_password']."".$row['id_user'];

		}else{
			$smarty->assign('message','ERROR: This email does not exist on the data base.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
	

	}
	
	


		$header= "From: travelsocialnetwork.com <admintravelnetwork@travelsocialnetwork.com>\n";
		$header .= "Content-Type: text/html; charset=\"iso-8859-1\"\n";
		$header .= "Content-Transfer-Encoding: 7bit\n\n";

		$subject= "travelsocialnetwork.com - new password";

		$mess_invio="<html><body>";
		$mess_invio.="Dear user<br /><br />As you requested we actived the procedures for the recovery your password.<br /><br />Your username is: ".$row['user_name']." <br /><br />If you forgot your password, please click here <a href='www.travelsocialnetwork.altervista.org/newpassword.php?hash=".$hash."'> link </a> for confirmation of the new password requested.<br /> If the link is not active please copy and paste this link listed below in your browser : <br /><br />http://www.travelsocialnetwork.altervista.org/newpassword.php?hash=".$hash." <br /><br />Thanks<br />";
		$mess_invio.='</body><html>';

		//invio email
		if(mail($email, $subject, $mess_invio, $header)){

			$smarty->assign('message','We have sent a message to your email address.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();

		}else{
		$smarty->assign('message','email funtion is not working.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();}

}
}else{
$smarty->assign('message','ERROR: Operation is not allow from the server, please try again later.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		 
	}

mysqli_close($connection);	
	?>
