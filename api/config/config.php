<?php
$host = "localhost";
$user = "root";
$password = "";
$db_name ="isi4";

$conn = mysqli_connect($host, $user, $password, $db_name);

if (!$conn) {
	echo "could not connected";
}

?>