<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Reservation System</title>
</head>
<body>
     <center>
     
     <h1>Welcome</h1>
     <h1><a href="admin">Admin</a></h1>
     
     <h1><a href="user">User</a></h1>
     </center>
</body> 
</html> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Flight Booking System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
        }

        footer {
            background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .container {
            text-align: center;
        }

        h1 {
            color: #007bff;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button {
            background-color: #007bff;
            color: #fff;
            padding: 15px 30px;
            margin: 0 10px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <header>
        <a href="#" class="logo">Flight Booking System</a>
    </header>

    <div class="container">
        <h1>Welcome to the Flight Booking System</h1>
        
        <div class="button-container">
            <a href="admin" class="button">Admin</a>
            <a href="user" class="button">User</a>
        </div>
    </div>

    <footer>
        &copy; 2023 Flight Booking System
    </footer>
</body>
</html>