<%@page import="flight.app.entities.BookingDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   List<BookingDetails> allPassengersList=( List<BookingDetails>)session.getAttribute("allPassengersList");
%>
<% for(int i=0;i<allPassengersList.size();i++) {%>
<p> <%= allPassengersList.get(i).getEmail() %></p>
<% } %>
</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        .passenger-list {
            list-style: none;
            padding: 0;
        }

        .passenger-item {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }

        .passenger-item p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
   List<BookingDetails> allPassengersList=( List<BookingDetails>)session.getAttribute("allPassengersList");
%>

    <h1>Passenger List</h1>

    <ul class="passenger-list">
    <% for(int i=0;i<allPassengersList.size();i++) {%>
        <li class="passenger-item">
            <p><strong>Booking ID:</strong> <%= allPassengersList.get(i).getBookingId()%></p>
            <p><strong>Booker Email:</strong>  <%= allPassengersList.get(i).getEmail() %></p>
            <p><strong>Flight Number:</strong>  <%= allPassengersList.get(i).getFlightNo() %></p>
            <p><strong>Total Seats:</strong>  <%= allPassengersList.get(i).getTotalSeats() %></p>
            <p><strong>Economy Class Seats:</strong>  <%= allPassengersList.get(i).getEconomyClassSeats() %></p>
            <p><strong>First Class Seats:</strong>  <%= allPassengersList.get(i).getFirstClassSeats()%></p>
            <p><strong>Business Class Seats:</strong>  <%= allPassengersList.get(i).getBusinessClassSeats()%></p>
            <p><strong>Total Fare:</strong>  <%= allPassengersList.get(i).getTotalFare()%></p>
        </li>
        <% } %>
    </ul>

</body>
</html>
 --%>
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
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

        h1 {
            color: #007bff;
        }

        .passenger-list {
            list-style: none;
            padding: 0;
        }

        .passenger-item {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }

        .passenger-item p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
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
   List<BookingDetails> allPassengersList=( List<BookingDetails>)session.getAttribute("allPassengersList");
%>
		<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>

    <h1>Passenger List</h1>
     <button class="home-button" onclick="redirectToHome()">Home</button>

    <ul class="passenger-list">
    <% for(int i=0;i<allPassengersList.size();i++) {%>
        <li class="passenger-item">
            <p><strong>Booking ID:</strong> <%= allPassengersList.get(i).getBookingId()%></p>
            <p><strong>Booker Email:</strong>  <%= allPassengersList.get(i).getEmail() %></p>
            <p><strong>Flight Number:</strong>  <%= allPassengersList.get(i).getFlightNo() %></p>
            <p><strong>Total Seats:</strong>  <%= allPassengersList.get(i).getTotalSeats() %></p>
            <p><strong>Economy Class Seats:</strong>  <%= allPassengersList.get(i).getEconomyClassSeats() %></p>
            <p><strong>First Class Seats:</strong>  <%= allPassengersList.get(i).getFirstClassSeats()%></p>
            <p><strong>Business Class Seats:</strong>  <%= allPassengersList.get(i).getBusinessClassSeats()%></p>
            <p><strong>Total Fare:</strong>  <%= allPassengersList.get(i).getTotalFare()%></p>
        </li>
        <% } %>
       
    </ul>
    <script>
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
    </script>
    <footer>
        &copy; 2023 Flight Booking System
    	</footer>

</body>
</html>
 