<?php
session_start();

header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Parse raw JSON input
    $rawData = file_get_contents("php://input");
    $data = json_decode($rawData, true);

    $email = isset($data["email"]) ? trim($data["email"]) : "";
    $password = isset($data["password"]) ? $data["password"] : "";

    if (empty($email) || empty($password)) {
        echo json_encode(array("success" => false, "message" => "Please enter both email and password"));
        exit();
    }

    $conn = new mysqli("localhost", "root", "admin123", "sky_connect", 3306);
    if ($conn->connect_error) {
        echo json_encode(array("success" => false, "message" => "Database connection failed"));
        exit();
    }

    $stmt = $conn->prepare("SELECT name, password_hash FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows === 1) {
        $stmt->bind_result($name, $hash);
        $stmt->fetch();

        if (password_verify($password, $hash)) {
            $_SESSION['user_name'] = $name;
            echo json_encode(array("success" => true, "name" => $name));
        } else {
            echo json_encode(array("success" => false, "message" => "Incorrect password"));
        }
    } else {
        echo json_encode(array("success" => false, "message" => "Email not found"));
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(array("success" => false, "message" => "Invalid request"));
}
?>


