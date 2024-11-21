<?php
include 'db.php';

$result = $conn->query("SELECT * FROM propagandas");
$propagandas = [];

while ($row = $result->fetch_assoc()) {
    $propagandas[] = $row;
}

echo json_encode($propagandas);
?>