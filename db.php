<?php
$servername = "localhost";
$username = "root";
$password = "Tejal123";
$dbname = "Docverifiers";

$conn = new mysqli($localhost, $root, $Tejal123, $Docverifiers);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
