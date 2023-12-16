<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 	<form action="addAirlines" method="get">
        <input type="text" name="airlinesName" placeholder="Enter Airlines name"/> <br/>
         <input type="text" name="flightNo" placeholder="Enter Flight No: "/> <br/>
       <input type="text" name="flightModel" placeholder="Enter Flight Model"/> <br/>
        <input type="number" name="totalSeats" placeholder="Enter Total Seats"/> <br/>
         <input type="number" name="economyClassSeats" placeholder="Enter Economy Class Seats"/> <br/>
          <input type="number" name="firstClassSeats" placeholder="Enter First Class Seats"/> <br/>
           <input type="number" name="businessClasSeats" placeholder="Enter Business Class Seats"/> <br/>
       
      
        <input type="submit" value="Submit"/>

    </form>
	
</body>
</html> -->
<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airlines Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 20px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="number"] {
            width: calc(100% - 20px);
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <h2>Register New Airlines Flight Model</h2>

    <form action="addAirlines" method="get" onsubmit="return validateForm()">
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" required/> <br/>
        <input type="text" name="flightNo" placeholder="Enter Flight No:" required/> <br/>
        <input type="text" name="flightModel" placeholder="Enter Flight Model" required/> <br/>
        <input type="number" name="totalSeats" id="totalSeats" placeholder="Enter Total Seats" required/> <br/>
        <input type="number" name="economyClassSeats" id="economyClassSeats" placeholder="Enter Economy Class Seats" required/> <br/>
        <input type="number" name="firstClassSeats" id="firstClassSeats" placeholder="Enter First Class Seats" required/> <br/>
        <input type="number" name="businessClasSeats" id="businessClassSeats" placeholder="Enter Business Class Seats" required/> <br/>
       
        <input type="submit" value="Submit"/>
    </form>

    <script>
        function validateForm() {
            var totalSeats = document.getElementById('totalSeats').value;
            var economySeats = document.getElementById('economyClassSeats').value;
            var firstSeats = document.getElementById('firstClassSeats').value;
            var businessSeats = document.getElementById('businessClassSeats').value;

            var isValid = true;

            if (parseInt(economySeats) + parseInt(firstSeats) + parseInt(businessSeats) !== parseInt(totalSeats)) {
                isValid = false;
                showError(document.getElementById('totalSeats'), 'Total seats must be the sum of Economy, First, and Business seats');
            } else {
                hideError(document.getElementById('totalSeats'));
            }

            return isValid;
        }

        function showError(input, message) {
            var errorElement = document.createElement('div');
            errorElement.className = 'error';
            errorElement.innerHTML = message;

            var parent = input.parentElement;
            parent.appendChild(errorElement);
        }

        function hideError(input) {
            var parent = input.parentElement;
            var errorElement = parent.querySelector('.error');

            if (errorElement) {
                parent.removeChild(errorElement);
            }
        }
    </script>
</body>
</html>
 -->
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airlines Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 20px;
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
        

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="number"] {
            width: calc(100% - 20px);
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl= ctx+"/admin/home";
	%>
    <header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    </header><br><br><br>
     <button class="home-button" onclick="redirectToHome()">Home</button>
    <h2>Register New Airlines Flight Model</h2>

    <form action="addAirlines" method="get" onsubmit="return validateForm()">
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" required/> <br/>
        <input type="text" name="flightNo" placeholder="Enter Flight No:" required/> <br/>
        <input type="text" name="flightModel" placeholder="Enter Flight Model" required/> <br/>
        <input type="number" name="totalSeats" id="totalSeats" placeholder="Enter Total Seats" required/> <br/>
        <input type="number" name="economyClassSeats" id="economyClassSeats" placeholder="Enter Economy Class Seats" required/> <br/>
        <input type="number" name="firstClassSeats" id="firstClassSeats" placeholder="Enter First Class Seats" required/> <br/>
        <input type="number" name="businessClasSeats" id="businessClassSeats" placeholder="Enter Business Class Seats" required/> <br/>
      
       
       
        <input type="submit" value="Submit"/>
    </form>

    <script>
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
        function validateForm() {
            var totalSeats = document.getElementById('totalSeats').value;
            var economySeats = document.getElementById('economyClassSeats').value;
            var firstSeats = document.getElementById('firstClassSeats').value;
            var businessSeats = document.getElementById('businessClassSeats').value;

            var isValid = true;

            if (parseInt(economySeats) + parseInt(firstSeats) + parseInt(businessSeats) !== parseInt(totalSeats)) {
                isValid = false;
                showError(document.getElementById('totalSeats'), 'Total seats must be the sum of Economy, First, and Business seats');
            } else {
                hideError(document.getElementById('totalSeats'));
            }

            return isValid;
        }

        function showError(input, message) {
            var errorElement = document.createElement('div');
            errorElement.className = 'error';
            errorElement.innerHTML = message;

            var parent = input.parentElement;
            parent.appendChild(errorElement);
        }

        function hideError(input) {
            var parent = input.parentElement;
            var errorElement = parent.querySelector('.error');

            if (errorElement) {
                parent.removeChild(errorElement);
            }
        }
    </script>
     <footer>
        &copy; 2023 Flight Booking System
    </footer>
</body>
</html>
 