<?php
 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "isi4";
    $table = "User"; // lets create a table named Employees.
 
    // we will get actions from the app to do operations in the database...
    $action = $_POST["action"];
     
    // Create Connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
 
    // If connection is OK...
 
    // If the app sends an action to create the table...
    if("CREATE_TABLE" == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table ( 
            id_user INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            nom VARCHAR(30) NOT NULL,
            prenom VARCHAR(30) NOT NULL,
            email VARCHAR(30) NOT NULL,
            password VARCHAR(30) NOT NULL,
            profil VARCHAR(30) NOT NULL
            )";
 
        if($conn->query($sql) === TRUE){
            // send back success message
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Get all employee records from the database
    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT id_user,nom,prenom,email,password,profil from $table ORDER BY id_user DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Add an Employee
    if("ADD_USER" == $action){
        // App will be posting these values to this server
        $nom = $_POST["nom"];
        $prenom = $_POST["prenom"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $profil = $_POST["profil"];

        $sql = "INSERT INTO $table (nom,prenom,email,password,profil) VALUES ('$nom', '$prenom','$email','$password','$profil')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }
 
    // Remember - this is the server file.
    // I am updating the server file.
    // Update an Employee
    if("UPDATE_USER" == $action){
        // App will be posting these values to this server
        $id_user = $_POST['id_user'];
        $nom = $_POST["nom"];
        $prenom = $_POST["prenom"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $profil= $_POST["profil"];
        $sql = "UPDATE $table SET nom = '$nom', prenom = '$prenom' , email = '$email', password = '$password' , profil = '$profil' WHERE id_user = $id_user";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Delete an Employee
    if('DELETE_USER' == $action){
        $id_user = $_POST['id_user'];
        $sql = "DELETE FROM $table WHERE id_user = $id_user"; // don't need quotes since id is an integer.
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
?>