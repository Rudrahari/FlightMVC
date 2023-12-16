<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .Flight{
            width: 200px; margin: auto;

        }
    </style>
</head>
<body class="Flight">
 <fieldset>
    <legend>Sign_UP</legend>
	<form action="addAdmin" method="get">
        <input type="text" name="full_name" placeholder="Enter full name"/> <br/>
        <input type="email" name="email" placeholder="Enter email"/><br/>
        <input type="number" name="mobile" placeholder="Enter mobile no"/><br/>
        <input type="date" name="date_of_birth" placeholder="Enter date of birth"/><br/>
         Gender<br/>
        <input type="radio" name="gender" value="male"/>Male
        <input type="radio" name="gender" value="female"/>Female<br/>
        <input type="radio" name="gender" value="transgender"/>Transgender
        <br/>
        <input type="password" name="password" placeholder="Enter password"/> <br/>
        

        <input type="submit" value="Submit"/>

    </form>
	 </fieldset>
</body>
</html> -->
<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Admin</title>
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

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .gender-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .password-fields {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .password-fields input {
            margin-bottom: 10px;
        }

        .error {
            color: red;
            margin-bottom: 10px;
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

        .login-link {
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            display: block;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register Admin</h1>
        <form action="addAdmin" method="get" onsubmit="return validateForm()">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="full_name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="date_of_birth" required>

            <label>Gender:</label>
            <div class="gender-options">
                <input type="radio" id="male" name="gender" value="male" required>
                <label for="male">Male</label>

                <input type="radio" id="female" name="gender" value="female" required>
                <label for="female">Female</label>

                <input type="radio" id="others" name="gender" value="others" required>
                <label for="others">Others</label>
            </div>

            <div class="password-fields">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <div class="error" id="confirmPasswordError"></div>
            </div>

            <button type="submit">Register Admin</button>
        </form>
        <a href="adminLogin" class="login-link">Already an existing Admin? Login here.</a>
    </div>

    <script>
        function validateForm() {
            var fullName = document.getElementById('fullname').value;
            var email = document.getElementById('email').value;
            var mobile = document.getElementById('mobile').value;
            var dob = document.getElementById('dob').value;
            var gender = document.querySelector('input[name="gender"]:checked');
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;

            // Validation for Full Name
            if (fullName.trim() === '') {
                alert('Full Name is required.');
                return false;
            }

            // Validation for Email
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert('Invalid email address.');
                return false;
            }

            // Validation for Mobile Number
            var mobilePattern = /^[0-9]{10}$/;
            if (!mobilePattern.test(mobile)) {
                alert('Invalid mobile number.');
                return false;
            }

            // Validation for Date of Birth
            if (dob === '') {
                alert('Date of Birth is required.');
                return false;
            }

            // Validation for Gender
            if (!gender) {
                alert('Gender is required.');
                return false;
            }

            // Password and Confirm Password validation
            var confirmPasswordError = document.getElementById('confirmPasswordError');
            if (password !== confirmPassword) {
                confirmPasswordError.innerHTML = 'Passwords do not match.';
                return false;
            } else {
                confirmPasswordError.innerHTML = '';
            }

            return true;
        }
    </script>
</body>
</html>
 -->
<%--  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Admin</title>
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
        header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 0;
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
            left: 0;
            width: 100%;
        }

.home-button {
	        position: fixed;
	        top: 10px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        width: 5%;
	        border-radius: 4px;
	        cursor: pointer;
	        z-index: 1000;
         }

.home-button:hover {
	background-color: silver;
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

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .gender-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .password-fields {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .password-fields input {
            margin-bottom: 10px;
        }

        .error {
            color: red;
            margin-bottom: 10px;
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

        .login-link {
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            display: block;
        }

        button:hover {
            background-color: #0056b3;
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
        <h1>Register Admin</h1>
        <form action="addAdmin" method="get" onsubmit="return validateForm()">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="full_name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="date_of_birth" required>

            <label>Gender:</label>
            <div class="gender-options">
                <input type="radio" id="male" name="gender" value="male" required>
                <label for="male">Male</label>

                <input type="radio" id="female" name="gender" value="female" required>
                <label for="female">Female</label>

                <input type="radio" id="others" name="gender" value="others" required>
                <label for="others">Others</label>
            </div>

            <div class="password-fields">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <div class="error" id="confirmPasswordError"></div>
            </div>

            <button type="submit">Register Admin</button>
            
        </form>
        <a href="adminLogin" class="login-link">Already an existing Admin? Login here.</a>
        <button class="home-button" onclick="redirectToHome()">Home</button>
        	<footer>
        	&copy; 2023 Flight Booking System
    		</footer>
    </div>
    

    <script>
        function validateForm() {
            var fullName = document.getElementById('fullname').value;
            var email = document.getElementById('email').value;
            var mobile = document.getElementById('mobile').value;
            var dob = document.getElementById('dob').value;
            var gender = document.querySelector('input[name="gender"]:checked');
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;

            // Validation for Full Name
            if (fullName.trim() === '') {
                alert('Full Name is required.');
                return false;
            }

            // Validation for Email
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert('Invalid email address.');
                return false;
            }

            // Validation for Mobile Number
            var mobilePattern = /^[0-9]{10}$/;
            if (!mobilePattern.test(mobile)) {
                alert('Invalid mobile number.');
                return false;
            }

            // Validation for Date of Birth
            if (dob === '') {
                alert('Date of Birth is required.');
                return false;
            }

            // Validation for Gender
            if (!gender) {
                alert('Gender is required.');
                return false;
            }

            // Password and Confirm Password validation
            var confirmPasswordError = document.getElementById('confirmPasswordError');
            if (password !== confirmPassword) {
                confirmPasswordError.innerHTML = 'Passwords do not match.';
                return false;
            } else {
                confirmPasswordError.innerHTML = '';
            }

            return true;
        }
        
        function redirectToHome() {
            window.location.href ='<%= ctx %>';
        }
    </script>
</body>
</html>
  --%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register User</title>
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
        header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 0;
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
            left: 0;
            width: 100%;
            margin-top: -200px;
        }
        
        

.home-button {
	        position: fixed;
	        top: 10px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        width: 5%;
	        border-radius: 4px;
	        cursor: pointer;
	        z-index: 1000;
         }

.home-button:hover {
	background-color: silver;
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

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .gender-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .password-fields {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .password-fields input {
            margin-bottom: 10px;
        }

        .error {
            color: red;
            margin-bottom: 10px;
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

        .login-link {
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            display: block;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<% 
       String ctx=application.getContextPath();
       %>
<header>
        <a href="<%= ctx %>" class="logo">Flight Booking System</a>
    </header>
    <button class="home-button" onclick="redirectToHome()">Home</button>

    <div class="container">
        <h1>Register Admin</h1>
        <form action="addAdmin" method="get" onsubmit="return validateForm()">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="full_name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="Date" name="date_of_birth"  required>

            <label>Gender:</label>
            <div class="gender-options">
                <input type="radio" id="male" name="gender" value="male" required>
                <label for="male">Male</label>

                <input type="radio" id="female" name="gender" value="female" required>
                <label for="female">Female</label>

                <input type="radio" id="others" name="gender" value="others" required>
                <label for="others">Others</label>
            </div>

            <div class="password-fields">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <div class="error" id="confirmPasswordError"></div>
            </div>
            <%@ include file="message.jsp" %>
            <button type="submit">Register Admin</button>
            
        </form>
        <a href="adminLogin" class="login-link">Already an existing Admin? Login here.</a>
        	
    </div>
   

    <script>
        document.getElementById("Date").addEventListener("input", function () {
            var selectedDate = new Date(this.value);
            var minDate = new Date();
            minDate.setFullYear(minDate.getFullYear() - 23);

            if (selectedDate > minDate) {
                alert("Should be atleast 23 years old");
                this.value = "";
            }
        });

        function validateForm() {
            var fullName = document.getElementById('fullname').value;
            var email = document.getElementById('email').value;
            var mobile = document.getElementById('mobile').value;
           
            var gender = document.querySelector('input[name="gender"]:checked');
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;

            // Validation for Full Name
            if (fullName.trim() === '') {
                alert('Full Name is required.');
                return false;
            }

            // Validation for Email
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert('Invalid email address.');
                return false;
            }

            // Validation for Mobile Number
            var mobilePattern = /^[0-9]{10}$/;
            if (!mobilePattern.test(mobile)) {
                alert('Invalid mobile number.');
                return false;
            }

            

            // Validation for Gender
            if (!gender) {
                alert('Gender is required.');
                return false;
            }

            // Password and Confirm Password validation
            var confirmPasswordError = document.getElementById('confirmPasswordError');
            if (password !== confirmPassword) {
                confirmPasswordError.innerHTML = 'Passwords do not match.';
                return false;
            } else {
                confirmPasswordError.innerHTML = '';
            }

            return true;
        }
        
        function redirectToHome() {
            window.location.href ='<%= ctx %>';
        }
    </script>
</body>
 <footer>
        	&copy; 2023 Flight Booking System
    		</footer>
</html>