
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

$length = 6;
$randomString = substr(str_shuffle("0123456789"),0, $length);


$sql ="SELECT * FROM User WHERE email='$email'";
$result = mysqli_fetch_array(mysqli_query($conn,$sql));

if(isset($result)){

	$update = mysqli_query($conn, "UPDATE User SET reset ='$randomString' WHERE email='$email' ");
	$response['value']=1;
	echo json_encode($response);
}
else{
	$response['value']=0;
	$response['message']="Your email is introvable";
	echo json_encode($response);
}

}


?>
