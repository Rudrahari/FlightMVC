<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
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

.user-info {
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
	String ctx = application.getContextPath();
	//out.print(ctx);
	String targetUrl = ctx + "/user/updateProfile";
	%>
	<div class="profile-container">
		<form:form modelAttribute="userInfo" action="<%=targetUrl%>"
			method="get">

<h1>Edit User Profile</h1>
			<form:hidden path="id" />
			<p class="bold">Full Name:</p><form:input type="text" path="fullName" placeholder="Enter FullName" />
			<br />

			<p class="bold">Email:</p><form:input type="email" path="email" placeholder="Enter Email" />
			<br />

			<p class="bold">Mobile Number:</p><form:input type="text" path="mobile" placeholder="Enter Mobile" />
			<br />

			<p class="bold">Date Of Birth:</p><form:input type="date" path="dob" placeholder="Enter Date Of Birth" />
			<br />

            <p class="bold">Gender:</p>
			<form:radiobutton path="gender" value="male" />Male 
            <form:radiobutton path="gender" value="female" />Female 
            <form:radiobutton path="gender" value="others" />Others 
            <br />
            <br/>

            <button type="submit">Save Details</button>

		</form:form>
	</div>

</body>
</html> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
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

.user-info {
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
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl= ctx+"/user/home";
	String targetUrl = ctx + "/user/updateProfile";
	%>
    <header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    </header>

	
	<div class="profile-container">
	Copy code
<form:form modelAttribute="userInfo" action="<%=targetUrl%>" method="get" onsubmit="return validateForm()">

    <h1>Edit User Profile</h1>
    <form:hidden path="id" />
    
    <p class="bold">Full Name:</p>
    <form:input type="text" path="fullName" id="fullName" placeholder="Enter FullName" />
    <div id="fullNameError" class="error"></div>
    <br />

    <p class="bold">Email:</p>
    <form:input type="email" path="email" id="email" placeholder="Enter Email" />
    <div id="emailError" class="error"></div>
    <br />

    <p class="bold">Mobile Number:</p>
    <form:input type="text" path="mobile" id="mobile" placeholder="Enter Mobile" />
    <div id="mobileError" class="error"></div>
    <br />

    <p class="bold">Date Of Birth:</p>
    <form:input type="date" path="dob" id="dob" placeholder="Enter Date Of Birth" />
    <div id="dobError" class="error"></div>
    <br />

    <p class="bold">Gender:</p>
    <form:radiobutton path="gender" value="male" />Male 
    <form:radiobutton path="gender" value="female" />Female 
    <form:radiobutton path="gender" value="others" />Others 
    <br />
    <br/>

    <button type="submit">Save Details</button>

</form:form>
	<%-- 	<form:form modelAttribute="userInfo" action="<%=targetUrl%>"
			method="get">

<h1>Edit User Profile</h1>
			<form:hidden path="id" />
			<p class="bold">Full Name:</p><form:input type="text" path="fullName" placeholder="Enter FullName" />
			<br />

			<p class="bold">Email:</p><form:input type="email" path="email" placeholder="Enter Email" />
			<br />

			<p class="bold">Mobile Number:</p><form:input type="text" path="mobile" placeholder="Enter Mobile" />
			<br />

			<p class="bold">Date Of Birth:</p><form:input type="date" path="dob" placeholder="Enter Date Of Birth" />
			<br />

            <p class="bold">Gender:</p>
			<form:radiobutton path="gender" value="male" />Male 
            <form:radiobutton path="gender" value="female" />Female 
            <form:radiobutton path="gender" value="others" />Others 
            <br />
            <br/>

            <button type="submit">Save Details</button>
            

		</form:form> --%>
	</div>
	<button class="home-button" onclick="redirectToHome()">Home</button>
	<script >
	function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
	 function validateForm() {
	        var fullName = document.getElementById('fullName').value;
	        var email = document.getElementById('email').value;
	        var mobile = document.getElementById('mobile').value;
	        var dob = document.getElementById('dob').value;

	        // Validation for Full Name
	        if (fullName.trim() === '' || fullName.length < 3) {
	            document.getElementById('fullNameError').innerHTML = 'Full Name is required and must be at least 3 characters.';
	            return false;
	        } else {
	            document.getElementById('fullNameError').innerHTML = '';
	        }

	        // Validation for Email
	        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	        if (!emailPattern.test(email)) {
	            document.getElementById('emailError').innerHTML = 'Invalid email address.';
	            return false;
	        } else {
	            document.getElementById('emailError').innerHTML = '';
	        }

	        // Validation for Mobile Number
	        var mobilePattern = /^[0-9]{10}$/;
	        if (!mobilePattern.test(mobile)) {
	            document.getElementById('mobileError').innerHTML = 'Invalid mobile number.';
	            return false;
	        } else {
	            document.getElementById('mobileError').innerHTML = '';
	        }

	        // Validation for Date of Birth
	        var today = new Date();
	        var selectedDate = new Date(dob);
	        var age = today.getFullYear() - selectedDate.getFullYear();

	        if (age < 18 || (age === 18 && today.getMonth() < selectedDate.getMonth()) || (age === 18 && today.getMonth() === selectedDate.getMonth() && today.getDate() < selectedDate.getDate())) {
	            document.getElementById('dobError').innerHTML = 'Age must be at least 18 years.';
	            return false;
	        } else {
	            document.getElementById('dobError').innerHTML = '';
	        }

	        return true;
	    }
	
	</script>
	
	<footer>
        &copy; 2023 Flight Booking System
    </footer>

</body>
</html>