<?php
include 'conn.php';

if($_SERVER['REQUEST_METHOD']=="POST"){

 $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "isi4";

    $conn = new mysqli($servername, $username, $password, $dbname);

$response = array();
$last_name = $_POST['last_name'];
$first_name = $_POST['first_name'];
$email = $_POST['email'];
$password = $_POST['password'];
$profile = $_POST['profile'];

$sql ="SELECT * FROM User WHERE email='$email'";
$result = mysqli_fetch_array(mysqli_query($conn,$sql));

if(isset($result)){

	$response['value']=0;
	$response['message']="Email has been saved";
	echo json_encode($response);
}
else{
	 $Sql = "INSERT INTO User (last_name,first_name,email,password,profile) VALUES ('$last_name', '$first_name','$email','$password','$profile')";
	
	if (mysqli_query($conn,$Sql)) {
		$response['value']=1; 
	$response['message']="valid";
	echo json_encode($response);
		
	} else {
		$response['value']=2; 
	$response['message']="failed";
	echo json_encode($response);
		
	}
	
}




	}

?>