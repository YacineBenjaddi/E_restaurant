<?php
$connect = new mysqli("localhost","root","","my_store");
if ($connect) {
	# code...
} else {
	echo "connection failed";
	exit();
}