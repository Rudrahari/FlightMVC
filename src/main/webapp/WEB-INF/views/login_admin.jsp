<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admin Login</title>
</head>
<body>
 <center>
     <form action="admin/loginAdmin" method="get">
        <input type="email" name="email" placeholder="Enter email"/><br/>
       
        <input type="password" name="password" placeholder="Enter password"/> <br/>
        

        <input type="submit" value="Submit"/>
</center>
</body>
</html> -->

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Admin Login </title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 300px;
        }

        h1 {
            color: #007bff;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #0056b3;
        }

        .register-link {
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1> Admin Login </h1>
        <form action="loginAdmin" method="get">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
         <%@ include file="message.jsp" %>
        <a href="adminRegister" class="register-link">Don't have an account? Register here.</a>
    </div>
</body>
</html> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Admin Login </title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
         .home-button {
	        position: fixed;
	        top: 15px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        border-radius: 4px;
	        cursor: pointer;
	        z-index: 1000;
	        width: 5%;
         }
         
        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 300px;
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 27px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000; 
            text-align:center;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
        }
        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        h1 {
            color: #007bff;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #0056b3;
        }

        .register-link {
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            display: block;
        }
    </style>
</head>
<body>

    <header>
    <% 
       String ctx=application.getContextPath();
       %>
        <a href="<%= ctx %>" class="logo">Flight Booking System</a>
    </header>
    <div class="container">
        <h1> Admin Login </h1>
        <form action="loginAdmin" method="get">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
             <%@ include file="message.jsp" %>
        </form>
        
        <a href="adminRegister" class="register-link">Don't have an account? Register here.</a>
    </div>
    <footer>
        &copy; 2023 Flight Booking System
    </footer>
    <script>
      function redirectToHome() {
            window.location.href ='<%= ctx %>';
        }
    </script>
    <button class="home-button" onclick="redirectToHome()">Home</button>
</body>
</html>