<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "admin123", "sky_connect", 3306);

if ($conn->connect_error) {
    echo json_encode(["error" => "❌ Database connection failed."]);
    exit();
}

$sql = "SELECT DISTINCT airline FROM flights ORDER BY airline ASC";
$result = $conn->query($sql);

$airlines = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $airlines[] = $row['airline'];
    }
}

echo json_encode($airlines);

$conn->close();
?>

