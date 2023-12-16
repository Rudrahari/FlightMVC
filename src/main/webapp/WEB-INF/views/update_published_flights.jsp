<%@page import="flight.app.entities.Flight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Flight Details</title>
</head>
<body>
<%
 Flight selectedFlightDetails=(Flight) session.getAttribute("selectedFlightDetails");
%>
     <form action="updatePublishFlight" method="get">
        <input type="hidden" name="id" value=<%= selectedFlightDetails.getId() %>/>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" value="<%= selectedFlightDetails.getAirlines() %>" readonly/> <br/>
         <input type="text" name="flightNo" placeholder="Enter Flight No: " value="<%= selectedFlightDetails.getFlightNo() %>" readonly/> <br/>
         <input type="text" name="flightModel" placeholder="Enter Flight Model: " value="<%= selectedFlightDetails.getFlightModel()%>" readonly/> <br/>
         <input type="text" name="source" placeholder="From: " value="<%= selectedFlightDetails.getSource()%>"/> <br/>
         <input type="text" name="sourceTimeZone" placeholder="TimeZone(From): " value="<%= selectedFlightDetails.getSourceTimeZone() %>"/> <br/>
         <input type="text" name="destination" placeholder="To: " value="<%= selectedFlightDetails.getDestination() %>"/> <br/>
         <input type="text" name="destinationTimeZone" placeholder="TimeZone(To): " value="<%=  selectedFlightDetails.getDestinationTimeZone()%>"/> <br/>
         <input type="number" name="totalDuration" placeholder="Enter Total Duration: " value="<%= selectedFlightDetails.getTotalDuration() %>"/> <br/>
         <input type="date" name="sourceDate" placeholder="Enter Source Date:" value="<%= selectedFlightDetails.getSourceDate() %>" /><br/>
         <input type="time" name="sourceTime" placeholder="Enter Source Time: " min="00:00" max="23:59" value="<%=  selectedFlightDetails.getSourceTime()%>"/> <br/>
         <input type="date" name="destinationDate" placeholder="Enter Destination Date:" value="<%= selectedFlightDetails.getDestinationDate() %>"/><br/>
         <input type="time" name="destinationTime" placeholder="Enter Destination Time: " min="00:00" max="23:59" value="<%= selectedFlightDetails.getDestinationTime() %>"/> <br/>
        <input type="submit" value="Submit"/>

    </form>
 
</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Flight Details</title>
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

        input[readonly] {
            background-color: #eee;
        }
    </style>
</head>
<body>
<%
 Flight selectedFlightDetails=(Flight) session.getAttribute("selectedFlightDetails");
