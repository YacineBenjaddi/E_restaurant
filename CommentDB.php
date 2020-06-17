<?php
 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "isi4";
    $table = "comments"; 
 
    $action = $_POST["action"];
     

    $conn = new mysqli($servername, $username, $password, $dbname);
   
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
 
   

    if("ADD_COMMENT" == $action){
       
        $title = $_POST["title"];
        $texto = $_POST["texto"];
        $name = $_POST["name"];
        $rating = $_POST["rating"];
        $id_restaurant = $_POST["id_restaurant"];

        $sql = "INSERT INTO $table (title,texto,name,rating,id_restaurant) VALUES ('$title', '$texto','$name','$rating','$id_restaurant')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }


 
   


  
  
 
  

 
?>