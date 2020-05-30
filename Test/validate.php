<?php
include 'conn.php';


if($_SERVER['REQUEST_METHOD']=="POST"){

	 $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "isi4";

    $conn = new mysqli($servername, $username, $password, $dbname);

$response = array();
$email = $_POST['email'];
$code = $_POST['code'];


$sql ="SELECT * FROM User WHERE email='$email' and reset='$code' ";
$result = mysqli_fetch_array(mysqli_query($conn,$sql));

if(isset($result)){

	$update = mysqli_query($conn, "UPDATE User SET reset = NULL WHERE email='$email' ");
	$response['value']=1;
	echo json_encode($response);
}
else{

	$response['value']=0;
	$response['message']="Your password code is incorrect";
	echo json_encode($response);
}

}


?>