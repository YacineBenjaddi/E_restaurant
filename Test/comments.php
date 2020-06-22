<?php
include 'conn.php';

$id_restaurant=$_POST['id_restaurant'];

$queryResult=$connect->query("SELECT * FROM comments WHERE id_restaurant ='$id_restaurant'");

$result=array();

while ($fetchData=$queryResult->fetch_assoc()) {
	# code...
	$result[]=$fetchData;
}
echo json_encode($result);
?>