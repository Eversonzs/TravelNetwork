<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];

	if(check_permission($connection, "write")){
		if ($_FILES['image']['tmp_name'] != null){
			//Start upload image
			if(!$query_header_photo=mysqli_query($connection, "SELECT id_user, header_photo FROM tbl_users WHERE id_user='$id_user'")){
		      	$smarty->assign('message','ERROR: something was wrong, try again!');
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}
	      	
			$header_photo_name = mysqli_fetch_assoc($query_header_photo);

	      	if(mysqli_num_rows($query_header_photo)>0 AND $header_photo_name["header_photo"]!=""){
			    $avatar_fetch = mysqli_fetch_assoc($query_header_photo);
				$dir="C:/wamp64/www/travel_network/images/covers";
				$im=$avatar_fetch["header_photo"];
			    $delete_immagine="$dir/$im"; 
			    unlink($delete_immagine);
			    $dir="C:/wamp64/www/travel_network/images/covers/images-resized";
				$delete_immagine="$dir/$im"; 
				unlink($delete_immagine);
			}	 

			if (is_uploaded_file($_FILES['image']['tmp_name'])) {
		    // Controllo che il file non superi i 2 MByte
		    	if ($_FILES['image']['size'] > 2097152) {
		      	    $smarty->assign('message','ERROR: The image size is big, does not to have to overcome 2 mb.');
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
		    	}

				// Ottengo le informazioni sull'immagine
			    list($width, $height, $type, $attr) = getimagesize($_FILES['image']['tmp_name']);
			    // Controllo che il file sia in uno dei formati JPG 
			    if ($type!=2){
			    	$smarty->assign('message','ERROR: Image format not supported, it should be .JPG, try again.');
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
			    }

			    if (file_exists('images/covers/'.$_FILES['image']['name'])) {
			            $smarty->assign('message','ERROR: File already exists in the directory, rename it and try again.');
						$smarty->display('message.tpl');
						mysqli_close($connection);
						die();
			    }

			    $RandomName = uniqid('uploaded-', true).'.'.strtolower(pathinfo($_FILES['image']['name'],PATHINFO_EXTENSION));

			    if (!move_uploaded_file($_FILES['image']['tmp_name'], 'images/covers/'.$RandomName)){
			        $smarty->assign('message','ERROR: A problem has occurred, please try again.');
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
			    }

				$image_name = $RandomName;//creazione preview con GD library
			    $new_width=240;      //Larghezza immagine ridimensionata
			    $new_height=240;      //Altezza immagine ridimensionata
			    $compression=100;      //Compressione dell'immagine jpg
			    $source_path='C:/wamp64/www/travel_network/images/covers/';      //Diretory dove si trova il file di cui volgiamo fare la preview
			    $destination_path='C:/wamp64/www/travel_network/images/covers/images-resized/';      //diretory dove vogliamo salvare l'immagine di preview
			    global $source_path;
			    global $destination_path;
			    global $new_width;
			    global $new_height;
			    $destimg=imagecreatetruecolor($new_width,$new_height) or die("A problem has occurred creating the image.");
			    $srcimg=ImageCreateFromJPEG($source_path.$image_name) or die("A problem has occurred opening the image.");
			    ImageCopyResized($destimg,$srcimg,0,0,0,0,$new_width, $new_height,ImageSX($srcimg),ImageSY($srcimg)) or die("Problem during the resized.");
				ImageJPEG($destimg,$destination_path.$image_name, $compression) or die("Problem to save.");

				if(!$query_header_photo=mysqli_query($connection, "UPDATE tbl_users SET header_photo='$image_name' WHERE id_user='$id_user'")){
			      	$smarty->assign('message','ERROR: something was wrong, try again!');
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
				}

				$_SESSION['header_photo'] = $RandomName;

			} else{
		      	$smarty->assign('message','ERROR: The image size is big, does not to have to overcome 2 mb.');
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}
			//End upload image

		}else{
			$smarty->assign('message','ERROR: You have to select one image to upload.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}
	}

	header('location: timeline.php?id_user='."$id_user".'');

	mysqli_close($connection);
	die();

	$smarty -> display('timeline.tpl');

?>