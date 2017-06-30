<?php
	
	// PHP5 Implementation - uses MySQLi.
	// mysqli('localhost', 'yourUsername', 'yourPassword', 'yourDatabase');
require('config/core.php');
	
	$id_user = filtra($_SESSION['id_user'], $connection);
	
		// Is there a posted query string?
		if(isset($_POST['queryString'])) {
			$value = filtra($_POST['queryString'] , $connection);
			
			// Is the string length greater than 0?
			
			if(strlen($value) >0) {
				// Run the query: We use LIKE '$queryString%'
				// The percentage sign is a wild-card, in my example of countries it works like this...
				// $queryString = 'Uni';
				// Returned data = 'United States, United Kindom';
				
				// YOU NEED TO ALTER THE QUERY TO MATCH YOUR DATABASE.
				// eg: SELECT yourColumnName FROM yourTable WHERE yourColumnName LIKE '$queryString%' LIMIT 10
				if(isset($_SESSION['id_user'])){
				$query = mysqli_query($connection, "SELECT tbl_users.id_user, tbl_users.user_name, tbl_users.name, tbl_users.surname FROM tbl_users INNER JOIN tbl_friends ON tbl_users.id_user = tbl_friends.id_friend WHERE upper(tbl_users.user_name) LIKE upper('%$value%') OR upper(tbl_users.name) LIKE upper('%$value%') OR upper(tbl_users.surname )LIKE upper('%$value%') OR upper(tbl_users.email) LIKE upper('%$value%') AND tbl_friends.id_user='$id_user' ORDER BY tbl_users.user_name DESC LIMIT 10");
				if(mysqli_num_rows($query)>0) {
					// While there are results loop through them - fetching an Object (i like PHP5 btw!).
					while ($result= mysqli_fetch_assoc($query)) {
						// Format the results, im using <li> for the list, you can change it.
						// The onClick function fills the textbox with the result.
						
						// YOU MUST CHANGE: $result->value to $result->your_colum

	         			echo '<li onClick="fill(\''.$result["user_name"].'\');"><a href="timeline.php?id_user='.$result["id_user"].'" >'.$result["user_name"].'</a></li>';
						}
				}
				
					$query2 =mysqli_query($connection, "SELECT tbl_users.id_user, tbl_users.user_name, tbl_users.name, tbl_users.surname FROM tbl_users INNER JOIN tbl_friends ON tbl_users.id_user = tbl_friends.id_user WHERE upper(tbl_users.user_name) LIKE upper('%$value%') OR upper(tbl_users.name) LIKE upper('%$value%') OR upper(tbl_users.surname )LIKE upper('%$value%') OR upper(tbl_users.email) LIKE upper('%$value%') AND tbl_friends.id_friend='$id_user' ORDER BY tbl_users.user_name DESC LIMIT 10");
				if(mysqli_num_rows($query2)>0) {
					// While there are results loop through them - fetching an Object (i like PHP5 btw!).
					while ($result2= mysqli_fetch_assoc($query2)) {
						// Format the results, im using <li> for the list, you can change it.
						// The onClick function fills the textbox with the result.
						
						// YOU MUST CHANGE: $result->value to $result->your_colum
                        
	         			echo '<li onClick="fill(\''.$result2["user_name"].'\');"><a href="timeline.php?id_user='.$result2["id_user"].'">'.$result2["user_name"].'</a></li>';
						}
				}

				
					$query4 =mysqli_query($connection, "SELECT * FROM tbl_users WHERE upper(tbl_users.user_name) LIKE upper('%$value%') OR upper(tbl_users.name) LIKE upper('%$value%') OR upper(tbl_users.surname) LIKE upper('%$value%') OR upper(tbl_users.email) LIKE upper('%$value%') ORDER BY tbl_users.user_name DESC LIMIT 10");
				if(mysqli_num_rows($query4)>0) {
					// While there are results loop through them - fetching an Object (i like PHP5 btw!).
					while ($result4= mysqli_fetch_assoc($query4)) {
						// Format the results, im using <li> for the list, you can change it.
						// The onClick function fills the textbox with the result.
						
						// YOU MUST CHANGE: $result->value to $result->your_colum

	         			echo '<li onClick="fill(\''.$result4["user_name"].'\');"><a href="timeline.php?id_user='.$result4["id_user"].'">'.$result4["user_name"].'</a>  <a>'.$result4["name"].'</a></li>';
						}
				}
			}
  
			} else {
				// Dont do anything.
			} // There is a queryString.
		} else {
			echo 'There should be no direct access to this script!';
		}
	mysqli_close($connection);
?>
