<?php
	include("config/core.php");

	if (!is_logged()){
		header('location: index-register.php');
		die(); 
	}

	$id_user = $_SESSION['id_user'];
	$description_publication = filtra($_POST['description'], $connection);
	$page = filtra($_POST['page'], $connection);

	if(check_permission($connection, "write") && $description_publication !=""){
		///Start upload image
		if (is_uploaded_file($_FILES['image']['tmp_name'])) {
	    // Controllo che il file non superi i 2 MByte
	    	if ($_FILES['image']['size'] > 2097152) {
	      	    $smarty->assign('message','ERROR: The image size is big, does not to have to overcome 2 mb.');
				$smarty->display('message.tpl');
				mysql_close($connection);
				die();
	    	}

			// Ottengo le informazioni sull'immagine
		    list($width, $height, $type, $attr) = getimagesize($_FILES['image']['tmp_name']);
		    // Controllo che il file sia in uno dei formati JPG 
		    if ($type!=2){
		    	$smarty->assign('message','ERROR: Image format not supported, it should be .JPG, try again.');
				$smarty->display('message.tpl');
				mysql_close($connection);
				die();
		    }

		    if (file_exists('images/post-images/'.$_FILES['image']['name'])) {
		            $smarty->assign('message','ERROR: File already exists in the directory, rename it and try again.');
					$smarty->display('message.tpl');
					mysql_close($connection);
					die();
		    }

		    if (!move_uploaded_file($_FILES['image']['tmp_name'], 'images/post-images/'.$_FILES['image']['name'])) {
		        $smarty->assign('message','ERROR: A problem has occurred, please try again.');
				$smarty->display('message.tpl');
				mysql_close($connection);
				die();
		    } 

			$image_name = $_FILES['image']['name'];//creazione preview con GD library
		    $new_width=240;      //Larghezza immagine ridimensionata
		    $new_height=240;      //Altezza immagine ridimensionata
		    $compression=100;      //Compressione dell'immagine jpg
		    $source_path='C:/wamp64/www/travel_network/images/post-images/';      //Diretory dove si trova il file di cui volgiamo fare la preview
		    $destination_path='C:/wamp64/www/travel_network/images/post-images/images-resized/';      //diretory dove vogliamo salvare l'immagine di preview
		    global $source_path;
		    global $destination_path;
		    global $new_width;
		    global $new_height;
		    $destimg=imagecreatetruecolor($new_width,$new_height) or die("A problem has occurred creating the image.");
		    $srcimg=ImageCreateFromJPEG($source_path.$image_name) or die("A problem has occurred opening the image.");
		    ImageCopyResized($destimg,$srcimg,0,0,0,0,$new_width, $new_height,ImageSX($srcimg),ImageSY($srcimg)) or die("Problem during the resized.");
			ImageJPEG($destimg,$destination_path.$image_name, $compression) or die("Problem to save.");
		}

		///End upload image

		if(isset($image_name) == ""){
			$smarty->assign('message', 'ERROR: You have to upload an image with the publication.');
			$smarty->display('message.tpl');
			mysqli_close($connection);
			die();
		}else{
			if(!$query_insert = mysqli_query($connection, "INSERT INTO tbl_publications(id_location, description, publication_date, valuation, address) VALUES(1, '$description_publication', DATE_FORMAT(NOW(),'%Y-%c-%d'), 0, 'L\'Aquila')")){
				$smarty->assign('message', 'ERROR: SQL error trying to publish. ' .mysqli_error($connection));
				$smarty->display('message.tpl');
				mysqli_close($connection);
				die();
			}

			$id_publication = mysqli_insert_id($connection);

			if(!$query_user_publication = mysqli_query($connection, "INSERT INTO tbl_publications_users(id_publication, id_user) VALUES('$id_publication', '$id_user')")){
					$smarty->assign('message', 'ERROR: SQL error trying to publish. ' .mysqli_error($connection));
					$smarty->display('message.tpl');
					mysqli_close($connection);
					die();
				}

			if(!mysqli_query($connection, "INSERT INTO tbl_gallery (id_publication, file) VALUES('$id_publication','$image_name')")){
				$smarty->assign('message','ERROR: Error uploading image, failed to save to database.');
				$smarty->display('message.tpl');
				mysql_close($connection);
				die();
			}
		}

	} else{
		$smarty->assign('message','ERROR: You are not enable to publish or the publication is empty! '.mysqli_error($connection));
		$smarty->display('message.tpl');
		mysqli_close($connection);
		die();
	}

	if($page == "newsfeed"){
		header('location: newsfeed.php');
	} else{
		header('location: timeline.php?id_user='."$id_user".'');
	}

	mysqli_close($connection);
	die();

	$smarty -> display('newsfeed.tpl');

?>