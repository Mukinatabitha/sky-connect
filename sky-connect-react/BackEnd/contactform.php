<?php
header("Content-Type: application/json");
session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Read JSON input
    $rawData = file_get_contents("php://input");
    $data = json_decode($rawData, true);

    if (!is_array($data)) {
        echo json_encode(["success" => false, "message" => "Invalid JSON input."]);
        exit();
    }

    // Sanitize input
    $name = trim($data["name"] ?? "");
    $email = trim($data["email"] ?? "");
    $message = trim($data["message"] ?? "");

    if (empty($name) || empty($email) || empty($message)) {
        echo json_encode(["success" => false, "message" => "Please fill out all fields."]);
        exit();
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["success" => false, "message" => "Invalid email address."]);
        exit();
    }

    // DB connection
    $conn = new mysqli("localhost", "root", "admin123", "sky_connect", 3306);

    if ($conn->connect_error) {
        echo json_encode(["success" => false, "message" => "Database connection failed."]);
        exit();
    }

    // Insert into DB
    $stmt = $conn->prepare("INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $message);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Message sent successfully!"]);
    } else {
        echo json_encode(["success" => false, "message" => "Failed to send message."]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
}