%>
    <form action="updatePublishFlight" method="get">
        <input type="hidden" name="id" value="<%= selectedFlightDetails.getId() %>"/>
        
        <label for="airlinesName">Airlines Name:</label>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" value="<%= selectedFlightDetails.getAirlines() %>" readonly/> <br/>

        <label for="flightNo">Flight No:</label>
        <input type="text" name="flightNo" placeholder="Enter Flight No: " value="<%= selectedFlightDetails.getFlightNo() %>" readonly/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model: " value="<%= selectedFlightDetails.getFlightModel()%>" readonly/> <br/>

        <label for="source">From:</label>
        <input type="text" name="source" value="<%= selectedFlightDetails.getSource()%>" placeholder="From:"/> <br/>

        <label for="sourceTimeZone">TimeZone(From):</label>
        <input type="text" name="sourceTimeZone" value="<%= selectedFlightDetails.getSourceTimeZone() %>" placeholder="TimeZone(From):"/> <br/>

        <label for="destination">To:</label>
        <input type="text" name="destination" value="<%= selectedFlightDetails.getDestination() %>" placeholder="To:"/> <br/>

        <label for="destinationTimeZone">TimeZone(To):</label>
        <input type="text" name="destinationTimeZone" value="<%=  selectedFlightDetails.getDestinationTimeZone()%>" placeholder="TimeZone(To):"/> <br/>

        <label for="totalDuration">Total Duration:</label>
        <input type="number" name="totalDuration" value="<%= selectedFlightDetails.getTotalDuration() %>" placeholder="Enter Total Duration:"/> <br/>

        <label for="sourceDate">Enter Source Date:</label>
        <input type="date" name="sourceDate" value="<%= selectedFlightDetails.getSourceDate() %>" placeholder="Enter Source Date:" /><br/>

        <label for="sourceTime">Enter Source Time:</label>
        <input type="time" name="sourceTime" value="<%=  selectedFlightDetails.getSourceTime()%>" placeholder="Enter Source Time: " min="00:00" max="23:59"/> <br/>

        <label for="destinationDate">Enter Destination Date:</label>
        <input type="date" name="destinationDate" value="<%= selectedFlightDetails.getDestinationDate() %>" placeholder="Enter Destination Date:"/><br/>

        <label for="destinationTime">Enter Destination Time:</label>
        <input type="time" name="destinationTime" value="<%= selectedFlightDetails.getDestinationTime() %>" placeholder="Enter Destination Time: " min="00:00" max="23:59"/> <br/>

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
    <title>Update Flight Details</title>
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

        input[readonly] {
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
 Flight selectedFlightDetails=(Flight) session.getAttribute("selectedFlightDetails");
%>
	<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>
    <form action="updatePublishFlight" method="get">
        <input type="hidden" name="id" value="<%= selectedFlightDetails.getId() %>"/>
        
        <label for="airlinesName">Airlines Name:</label>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" value="<%= selectedFlightDetails.getAirlines() %>" readonly/> <br/>

        <label for="flightNo">Flight No:</label>
        <input type="text" name="flightNo" placeholder="Enter Flight No: " value="<%= selectedFlightDetails.getFlightNo() %>" readonly/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model: " value="<%= selectedFlightDetails.getFlightModel()%>" readonly/> <br/>

        <label for="source">From:</label>
        <input type="text" name="source" value="<%= selectedFlightDetails.getSource()%>" placeholder="From:"/> <br/>

        <label for="sourceTimeZone">TimeZone(From):</label>
        <input type="text" name="sourceTimeZone" value="<%= selectedFlightDetails.getSourceTimeZone() %>" placeholder="TimeZone(From):"/> <br/>

        <label for="destination">To:</label>
        <input type="text" name="destination" value="<%= selectedFlightDetails.getDestination() %>" placeholder="To:"/> <br/>

        <label for="destinationTimeZone">TimeZone(To):</label>
        <input type="text" name="destinationTimeZone" value="<%=  selectedFlightDetails.getDestinationTimeZone()%>" placeholder="TimeZone(To):"/> <br/>

        <label for="totalDuration">Total Duration:</label>
        <input type="number" name="totalDuration" value="<%= selectedFlightDetails.getTotalDuration() %>" placeholder="Enter Total Duration:"/> <br/>

        <label for="sourceDate">Enter Source Date:</label>
        <input type="date" name="sourceDate" value="<%= selectedFlightDetails.getSourceDate() %>" placeholder="Enter Source Date:" /><br/>

        <label for="sourceTime">Enter Source Time:</label>
        <input type="time" name="sourceTime" value="<%=  selectedFlightDetails.getSourceTime()%>" placeholder="Enter Source Time: " min="00:00" max="23:59"/> <br/>

        <label for="destinationDate">Enter Destination Date:</label>
        <input type="date" name="destinationDate" value="<%= selectedFlightDetails.getDestinationDate() %>" placeholder="Enter Destination Date:"/><br/>

        <label for="destinationTime">Enter Destination Time:</label>
        <input type="time" name="destinationTime" value="<%= selectedFlightDetails.getDestinationTime() %>" placeholder="Enter Destination Time: " min="00:00" max="23:59"/> <br/>

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
 