<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$airline = isset($_GET['airline']) ? urldecode($_GET['airline']) : null;

if (!$airline) {
    echo json_encode(["error" => "❌ No airline specified."]);
    exit();
}

$conn = new mysqli("localhost", "root", "admin123", "sky_connect");
if ($conn->connect_error) {
    echo json_encode(["error" => "❌ Database connection failed."]);
    exit();
}

$stmt = $conn->prepare("SELECT * FROM flights WHERE airline = ?");
$stmt->bind_param("s", $airline);
$stmt->execute();
$result = $stmt->get_result();

$flights = [];

while ($row = $result->fetch_assoc()) {
    $flights[] = $row;
}

echo json_encode($flights);

$conn->close();
?>
