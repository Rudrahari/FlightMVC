<%@page import="flight.app.entities.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
</head>
<body>
  <%
  Admin adminProfile=(Admin) session.getAttribute("adminProfile");
%>
<h1>PROFILE DETAILS:</h1>
<h2>Full Name: <%= adminProfile.getFullName() %></h2>
<h2>Date of Birth: <%= adminProfile.getDob() %></h2>
<h2>email: <%= adminProfile.getEmail() %></h2>
<h2>Mobile Number: <%= adminProfile.getMobile() %></h2>
<h2>Gender: <%= adminProfile.getGender() %></h2>

<a href="updateProfilePage?email=<%= adminProfile.getEmail() %>">Edit Profile</a>
</body>
</html> --%>
<%-- 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .profile-container {
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 400px;
            text-align: center;
        }

        .profile-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 15px 0 10px;
        }

        .admin-info {
            margin-bottom: 30px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        p.bold {
            font-weight: bold;
        }

        a {
            color: #007bff;
            text-decoration: none;
            display: block;
            margin-top: 20px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .card-details-button {
            background-color: #007bff;
        }

        .edit-profile-button {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

 <%
 Admin adminProfile=(Admin) session.getAttribute("updatedAdmin");
%>


    <div class="profile-container">
        <div class="profile-icon">&#128100;</div>
        
        <h1>User Profile</h1>
        
        <div class="admin-info">
            <label for="fullName">Full Name:</label>
            <p class="bold"><%= adminProfile.getFullName() %></p>

            <label for="dob">Date of Birth:</label>
            <p class="bold"> <%= adminProfile.getDob() %></p>

            <label for="email">Email:</label>
            <p class="bold"><%= adminProfile.getEmail() %></p>

            <label for="mobile">Mobile Number:</label>
            <p class="bold"> <%= adminProfile.getMobile() %></p>

            <label for="gender">Gender:</label>
            <p class="bold"><%= adminProfile.getGender() %></p>
        </div>

        <button class="edit-profile-button" onclick="editProfile()">Edit Profile</button>
        
        
    </div>

    <script>
    function editProfile() {
        window.location.href = 'updateProfilePage?email=<%= adminProfile.getEmail() %>';
    }
    </script>
</body>
</html> --%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
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
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .profile-container {
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 400px;
            text-align: center;
        }

        .profile-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 15px 0 10px;
        }

        .admin-info {
            margin-bottom: 30px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        p.bold {
            font-weight: bold;
        }

        a {
            color: #007bff;
            text-decoration: none;
            display: block;
            margin-top: 20px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }
        .home-button {
	        position: fixed;
	        top: 20px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        border-radius: 4px;
	        cursor: pointer;
	        z-index: 1000;
         }

.home-button:hover {
	background-color: silver;
}

        .card-details-button {
            background-color: #007bff;
        }

        .edit-profile-button {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String targetUrl = ctx + "/admin/updateProfile";
	String homeUrl=ctx+"/admin/home";
	%>
 <%
 Admin adminProfile=(Admin) session.getAttribute("updatedAdmin");
%>
<header>
        <a href="<%=homeUrl %>" class="logo">Flight Booking System</a>
    </header>

    <div class="profile-container">
        <div class="profile-icon">&#128100;</div>
        
        <h1>User Profile</h1>
        
        <button class="home-button">Home</button>
        
        <div class="admin-info">
            <label for="fullName">Full Name:</label>
            <p class="bold"><%= adminProfile.getFullName() %></p>

            <label for="dob">Date of Birth:</label>
            <p class="bold"> <%= adminProfile.getDob() %></p>

            <label for="email">Email:</label>
            <p class="bold"><%= adminProfile.getEmail() %></p>

            <label for="mobile">Mobile Number:</label>
            <p class="bold"> <%= adminProfile.getMobile() %></p>

            <label for="gender">Gender:</label>
            <p class="bold"><%= adminProfile.getGender() %></p>
        </div>

        <button class="edit-profile-button" onclick="editProfile()">Edit Profile</button>
        
        
    </div>
<button class="home-button" onclick="redirectToHome()">Home</button>
    <script>
    function editProfile() {
        window.location.href = 'updateProfilePage?email=<%= adminProfile.getEmail() %>';
    }
    
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
    </script>
    <footer>
        &copy; 2023 Flight Booking System
    </footer>
</body>
</html>