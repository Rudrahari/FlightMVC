<%@page import="flight.app.entities.Airlines"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Airlines Seats</title>
</head>
<body>
<% Airlines updateAirlinesModelSeats=(Airlines)session.getAttribute("updateAirlinesModelSeats");
 %>
	<form action="updateAirlinesSeats" method="get">
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" value="<%=updateAirlinesModelSeats.getAirlinesName()%>"/> <br/>
         <input type="text" name="flightNo" placeholder="Enter Flight No: " value="<%=updateAirlinesModelSeats.getFlightNo()%>"/> <br/>
       <input type="text" name="flightModel" placeholder="Enter Flight Model" value="<%=updateAirlinesModelSeats.getFlightModel()%>"/> <br/>
        <input type="number" name="totalSeats" placeholder="Enter Total Seats" value="<%=updateAirlinesModelSeats.getTotalSeats()%>"/> <br/>
         <input type="number" name="economyClassSeats" placeholder="Enter Economy Class Seats" value="<%=updateAirlinesModelSeats.getEconomyClassSeats()%>"/> <br/>
          <input type="number" name="firstClassSeats" placeholder="Enter First Class Seats" value="<%=updateAirlinesModelSeats.getFirstClassSeats()%>"/> <br/>
           <input type="number" name="businessClasSeats" placeholder="Enter Business Class Seats" value="<%=updateAirlinesModelSeats.getBusinessClasSeats()%>"/> <br/>
       <input type="hidden" name="id" placeholder="Airlines ID:" value="<%=updateAirlinesModelSeats.getId()%>"/> <br/>

        <input type="submit" value="Submit"/>

    </form>
	
</body>
</html> --%>
<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Airlines Seats</title>
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

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="number"] {
            width: 100%;
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
    </style>
    <script>
    function validateForm() {
        var totalSeats = parseInt(document.getElementsByName("totalSeats")[0].value);
        var economySeats = parseInt(document.getElementsByName("economyClassSeats")[0].value);
        var firstSeats = parseInt(document.getElementsByName("firstClassSeats")[0].value);
        var businessSeats = parseInt(document.getElementsByName("businessClassSeats")[0].value);

        var errorMessage = "";

        if (isNaN(economySeats) || isNaN(firstSeats) || isNaN(businessSeats)) {
            errorMessage = "Please enter valid numeric values for seats.";
        } else if (totalSeats !== economySeats + firstSeats + businessSeats) {
            errorMessage = "Total seats must be the sum of economy class seats, first class seats, and business class seats.";
        }

        if (errorMessage !== "") {
            alert(errorMessage);
            return false;
        }

        return true;
    }
</script>
    
</head>
<body>
<% Airlines updateAirlinesModelSeats=(Airlines)session.getAttribute("updateAirlinesModelSeats");%>
    <form action="updateAirlinesSeats" method="get" onsubmit="return validateForm()">
        <label for="airlinesName">Airlines Name:</label>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" value="<%=updateAirlinesModelSeats.getAirlinesName()%>"/> <br/>

        <label for="flightNo">Flight No:</label>
        <input type="text" name="flightNo" placeholder="Enter Flight No: " value="<%=updateAirlinesModelSeats.getFlightNo()%>"/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model" value="<%=updateAirlinesModelSeats.getFlightModel()%>"/> <br/>

        <label for="totalSeats">Total Seats:</label>
        <input type="number" name="totalSeats" placeholder="Enter Total Seats" value="<%=updateAirlinesModelSeats.getTotalSeats()%>"/> <br/>

        <label for="economyClassSeats">Economy Class Seats:</label>
        <input type="number" name="economyClassSeats" placeholder="Enter Economy Class Seats" value="<%=updateAirlinesModelSeats.getEconomyClassSeats()%>"/> <br/>

        <label for="firstClassSeats">First Class Seats:</label>
        <input type="number" name="firstClassSeats" placeholder="Enter First Class Seats" value="<%=updateAirlinesModelSeats.getFirstClassSeats()%>"/> <br/>

        <label for="businessClassSeats">Business Class Seats:</label>
        <input type="number" name="businessClassSeats" placeholder="Enter Business Class Seats" value="<%=updateAirlinesModelSeats.getBusinessClasSeats()%>"/> <br/>

        <input type="hidden" name="id" value="<%=updateAirlinesModelSeats.getId()%>"/> <br/>

        <input type="submit" value="Submit"/>
    </form>
</body>
</html>
 --%>
 
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Airlines Seats</title>
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
	        top: 10px;
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

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="number"] {
            width: 100%;
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
    </style>
    <script>
    function validateForm() {
        var totalSeats = parseInt(document.getElementsByName("totalSeats")[0].value);
        var economySeats = parseInt(document.getElementsByName("economyClassSeats")[0].value);
        var firstSeats = parseInt(document.getElementsByName("firstClassSeats")[0].value);
        var businessSeats = parseInt(document.getElementsByName("businessClassSeats")[0].value);

        var errorMessage = "";

        if (isNaN(economySeats) || isNaN(firstSeats) || isNaN(businessSeats)) {
            errorMessage = "Please enter valid numeric values for seats.";
        } else if (totalSeats !== economySeats + firstSeats + businessSeats) {
            errorMessage = "Total seats must be the sum of economy class seats, first class seats, and business class seats.";
        }

        if (errorMessage !== "") {
            alert(errorMessage);
            return false;
        }

        return true;
    }
    
    function redirectToHome() {
        window.location.href = 'home';
    }
    
</script>
    
</head>
<body>
<%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl=ctx+"/admin/home";
	%>
<% Airlines updateAirlinesModelSeats=(Airlines)session.getAttribute("updateAirlinesModelSeats");%>
<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>
    	<button class="home-button" onclick="redirectToHome()">Home</button>
    <form action="updateAirlinesSeats" method="get" onsubmit="return validateForm()">
        <label for="airlinesName">Airlines Name:</label>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" value="<%=updateAirlinesModelSeats.getAirlinesName()%>"/> <br/>

        <label for="flightNo">Flight No:</label>
        <input type="text" name="flightNo" placeholder="Enter Flight No: " value="<%=updateAirlinesModelSeats.getFlightNo()%>"/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model" value="<%=updateAirlinesModelSeats.getFlightModel()%>"/> <br/>

        <label for="totalSeats">Total Seats:</label>
        <input type="number" name="totalSeats" placeholder="Enter Total Seats" value="<%=updateAirlinesModelSeats.getTotalSeats()%>"/> <br/>

        <label for="economyClassSeats">Economy Class Seats:</label>
        <input type="number" name="economyClassSeats" placeholder="Enter Economy Class Seats" value="<%=updateAirlinesModelSeats.getEconomyClassSeats()%>"/> <br/>

        <label for="firstClassSeats">First Class Seats:</label>
        <input type="number" name="firstClassSeats" placeholder="Enter First Class Seats" value="<%=updateAirlinesModelSeats.getFirstClassSeats()%>"/> <br/>

        <label for="businessClassSeats">Business Class Seats:</label>
        <input type="number" name="businessClassSeats" placeholder="Enter Business Class Seats" value="<%=updateAirlinesModelSeats.getBusinessClasSeats()%>"/> <br/>

        <input type="hidden" name="id" value="<%=updateAirlinesModelSeats.getId()%>"/> <br/>
		
        <input type="submit" value="Submit"/>
    </form>
    <footer>
        &copy; 2023 Flight Booking System
    	</footer>
</body>
</html>
 