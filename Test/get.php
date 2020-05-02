<?php
include 'conn.php';
$email=$_POST['email'];

$queryResult=$connect->query("SELECT * FROM User WHERE email='".$email."' ");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	
	$result[]=$fetchData;
}
echo json_encode($result);