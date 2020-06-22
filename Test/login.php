<?php
include 'conn.php';
$email=$_POST['email'];
$password=$_POST['password'];

$queryResult=$connect->query("SELECT * FROM User WHERE email='".$email."' and password='".$password."'");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);