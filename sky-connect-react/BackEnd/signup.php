<?php
session_start();

// Allow CORS from React dev server (adjust if needed)
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["success" => false, "message" => "Invalid request method."]);
    exit();
}

// DB connection
$conn = new mysqli("localhost", "root", "admin123", "sky_connect", 3306);
if ($conn->connect_error) {
    echo json_encode(["success" => false, "message" => "Database connection failed."]);
    exit();
}

// Get JSON payload from fetch()
$rawData = file_get_contents("php://input");
$data = json_decode($rawData, true);

// Sanitize input
$name = isset($data["name"]) ? trim($data["name"]) : '';
$email = isset($data["email"]) ? trim($data["email"]) : '';
$password = isset($data["password"]) ? $data["password"] : '';
$confirm = isset($data["confirm_password"]) ? $data["confirm_password"] : '';

// Validate
if (!$name || !$email || !$password || !$confirm) {
    echo json_encode(["success" => false, "message" => "Please fill in all fields."]);
    exit();
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["success" => false, "message" => "Invalid email format."]);
    exit();
}

if ($password !== $confirm) {
    echo json_encode(["success" => false, "message" => "Passwords do not match."]);
    exit();
}

// Check if email already exists
$check = $conn->prepare("SELECT id FROM users WHERE email = ?");
$check->bind_param("s", $email);
$check->execute();
$check->store_result();

if ($check->num_rows > 0) {
    $check->close();
    echo json_encode(["success" => false, "message" => "Email already registered."]);
    exit();
}
$check->close();

// Insert new user
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
$stmt = $conn->prepare("INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $name, $email, $hashedPassword);

if ($stmt->execute()) {
    $_SESSION['user_name'] = $name;
    echo json_encode(["success" => true, "name" => $name]);
} else {
    echo json_encode(["success" => false, "message" => "Signup failed. Please try again later."]);
}

$stmt->close();
$conn->close();
?>
