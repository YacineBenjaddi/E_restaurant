<?php
include "../config/config.php";

$result =array();

$queryRestau="SELECT * FROM restaurant";

$queryResult = mysqli_query($conn, $queryRestau);

while($row = mysqli_fetch_assoc($queryResult)){
	//$result=$row; 
	array_push($result, $row);

	
}

echo json_encode($result);

?>