<%@page import="flight.app.entities.User"%>
<%@page import="flight.app.entities.Flight"%>
<%@page import="java.util.List"%>
<%@page import="flight.app.entities.BookingDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Booked Flight Tickets</title>
</head>
<body>
<%
    List<BookingDetails> displayBookedTickets=(List<BookingDetails>) session.getAttribute("bookedTickets");
    List<Flight> bookedFlightsData=(List<Flight>) session.getAttribute("bookedFlightsData");
%>
<table>
		<caption>Flights</caption>
		<tr>
			<th>Booking-ID</th>
			<th>Airlines</th>
			<th>Travel Date</th>
			

		</tr>
		<%
		for (int i = 0; i < displayBookedTickets.size(); i++) {
		%>

		<tr>
			<td><%=i + 1%></td>
			<td><%=displayBookedTickets.get(i).getBookingId()%></td>
		    <td> <%= bookedFlightsData.get(i).getSourceDate() %></td>
			<td><a href="viewTicket?bookingId=<%=displayBookedTickets.get(i).getBookingId()%>&id=<%= displayBookedTickets.get(i).getFlightId()%>"> View Ticket</a></td>

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
<title>Booked Flight Tickets</title>
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
  	 List<BookingDetails> displayBookedTickets=(List<BookingDetails>) session.getAttribute("bookedTickets");
    List<Flight> bookedFlightsData=(List<Flight>) session.getAttribute("bookedFlightsData");
	 User userProfile=(User) session.getAttribute("userProfile");
	%>
	<h2>Booking History</h2>
<% for(int i=0;i<displayBookedTickets.size();i++) {%>

	<div class="booking-history-item">
	<% if(displayBookedTickets.get(i).isStatus()) {%>
		<div class="status-indicator">
			<span class="booked">Booked</span>
		</div>
	<%} %>
	<% if(!displayBookedTickets.get(i).isStatus()){ %>
	     <div class="status-indicator">
			<span class="cancelled">Cancelled</span>
		</div>
	<% } %>
		<p>
			<strong>Booking ID:</strong> <%=displayBookedTickets.get(i).getBookingId() %>
		</p>
		<p>
			<strong>Booker Name:</strong> <%= userProfile.getFullName() %>
		</p>
		<p>
			<strong>Booker Email:</strong> <%= displayBookedTickets.get(i).getEmail() %>
		</p>
		<p>
			<strong>From:</strong> <%= bookedFlightsData.get(i).getSource() %>
		</p>
		<p>
			<strong>To:</strong> <%= bookedFlightsData.get(i).getDestination() %>
		</p>
		<p>
			<strong>Travel Date:</strong> <%= bookedFlightsData.get(i).getSourceDate() %>
		</p>
		<p>
			<strong>Booked Date:</strong> <%= displayBookedTickets.get(i).getBookedDate() %>
		</p>
		<% if(!displayBookedTickets.get(i).isStatus()) {%>
		<p>
			<strong>Cancelled Date:</strong> <%= displayBookedTickets.get(i).getCancelledDate() %>
		</p>
		<%} %>
		<% if(displayBookedTickets.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Booked
		</p>
		<%} %>
		<% if(!displayBookedTickets.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Cancelled
		</p>
		<%} %>
	 <button class="view-button"><a href="viewTicket?bookingId=<%=displayBookedTickets.get(i).getBookingId()%>
		&id=<%=displayBookedTickets.get(i).getFlightId()%>">View</a></button> 
		
		<button class="view-button" onclick="viewTicket('<%=displayBookedTickets.get(i).getBookingId()%>','<%=displayBookedTickets.get(i).getFlightId()%>')">View</button>
	
	<button class="view-button view-ticket-button" data-booking-id="<%=displayBookedTickets.get(i).getBookingId()%>" data-flight-id="<%=displayBookedTickets.get(i).getFlightId()%>">View</button>
	
	
	</div>
<%} %>
<!-- <script>
function viewTicket(bookingId, flightId) {
    var confirmResult = confirm("Do you want to view the ticket?");
    if (confirmResult) {
        window.location.href = "viewTicket?bookingId=" + bookingId + "&id=" + flightId;
    }
}
</script> -->
<script>
document.addEventListener('click', function (event) {
    // Check if the clicked element has the specified class
    if (event.target.classList.contains('view-ticket-button')) {
        // Get the relevant data attributes or values using dataset
        var bookingId = event.target.dataset.bookingId;
        var flightId = event.target.dataset.flightId;

        // Confirm before redirecting
        var isConfirmed = confirm("Do you want to view the ticket?");
        if (isConfirmed) {
            window.location.href = "viewTicket?bookingId=" + bookingId + "&id=" + flightId;
        }
    }
});
</script>



</body>
</html> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booked Flight Tickets</title>
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
  	 List<BookingDetails> displayBookedTickets=(List<BookingDetails>) session.getAttribute("bookedTickets");
    List<Flight> bookedFlightsData=(List<Flight>) session.getAttribute("bookedFlightsData");
	 User userProfile=(User) session.getAttribute("userProfile");
	%>
		<header>
        <a href="<%=  homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>
		
	<h2>Booked Flight Tickets</h2>
<% for(int i=0;i<displayBookedTickets.size();i++) {%>

	<div class="booking-history-item">
	<% if(displayBookedTickets.get(i).isStatus()) {%>
		<div class="status-indicator">
			<span class="booked">Booked</span>
		</div>
	<%} %>
	<% if(!displayBookedTickets.get(i).isStatus()){ %>
	     <div class="status-indicator">
			<span class="cancelled">Cancelled</span>
		</div>
	<% } %>
		<p>
			<strong>Booking ID:</strong> <%=displayBookedTickets.get(i).getBookingId() %>
		</p>
		<p>
			<strong>Booker Name:</strong> <%= userProfile.getFullName() %>
		</p>
		<p>
			<strong>Booker Email:</strong> <%= displayBookedTickets.get(i).getEmail() %>
		</p>
		<p>
			<strong>From:</strong> <%= bookedFlightsData.get(i).getSource() %>
		</p>
		<p>
			<strong>To:</strong> <%= bookedFlightsData.get(i).getDestination() %>
		</p>
		<p>
			<strong>Travel Date:</strong> <%= bookedFlightsData.get(i).getSourceDate() %>
		</p>
		<p>
			<strong>Booked Date:</strong> <%= displayBookedTickets.get(i).getBookedDate() %>
		</p>
		<% if(!displayBookedTickets.get(i).isStatus()) {%>
		<p>
			<strong>Cancelled Date:</strong> <%= displayBookedTickets.get(i).getCancelledDate() %>
		</p>
		<%} %>
		<% if(displayBookedTickets.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Booked
		</p>
		<%} %>
		<% if(!displayBookedTickets.get(i).isStatus()) {%>
		<p>
			<strong>Status:</strong> Cancelled
		</p>
		
		<%} %>
		
	<%--  <button class="view-button"><a href="viewTicket?bookingId=<%=displayBookedTickets.get(i).getBookingId()%>
		&id=<%=displayBookedTickets.get(i).getFlightId()%>">View</a></button>  --%>
		
		<%-- <button class="view-button" onclick="viewTicket('<%=displayBookedTickets.get(i).getBookingId()%>','<%=displayBookedTickets.get(i).getFlightId()%>')">View</button> --%>
	
	<button class="view-button view-ticket-button" data-booking-id="<%=displayBookedTickets.get(i).getBookingId()%>" data-flight-id="<%=displayBookedTickets.get(i).getFlightId()%>">View</button>
	
	<footer>
        &copy; 2023 Flight Booking System
    	</footer>
	</div>
	<button class="home-button" onclick="redirectToHome()">Home</button>
		
<%} %>
<!-- <script>
function viewTicket(bookingId, flightId) {
    var confirmResult = confirm("Do you want to view the ticket?");
    if (confirmResult) {
        window.location.href = "viewTicket?bookingId=" + bookingId + "&id=" + flightId;
    }
}
</script> -->
<script>
document.addEventListener('click', function (event) {
    // Check if the clicked element has the specified class
    if (event.target.classList.contains('view-ticket-button')) {
        // Get the relevant data attributes or values using dataset
        var bookingId = event.target.dataset.bookingId;
        var flightId = event.target.dataset.flightId;

        // Confirm before redirecting
        var isConfirmed = confirm("Do you want to view the ticket?");
        if (isConfirmed) {
            window.location.href = "viewTicket?bookingId=" + bookingId + "&id=" + flightId;
        }
    }
});
function redirectToHome() {
    window.location.href ='<%= homeUrl %>';
}
</script>



</body>
</html>