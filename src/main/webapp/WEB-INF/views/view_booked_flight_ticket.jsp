<%@page import="flight.app.entities.BookingDetails"%>
<%@page import="flight.app.entities.Flight"%>
<%@page import="flight.app.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Ticket</title>
</head>
<body>
<%
  BookingDetails bookedTicket=(BookingDetails) session.getAttribute("bookedTicket");
  Flight bookedFlight=(Flight) session.getAttribute("bookedFlight");
%>
<p><%=bookedFlight.getDestinationTimeZone() %>
</p>
<p><%= bookedTicket.getTotalFare() %>
</p>
</body>
</html> --%>
<%-- 
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
  BookingDetails bookedTicket=(BookingDetails) session.getAttribute("bookedTicket");
  Flight bookedFlight=(Flight) session.getAttribute("bookedFlight");
  User userProfile=(User) session.getAttribute("userProfile");
%>
    <div class="ticket-container">
    <div class="booking-id">
            <span><strong>Booking ID:</strong> </span>
            <span> <%=bookedTicket.getBookingId() %></span>
        </div>
        <%if(bookedTicket.isStatus()){ %>
        <div class="status-indicator">
             <span><strong> Status:</strong> </span>
             <span class="booked">Booked</span>
        </div>
        <% } %>
        <%if(!bookedTicket.isStatus()){ %>
        <div class="status-indicator">
              <span><strong> Status:</strong> </span>
             <span class="cancelled">Cancelled</span> 
        </div>
         <% } %>
        <h1>Flight Ticket</h1>
        
        <div class="booker-details">
            <p><strong>Booker Name:</strong> <%=userProfile.getFullName() %></p>
            <p><strong>Booker Email:</strong> <%=userProfile.getEmail() %></p>
            <p><strong>Booker Date:</strong> <%= bookedTicket.getBookedDate() %></p>
            <%if(!bookedTicket.isStatus()){ %>
            <p><strong>Booker Date:</strong> <%= bookedTicket.getCancelledDate() %></p>
             <% } %>
        </div>

        <div class="flight-details">
         <p><strong>Airlines:</strong> <%=bookedFlight.getAirlines() %></p>
          <p><strong>Flight No:</strong> <%= bookedFlight.getFlightNo() %></p>
            <p><strong>From:</strong><%=bookedFlight.getSource() %> </p>
            <p><strong>To:</strong> <%= bookedFlight.getDestination() %></p>
            <p><strong> Date:</strong> <%= bookedFlight.getSourceDate() %></p>
            <p><strong>Date:</strong> <%= bookedFlight.getDestinationDate()%></p>
             <p><strong>Time:</strong> <%= bookedFlight.getSourceTime() %></p>
              <p><strong>Time:</strong> <%= bookedFlight.getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= bookedFlight.getSourceTimeZone() %></p>
            <p><strong>TimeZone:</strong> <%= bookedFlight.getDestinationTimeZone() %></p>
        </div>

        <div class="fare-details">
            <div class="fare-item">
                <span>Total Fare</span>
                <span><%= bookedTicket.getTotalFare() %></span>
            </div>
            <div class="fare-item">
                <span>Total Seats Booked</span>
                <span><%=bookedTicket.getTotalSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Economy Class Seats Booked</span>
                <span><%= bookedTicket.getEconomyClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>First Class Seats Booked</span>
                <span><%= bookedTicket.getFirstClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Business Class Seats Booked</span>
                <span><%= bookedTicket.getBusinessClassSeats() %></span>
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
	        top: 1px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        border-radius: 4px;
	        width:5%;
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
  BookingDetails bookedTicket=(BookingDetails) session.getAttribute("bookedTicket");
  Flight bookedFlight=(Flight) session.getAttribute("bookedFlight");
  User userProfile=(User) session.getAttribute("userProfile");
%>
		<header>
        <a href="#" class="logo">Flight Booking System</a>
    	</header><br><br>
    <div class="ticket-container">
    <div class="booking-id">
            <span><strong>Booking ID:</strong> </span>
            <span> <%=bookedTicket.getBookingId() %></span>
        </div>
        <%if(bookedTicket.isStatus()){ %>
        <div class="status-indicator">
             <span><strong> Status:</strong> </span>
             <span class="booked">Booked</span>
        </div>
        <% } %>
        <%if(!bookedTicket.isStatus()){ %>
        <div class="status-indicator">
              <span><strong> Status:</strong> </span>
             <span class="cancelled">Cancelled</span> 
        </div>
         <% } %>
        <h1>Flight Ticket</h1>
        
        <div class="booker-details">
            <p><strong>Booker Name:</strong> <%=userProfile.getFullName() %></p>
            <p><strong>Booker Email:</strong> <%=userProfile.getEmail() %></p>
            <p><strong>Booking Date:</strong> <%= bookedTicket.getBookedDate() %></p>
            <%if(!bookedTicket.isStatus()){ %>
            <p><strong>Cancelled Date:</strong> <%= bookedTicket.getCancelledDate() %></p>
             <% } %>
        </div>

        <div class="flight-details">
         <p><strong>Airlines:</strong> <%=bookedFlight.getAirlines() %></p>
          <p><strong>Flight No:</strong> <%= bookedFlight.getFlightNo() %></p>
            <p><strong>From:</strong><%=bookedFlight.getSource() %> </p>
            <p><strong>To:</strong> <%= bookedFlight.getDestination() %></p>
            <p><strong> Date:</strong> <%= bookedFlight.getSourceDate() %></p>
            <p><strong>Date:</strong> <%= bookedFlight.getDestinationDate()%></p>
             <p><strong>Time:</strong> <%= bookedFlight.getSourceTime() %></p>
              <p><strong>Time:</strong> <%= bookedFlight.getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= bookedFlight.getSourceTimeZone() %></p>
            <p><strong>TimeZone:</strong> <%= bookedFlight.getDestinationTimeZone() %></p>
        </div>

        <div class="fare-details">
            <div class="fare-item">
                <span>Total Fare</span>
                <span><%= bookedTicket.getTotalFare() %></span>
            </div>
            <div class="fare-item">
                <span>Total Seats Booked</span>
                <span><%=bookedTicket.getTotalSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Economy Class Seats Booked</span>
                <span><%= bookedTicket.getEconomyClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>First Class Seats Booked</span>
                <span><%= bookedTicket.getFirstClassSeats() %></span>
            </div>
            <div class="fare-item">
                <span>Business Class Seats Booked</span>
                <span><%= bookedTicket.getBusinessClassSeats() %></span>
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