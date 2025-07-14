✈️ SkyConnect – Flight Booking Web Application

SkyConnect is a full-stack flight aggregator and booking platform that allows users to sign up, browse airlines, view flight details, and complete flight bookings. It is built using **React** for the frontend and **PHP + MySQL** for the backend, with XAMPP used to serve backend APIs locally.

Project Structure

SkyConnect/
├── frontend/ # React-based user interface
│ ├── pages/ # Home, About, Contact, SignIn, SignUp, etc.
│ ├── components/ # Header, Footer, etc.
│ ├── styles/ # Modular CSS files
│ └── App.js # Routing configuration
│
└── backend/ # PHP scripts and MySQL connection
├── signup.php
├── login.php
├── getFlightDetails.php
├── contactform.php

Requirements
- [Node.js + npm](https://nodejs.org/)
- [XAMPP](https://www.apachefriends.org/) (for Apache + MySQL)
- A working MySQL database with relevant tables
- Git (optional for cloning)

Getting Started

1. Clone or Download the Project
git clone https://github.com/Mukinatabitha/sky-connect.git
cd skyconnect

2. Setup the Backend (PHP + MySQL)
Move the backend/ folder into the XAMPP htdocs directory:
C:\xampp\htdocs\SkyConnect

3. Start Apache and MySQL using the XAMPP Control Panel.
Open http://localhost/phpmyadmin and:
Create a new database: sky_connect
Import your database schema and data (tables like users, flights, etc.)
Update database credentials in your PHP files (e.g., signup.php, login.php) if needed:
$conn = new mysqli("localhost", "root", "your_password", "sky_connect");


4. Setup the Frontend (React)
cd frontend
npm install     # Install dependencies
npm start       # Launches on http://localhost:3000
React will proxy requests to your backend (e.g., http://localhost/SkyConnect/signup.php) if CORS is configured properly.

5. Sample Images of the Website
   
<img width="1905" height="874" alt="Home" src="https://github.com/user-attachments/assets/4bb64feb-add4-40d3-8617-4d1264af95e0" />
<img width="1898" height="1005" alt="Available Airlines" src="https://github.com/user-attachments/assets/104b411d-f8bc-4564-9e2f-feb8dc549c73" />
<img width="1879" height="999" alt="BookingConfirmation" src="https://github.com/user-attachments/assets/3c3e3c4d-2b2b-4e2c-b5ed-4b25d46eb30d" />
<img width="1891" height="1011" alt="ContactUs" src="https://github.com/user-attachments/assets/2e0b9234-47d0-4a43-bfeb-be8d0c620397" />
<img width="1899" height="987" alt="Payment" src="https://github.com/user-attachments/assets/41021647-28e1-479c-bd93-01c6d7438c7b" />





