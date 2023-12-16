<%@page import="java.util.List"%>
<%@page import="flight.app.entities.BookingDetails"%>
<%@page import="flight.app.entities.Flight"%>
<%@page import="flight.app.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking History</title>
</head>
<body>
	<%
	List<BookingDetails> userBookingHistory = (List<BookingDetails>) session.getAttribute("bookingHistoryList");
	List<Flight> userbookingFlightHistoryList = (List<Flight>) session.getAttribute("bookingFlightHistoryList");
	%>

	<table>
		<caption>Flights</caption>
		<tr>
			<th>Booking-ID</th>
			<th>Airlines</th>


		</tr>
		<%
		for (int i = 0; i < userBookingHistory.size(); i++) {
		%>

		<tr>
			<td><%=userbookingFlightHistoryList.get(i).getFlightNo()%></td>
			<td><%=userBookingHistory.get(i).getBookingId()%></td>

			<td><a
				href="viewTicket?bookingId=<%=userBookingHistory.get(i).getBookingId()%>">Click
					to View Ticket</a></td>

		</tr>
		<%
		}
		%>


	</table>
</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking History</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 20px;
}

.booking-history-item {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
	position: relative;
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

.view-button {
	position: absolute;
	bottom: 10px;
	right: 10px;
	background-color: #007bff;
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

h2 {
	color: #007bff;
}

p {
	margin-bottom: 10px;
}
</style>
</head>
<body>
  	<%
	List<BookingDetails> userBookingHistory = (List<BookingDetails>) session.getAttribute("bookingHistoryList");
	List<Flight> userbookingFlightHistoryList = (List<Flight>) session.getAttribute("bookingFlightHistoryList");
	 User userProfile=(User) session.getAttribute("userProfile");
	%>
	<h2>Booking History</h2>
<% for(int i=0;i<userBookingHistory.size();i++) {%>

	<div class="booking-history-item">
	<% if(userBookingHistory.get(i).isStatus()) {%>
		<div class="status-indicator">
			<span class="booked">Booked</span>
		</div>
	<%} %>
	<% if(!userBookingHistory.get(i).isStatus()){ %>
	     <div class="status-indicator">
			<span class="cancelled">Cancelled</span>
		</div>
	<% } %>
		<p>
			<strong>Booking ID:</strong> <%=userBookingHistory.get(i).getBookingId() %>
		</p>
		<p>
			<strong>Booker Name:</strong> <%= userProfile.getFullName() %>
		</p>
		<p>
			<strong>Booker Email:</strong> <%= userBookingHistory.get(i).getEmail() %>
		</p>
		<p>
			<strong>From:</strong> <%= userbookingFlightHistoryList.get(i).getSource() %>
		</p>
		<p>
			<strong>To:</strong> <%= userbookingFlightHistoryList.get(i).getDestination() %>
		</p>
		<p>
			<strong>Travel Date:</strong> <%= userbookingFlightHistoryList.get(i).getSourceDate() %>
		</p>
		<p>
			<strong>Booked Date:</strong> <%= userBookingHistory.get(i).getBookedDate() %>
		</p>
		<% if(!userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Cancelled Date:</strong> <%= userBookingHistory.get(i).getCancelledDate() %>
		</p>
		<%} %>
		<% if(userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Booked
		</p>
		<%} %>
		<% if(!userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Cancelled
		</p>
		<%} %>
		<button class="view-button"><a href="viewTicket?bookingId=<%=userBookingHistory.get(i).getBookingId()%>
		&id=<%=userBookingHistory.get(i).getFlightId()%>">View</a></button>
	</div>
<%} %>

</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking History</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 20px;
}

.booking-history-item {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
	position: relative;
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

.view-button {
	position: absolute;
	bottom: 10px;
	right: 10px;
	background-color: #007bff;
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

h2 {
	color: #007bff;
}

p {
	margin-bottom: 10px;
}
</style>
</head>
<body>
  	<%
	List<BookingDetails> userBookingHistory = (List<BookingDetails>) session.getAttribute("bookingHistoryList");
	List<Flight> userbookingFlightHistoryList = (List<Flight>) session.getAttribute("bookingFlightHistoryList");
	 User userProfile=(User) session.getAttribute("userProfile");
	%>
	<h2>Booking History</h2>
<% for(int i=0;i<userBookingHistory.size();i++) {%>

	<div class="booking-history-item">
	<% if(userBookingHistory.get(i).isStatus()) {%>
		<div class="status-indicator">
			<span class="booked">Booked</span>
		</div>
	<%} %>
	<% if(!userBookingHistory.get(i).isStatus()){ %>
	     <div class="status-indicator">
			<span class="cancelled">Cancelled</span>
		</div>
	<% } %>
		<p>
			<strong>Booking ID:</strong> <%=userBookingHistory.get(i).getBookingId() %>
		</p>
		<p>
			<strong>Booker Name:</strong> <%= userProfile.getFullName() %>
		</p>
		<p>
			<strong>Booker Email:</strong> <%= userBookingHistory.get(i).getEmail() %>
		</p>
		<p>
			<strong>From:</strong> <%= userbookingFlightHistoryList.get(i).getSource() %>
		</p>
		<p>
			<strong>To:</strong> <%= userbookingFlightHistoryList.get(i).getDestination() %>
		</p>
		<p>
			<strong>Travel Date:</strong> <%= userbookingFlightHistoryList.get(i).getSourceDate() %>
		</p>
		<p>
			<strong>Booked Date:</strong> <%= userBookingHistory.get(i).getBookedDate() %>
		</p>
		<% if(!userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Cancelled Date:</strong> <%= userBookingHistory.get(i).getCancelledDate() %>
		</p>
		<%} %>
		<% if(userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Booked
		</p>
		<%} %>
		<% if(!userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Cancelled
		</p>
		<%} %>
		<button class="view-button" onclick="confirmView('<%=userBookingHistory.get(i).getBookingId()%>', '<%=userBookingHistory.get(i).getFlightId()%>')">View</button>
	</div>
<%} %>

<script>
    function confirmView(bookingId, flightId) {
        var shouldView = confirm("Do you want to view");
        if (shouldView) {
            window.location.href = "viewTicket?bookingId=" + bookingId + "&id=" + flightId;
        }
    }
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
</script>

</body>
</html> --%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking History</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 20px;
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


.booking-history-item {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
	position: relative;
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

.view-button {
	position: absolute;
	bottom: 10px;
	right: 10px;
	background-color: #007bff;
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

h2 {
	color: #007bff;
}

p {
	margin-bottom: 10px;
}
</style>
</head>
<body>
<% String ctx=application.getContextPath();
  String homeUrl=ctx+"/user/home";
%>
  	<%
	List<BookingDetails> userBookingHistory = (List<BookingDetails>) session.getAttribute("bookingHistoryList");
	List<Flight> userbookingFlightHistoryList = (List<Flight>) session.getAttribute("bookingFlightHistoryList");
	 User userProfile=(User) session.getAttribute("userProfile");
	%>
		<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>
	<h2>Booking History</h2>
	<button class="home-button" onclick="redirectToHome()">Home</button>
<% for(int i=0;i<userBookingHistory.size();i++) {%>

	<div class="booking-history-item">
	<% if(userBookingHistory.get(i).isStatus()) {%>
		<div class="status-indicator">
			<span class="booked">Booked</span>
		</div>
	<%} %>
	<% if(!userBookingHistory.get(i).isStatus()){ %>
	     <div class="status-indicator">
			<span class="cancelled">Cancelled</span>
		</div>
	<% } %>
		<p>
			<strong>Booking ID:</strong> <%=userBookingHistory.get(i).getBookingId() %>
		</p>
		<p>
			<strong>Booker Name:</strong> <%= userProfile.getFullName() %>
		</p>
		<p>
			<strong>Booker Email:</strong> <%= userBookingHistory.get(i).getEmail() %>
		</p>
		<p>
			<strong>From:</strong> <%= userbookingFlightHistoryList.get(i).getSource() %>
		</p>
		<p>
			<strong>To:</strong> <%= userbookingFlightHistoryList.get(i).getDestination() %>
		</p>
		<p>
			<strong>Travel Date:</strong> <%= userbookingFlightHistoryList.get(i).getSourceDate() %>
		</p>
		<p>
			<strong>Booked Date:</strong> <%= userBookingHistory.get(i).getBookedDate() %>
		</p>
		<% if(!userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Cancelled Date:</strong> <%= userBookingHistory.get(i).getCancelledDate() %>
		</p>
		<%} %>
		<% if(userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Booked
		</p>
		<%} %>
		<% if(!userBookingHistory.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Cancelled
		</p>
		<%} %>
		<button class="view-button" onclick="confirmView('<%=userBookingHistory.get(i).getBookingId()%>', '<%=userBookingHistory.get(i).getFlightId()%>')">View</button>
		
	</div>
	<footer>
        &copy; 2023 Flight Booking System
    	</footer>
<%} %>

<script>
    function confirmView(bookingId, flightId) {
        var shouldView = confirm("Do you want to view");
        if (shouldView) {
            window.location.href = "viewTicket?bookingId=" + bookingId + "&id=" + flightId;
        }
    }
    
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
</script>

</body>
</html>

