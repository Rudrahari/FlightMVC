<%@page import="flight.app.entities.AirlinesFare"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Flight Fare</title>
</head>
<body>
<%
    AirlinesFare selectdAirlinesFare=(AirlinesFare) session.getAttribute("selectdAirlinesFare");
%>
  
  <form action="updateFlightFare" method="get">
       <input type="hidden" name="id"  value="<%= selectdAirlinesFare.getId()%>" /> <br/>
       <input type="text" name="airlines" placeholder="Enter Airlines Name: " value="<%= selectdAirlinesFare.getAirlines()%>" disabled/> <br/>
         <input type="text" name="flightNos" placeholder="Enter Flight No: " value="<%= selectdAirlinesFare.getFlightNo()%>" disabled/> <br/>
         <input type="text" name="flightModel" placeholder="Enter Flight Model: " value="<%= selectdAirlinesFare.getFlightModel()%>" disabled/> <br/>
         <input type="number" name="economyClassFare" placeholder="Enter Economy Class Fare:" value="<%= selectdAirlinesFare.getEconomyClassFare() %>"/> <br/>
          <input type="number" name="firstClassFare" placeholder="Enter First Class Fare:" value="<%= selectdAirlinesFare.getFirstClassFare() %>"/> <br/>
           <input type="number" name="businessClassFare" placeholder="Enter Business Class Fare:" value="<%= selectdAirlinesFare.getBusinessClassFare() %>"/> <br/>
       
       
        <input type="submit" value="Submit"/>

    </form>
</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Flight Fare</title>
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

        input[disabled] {
            background-color: #eee;
        }
    </style>
</head>
<body>
<%
    AirlinesFare selectdAirlinesFare=(AirlinesFare) session.getAttribute("selectdAirlinesFare");
%>
    <form action="updateFlightFare" method="get">
        <input type="hidden" name="id" value="<%= selectdAirlinesFare.getId()%>" /> <br/>

        <label for="airlines">Airlines Name:</label>
        <input type="text" name="airlines" placeholder="Enter Airlines Name: " value="<%= selectdAirlinesFare.getAirlines()%>" disabled/> <br/>

        <label for="flightNos">Flight No:</label>
        <input type="text" name="flightNos" placeholder="Enter Flight No: " value="<%= selectdAirlinesFare.getFlightNo()%>" disabled/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model: " value="<%= selectdAirlinesFare.getFlightModel()%>" disabled/> <br/>

        <label for="economyClassFare">Economy Class Fare:</label>
        <input type="number" name="economyClassFare" placeholder="Enter Economy Class Fare:" value="<%= selectdAirlinesFare.getEconomyClassFare() %>"/> <br/>

        <label for="firstClassFare">First Class Fare:</label>
        <input type="number" name="firstClassFare" placeholder="Enter First Class Fare:" value="<%= selectdAirlinesFare.getFirstClassFare() %>"/> <br/>

        <label for="businessClassFare">Business Class Fare:</label>
        <input type="number" name="businessClassFare" placeholder="Enter Business Class Fare:" value="<%= selectdAirlinesFare.getBusinessClassFare() %>"/> <br/>

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
    <title>Update Flight Fare</title>
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

        input[disabled] {
            background-color: #eee;
        }
    </style>
</head>
<body>
<%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl= ctx+"/admin/home";
	%>
<%
    AirlinesFare selectdAirlinesFare=(AirlinesFare) session.getAttribute("selectdAirlinesFare");
%>
	<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>
    <form action="updateFlightFare" method="get">
        <input type="hidden" name="id" value="<%= selectdAirlinesFare.getId()%>" /> <br/>

        <label for="airlines">Airlines Name:</label>
        <input type="text" name="airlines" placeholder="Enter Airlines Name: " value="<%= selectdAirlinesFare.getAirlines()%>" disabled/> <br/>

        <label for="flightNos">Flight No:</label>
        <input type="text" name="flightNos" placeholder="Enter Flight No: " value="<%= selectdAirlinesFare.getFlightNo()%>" disabled/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model: " value="<%= selectdAirlinesFare.getFlightModel()%>" disabled/> <br/>

        <label for="economyClassFare">Economy Class Fare:</label>
        <input type="number" name="economyClassFare" placeholder="Enter Economy Class Fare:" value="<%= selectdAirlinesFare.getEconomyClassFare() %>"/> <br/>

        <label for="firstClassFare">First Class Fare:</label>
        <input type="number" name="firstClassFare" placeholder="Enter First Class Fare:" value="<%= selectdAirlinesFare.getFirstClassFare() %>"/> <br/>

        <label for="businessClassFare">Business Class Fare:</label>
        <input type="number" name="businessClassFare" placeholder="Enter Business Class Fare:" value="<%= selectdAirlinesFare.getBusinessClassFare() %>"/> <br/>

        <input type="submit" value="Submit"/>
      
    </form>
     <button class="home-button" onclick="redirectToHome()">Home</button>
    <footer>
        &copy; 2023 Flight Booking System
    	</footer>
    	 <script>
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }</script>
</body>
</html>