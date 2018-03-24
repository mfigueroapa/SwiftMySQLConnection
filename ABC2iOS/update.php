<?php
$servername = "localhost";
$username = "user";
$password = "password";
$dbname = "stringsdb";
$parameter1 = $_POST['parameter1'];
$parameter2 = $_POST['parameter2'];


// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "UPDATE `strings` SET `string`='$parameter2' WHERE `string` = '$parameter1'";
// UPDATE `strings` SET `string`='datonuevo' WHERE `string` = 'dato2'

if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>