<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admin Signin\SignUp</title>
</head>
<body>
     <center>
   
     <h1><a href="adminLogin">Admin Login</a></h1>
     <h1><a href="adminRegister">Admin Registration</a></h1>
     </center>
</body>
</html> -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>USER</title>
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
            padding: 2px;
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

        .center {
            text-align: center;
            padding: 20px;
            background-color: #f2f2f2; /* Box background color */
            border-radius: 8px; /* Optional: Add rounded corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Optional: Add a box shadow */
            max-width: 600px; /* Optional: Limit the width of the box */
            width: 100%;
            margin-top: 60px; /* Adjust as needed to prevent overlap with the header */
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        a {
            display: block;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<% String ctx=application.getContextPath(); %>
    <header>
        <a href="<%= ctx %>" class="logo">Flight Booking System</a>
    </header>

    <div class="center">
        <h1><a href="admin/adminLogin">Admin Login</a></h1>
        <h1><a href="admin/adminRegister">Admin Registration</a></h1>
    </div>

    <footer>
        &copy; 2023 Flight Booking System
    </footer>
</body>
</html>

