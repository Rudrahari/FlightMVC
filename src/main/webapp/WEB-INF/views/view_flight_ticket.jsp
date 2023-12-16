<%@page import="flight.app.entities.AirlinesFare"%>
<%@page import="flight.app.entities.Airlines"%>
<%@page import="java.util.List"%>
<%@page import="flight.app.entities.Flight"%>
<%@page import="flight.app.entities.User"%>
<%@page import="flight.app.entities.BookingDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked Successfully</title>
</head>
<body>
<%
  BookingDetails displayTicket=(BookingDetails) session.getAttribute("flightTicket");
Flight displayFlight=(Flight) session.getAttribute("displayFlight");
AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailable");
User userProfile=(User) session.getAttribute("userProfile");
  
%>

<p><%= displayTicket.getBookingId() %></p>
<p><%= displayFlight.getDestinationTimeZone()%></p>
<p><%= displayFlightFare.getBusinessClassFare()%></p>
<p><%= displaySeatsAvailable.getTotalSeats()%></p>
<p><%= userProfile.getDob() %></p>
</body>
</html>
 --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Ticket</title>
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

        .ticket-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%; /* Adjusted width to 80% of the viewport */
            text-align: center;
            position: relative;
        }

        h1 {
            color: #007bff;
        }

        .flight-details {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .flight-details p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
        }

        .booker-details {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

        .fare-details {
            margin-top: 20px;
        }

        .fare-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #555;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .status-indicator {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .status-indicator span {
            padding: 8px 12px;
            border-radius: 4px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .status-indicator .cancelled {
            background-color: red;
            color: white;
        }

        .status-indicator .booked {
            background-color: blue;
            color: white;
        }
         .booking-id {
            position: absolute;
            top: 10px;
            left: 10px;
            font-weight: bold;
            font-size: 16px;
        }
    </style>
</head>
<body>
<%
  BookingDetails displayTicket=(BookingDetails) session.getAttribute("flightTicket");
Flight displayFlight=(Flight) session.getAttribute("displayFlight");
AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailable");
User userProfile=(User) session.getAttribute("userProfile");
  
%>
    <div class="ticket-container">
    <div class="booking-id">
            <span><strong> Booking ID:</strong> </span>
            <span> <%=displayTicket.getBookingId() %></span>
        </div>
        <div class="status-indicator">
           <!--  <span class="cancelled">Cancelled</span> -->
             <span><strong> Status:</strong> </span>
             <span class="booked">Booked</span>
        </div>
        <h1>Flight Ticket</h1>
        
        <div class="booker-details">
            <p><strong>Booker Name:</strong> <%=userProfile.getFullName() %></p>
            <p><strong>Booker Email:</strong> <%=userProfile.getEmail() %></p>
            <p><strong>Booker Date:</strong> <%= displayTicket.getBookedDate() %></p>
        </div>

        <div class="flight-details">
         <p><strong>Airlines:</strong> <%=displayFlight.getAirlines() %></p>
          <p><strong>Flight No:</strong> <%= displayFlight.getFlightNo() %></p>
            <p><strong>From:</strong><%=displayFlight.getSource() %> </p>
            <p><strong>To:</strong> <%= displayFlight.getDestination() %></p>
            <p><strong> Date:</strong> <%= displayFlight.getSourceDate() %></p>
            <p><strong>Date:</strong> <%= displayFlight.getDestinationDate()%></p>
             <p><strong>Time:</strong> <%= displayFlight.getSourceTime() %></p>
              <p><strong>Time:</strong> <%= displayFlight.getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= displayFlight.getSourceTimeZone() %></p>
            <p><strong>TimeZone:</strong> <%= displayFlight.getDestinationTimeZone() %></p>
        </div>

        <div class="fare-details">
            <div class="fare-item">
                <span>Total Fare</span>
                <span><%= displayTicket.getTotalFare() %></span>
            </div>
            <div class="fare-item">
                <span>Total Seats Booked</span>
                <span><%=displayTicket.getTotalSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Economy Class Seats Booked</span>
                <span><%= displayTicket.getEconomyClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>First Class Seats Booked</span>
                <span><%= displayTicket.getFirstClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Business Class Seats Booked</span>
                <span><%= displayTicket.getBusinessClassSeats() %></span>
            </div>
        </div>

        <button onclick="goHome()">Go Home</button>
    </div>

    <script>
        function goHome() {
            // Replace this URL with the actual home page URL
            window.location.href = 'home';
        }
    </script>
</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Ticket</title>
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
	        top: 2px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        border-radius: 4px;
	        width: 5%;
	        cursor: pointer;
	        z-index: 1000;
         }

