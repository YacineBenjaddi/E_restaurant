<?php
$connect = new mysqli("localhost","root","","isi4");
if ($connect) {
	# code...
} else {
	echo "connection failed";
	exit();
}