.home-button:hover {
	background-color: silver;
}

        .ticket-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%; /* Adjusted width to 80% of the viewport */
            text-align: center;
            position: relative;
        }

        h1 {
            color: #007bff;
        }

        .flight-details {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .flight-details p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
        }

        .booker-details {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

        .fare-details {
            margin-top: 20px;
        }

        .fare-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #555;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .status-indicator {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .status-indicator span {
            padding: 8px 12px;
            border-radius: 4px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .status-indicator .cancelled {
            background-color: red;
            color: white;
        }

        .status-indicator .booked {
            background-color: blue;
            color: white;
        }
         .booking-id {
            position: absolute;
            top: 10px;
            left: 10px;
            font-weight: bold;
            font-size: 16px;
        }
    </style>
</head>
<body>
<%
  BookingDetails displayTicket=(BookingDetails) session.getAttribute("flightTicket");
Flight displayFlight=(Flight) session.getAttribute("displayFlight");
AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailables");
User userProfile=(User) session.getAttribute("userProfile");
  
%>
		<header>
        <a href="#" class="logo">Flight Booking System</a>
    	</header><br><br>
    <div class="ticket-container">
    <div class="booking-id">
            <span><strong> Booking ID:</strong> </span>
            <span> <%=displayTicket.getBookingId() %></span>
        </div>
        <div class="status-indicator">
           <!--  <span class="cancelled">Cancelled</span> -->
             <span><strong> Status:</strong> </span>
             <span class="booked">Booked</span>
        </div>
        <h1>Flight Ticket</h1>
        
        <div class="booker-details">
            <p><strong>Booker Name:</strong> <%=userProfile.getFullName() %></p>
            <p><strong>Booker Email:</strong> <%=userProfile.getEmail() %></p>
            <p><strong>Booking Date:</strong> <%= displayTicket.getBookedDate() %></p>
        </div>

        <div class="flight-details">
         <p><strong>Airlines:</strong> <%=displayFlight.getAirlines() %></p>
          <p><strong>Flight No:</strong> <%= displayFlight.getFlightNo() %></p>
            <p><strong>From:</strong><%=displayFlight.getSource() %> </p>
            <p><strong>To:</strong> <%= displayFlight.getDestination() %></p>
            <p><strong> Date:</strong> <%= displayFlight.getSourceDate() %></p>
            <p><strong>Date:</strong> <%= displayFlight.getDestinationDate()%></p>
             <p><strong>Time:</strong> <%= displayFlight.getSourceTime() %></p>
              <p><strong>Time:</strong> <%= displayFlight.getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= displayFlight.getSourceTimeZone() %></p>
            <p><strong>TimeZone:</strong> <%= displayFlight.getDestinationTimeZone() %></p>
        </div>

        <div class="fare-details">
            <div class="fare-item">
                <span>Total Fare</span>
                <span><%= displayTicket.getTotalFare() %></span>
            </div>
            <div class="fare-item">
                <span>Total Seats Booked</span>
                <span><%=displayTicket.getTotalSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Economy Class Seats Booked</span>
                <span><%= displayTicket.getEconomyClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>First Class Seats Booked</span>
                <span><%= displayTicket.getFirstClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Business Class Seats Booked</span>
                <span><%= displayTicket.getBusinessClassSeats() %></span>
            </div>
        </div>

        <button onclick="goHome()">Go Home</button>
        <button class="home-button">Home</button>
    </div>
    <footer>
        &copy; 2023 Flight Booking System
    	</footer>

    <script>
        function goHome() {
            // Replace this URL with the actual home page URL
            window.location.href = 'home';
        }
    </script>
</body>
</html>

