<%@page import="flight.app.entities.AirlinesFare"%>
<%@page import="flight.app.entities.Airlines"%>
<%@page import="flight.app.entities.Flight"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Published Flights</title>
</head>
<body>
<%
  List<Flight> publishedFlights=(List<Flight>) session.getAttribute("publishedFlights");
  List<AirlinesFare> publishedFlightsFare=(List<AirlinesFare>) session.getAttribute("publishedFlightsFare");
  List<Airlines> publishedFlightsSeats=(List<Airlines>) session.getAttribute("publishedFlightsSeats");
%>

<% for(int i=0;i<2;i++){ %>
<p>Head</p>
<p><%=  publishedFlights.get(i).getDestinationDate()%></p>
<p><%= publishedFlightsFare.get(i).getFirstClassFare() %></p>
<p><%=  publishedFlightsSeats.get(i).getTotalSeats()  %></p>
<% } %>
</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Published Flight Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        .flight-list {
            list-style: none;
            padding: 0;
        }

        .flight-item {
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

        .flight-item p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
        }

        .action-buttons button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .action-buttons button:hover {
            background-color: #e4ebf3;
        }
    </style>
</head>
<body>
<%
  List<Flight> publishedFlights=(List<Flight>) session.getAttribute("publishedFlights");
  List<AirlinesFare> publishedFlightsFare=(List<AirlinesFare>) session.getAttribute("publishedFlightsFare");
  List<Airlines> publishedFlightsSeats=(List<Airlines>) session.getAttribute("publishedFlightsSeats");
%>
    <h1>Published Flight Details</h1>
    <ul class="flight-list">
    <% for(int i=0;i<publishedFlights.size();i++){ %>
        <li class="flight-item">
            <p><strong>Airlines:</strong>  <%= publishedFlights.get(i).getAirlines() %> </p>
            <p><strong> Flight No:</strong> <%= publishedFlights.get(i).getFlightNo() %> </p>
            <p><strong>From:</strong> <%= publishedFlights.get(i).getSource() %></p>
            <p><strong>To:</strong>  <%= publishedFlights.get(i).getDestination()%> </p>
            <p><strong> Date:</strong> <%=publishedFlights.get(i).getSourceDate() %> </p>
            <p><strong> Date:</strong> <%= publishedFlights.get(i).getDestinationDate()%> </p>
            <p><strong>Time:</strong> <%= publishedFlights.get(i).getSourceTime() %></p>
            <p><strong>Time:</strong> <%= publishedFlights.get(i).getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= publishedFlights.get(i).getSourceTimeZone() %></p>
             <p><strong>TimeZone:</strong> <%=  publishedFlights.get(i).getDestinationTimeZone()%></p>
              <p><strong>Economy Class Fare:</strong> <%= publishedFlightsFare.get(i).getEconomyClassFare()%></p>
            <p><strong>First Class Fare:</strong> <%= publishedFlightsFare.get(i).getFirstClassFare() %></p>
            <p><strong>Business Class Fare:</strong> <%= publishedFlightsFare.get(i).getBusinessClassFare()%></p>
             <p><strong>Total Seats:</strong> <%= publishedFlightsSeats.get(i).getTotalSeats() %></p>
            <p><strong>Economy Seats:</strong> <%= publishedFlightsSeats.get(i).getEconomyClassSeats() %></p>
            <p><strong>First Class Seats:</strong> <%= publishedFlightsSeats.get(i).getFirstClassSeats() %> </p>
            <p><strong>Business Class Seats:</strong> <%= publishedFlightsSeats.get(i).getBusinessClasSeats() %></p>
            <div class="action-buttons">
                <button ><a href="getPassengersList?id=<%= publishedFlights.get(i).getId()%>">View Passenger List</a></button>
                <button ><a href="flightFare?id=<%= publishedFlights.get(i).getId() %>">Edit Fare</a></button>
                <button><a href="updateFlights?id=<%= publishedFlights.get(i).getId() %>">Edit Flight Details </a></button>
                <button><a href="deleteFlights?id=<%= publishedFlights.get(i).getId()%>">Delete Flight</a></button>
            </div>
        </li>
       <% } %>
    </ul>

</body>
</html> --%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Published Flight Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        .flight-list {
            list-style: none;
            padding: 0;
        }

        .flight-item {
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

        .flight-item p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
        }

        .action-buttons button {
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .action-buttons button.view { background-color: #007bff; color: white; }
        .action-buttons button.edit { background-color: #007bff; color: white; }
        .action-buttons button.delete { background-color: #dc3545; color: white; }

        .action-buttons button:hover {
            background-color: #e4ebf3;
        }
    </style>
</head>
<body>
<%
  List<Flight> publishedFlights=(List<Flight>) session.getAttribute("publishedFlights");
  List<AirlinesFare> publishedFlightsFare=(List<AirlinesFare>) session.getAttribute("publishedFlightsFare");
  List<Airlines> publishedFlightsSeats=(List<Airlines>) session.getAttribute("publishedFlightsSeats");
%>
    <h1>Published Flight Details</h1>
    <ul class="flight-list">
    <% for(int i=0;i<publishedFlights.size();i++){ %>
        <li class="flight-item">
            <p><strong>Airlines:</strong>  <%= publishedFlights.get(i).getAirlines() %> </p>
            <p><strong> Flight No:</strong> <%= publishedFlights.get(i).getFlightNo() %> </p>
            <p><strong>From:</strong> <%= publishedFlights.get(i).getSource() %></p>
            <p><strong>To:</strong>  <%= publishedFlights.get(i).getDestination()%> </p>
            <p><strong> Date:</strong> <%=publishedFlights.get(i).getSourceDate() %> </p>
            <p><strong> Date:</strong> <%= publishedFlights.get(i).getDestinationDate()%> </p>
            <p><strong>Time:</strong> <%= publishedFlights.get(i).getSourceTime() %></p>
            <p><strong>Time:</strong> <%= publishedFlights.get(i).getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= publishedFlights.get(i).getSourceTimeZone() %></p>
             <p><strong>TimeZone:</strong> <%=  publishedFlights.get(i).getDestinationTimeZone()%></p>
              <p><strong>Economy Class Fare:</strong> <%= publishedFlightsFare.get(i).getEconomyClassFare()%></p>
            <p><strong>First Class Fare:</strong> <%= publishedFlightsFare.get(i).getFirstClassFare() %></p>
            <p><strong>Business Class Fare:</strong> <%= publishedFlightsFare.get(i).getBusinessClassFare()%></p>
             <p><strong>Total Seats:</strong> <%= publishedFlightsSeats.get(i).getTotalSeats() %></p>
            <p><strong>Economy Seats:</strong> <%= publishedFlightsSeats.get(i).getEconomyClassSeats() %></p>
            <p><strong>First Class Seats:</strong> <%= publishedFlightsSeats.get(i).getFirstClassSeats() %> </p>
            <p><strong>Business Class Seats:</strong> <%= publishedFlightsSeats.get(i).getBusinessClasSeats() %></p>
            <div class="action-buttons">
                <button class="view" onclick="viewPassengerList(<%= publishedFlights.get(i).getId()%>)">View Passenger List</button>
                <button class="edit" onclick="editFare(<%= publishedFlights.get(i).getId() %>)">Edit Fare</button>
                <button class="edit" onclick="editFlightDetails(<%= publishedFlights.get(i).getId() %>)">Edit Flight Details </button>
                <button class="delete" onclick="confirmDelete(<%= publishedFlights.get(i).getId() %>)">Delete Flight</button>
            </div>
        </li>
       <% } %>
    </ul>

<script>
    function viewPassengerList(flightId) {
        window.location.href = "getPassengersList?id=" + flightId;
    }

    function editFare(flightId) {
        window.location.href = "flightFare?id=" + flightId;
    }

    function editFlightDetails(flightId) {
        window.location.href = "updateFlights?id=" + flightId;
    }

    function confirmDelete(flightId) {
        var shouldDelete = confirm("Do you want to delete this flight?");
        if (shouldDelete) {
            window.location.href = "deleteFlights?id=" + flightId;
        }
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
    <title>Published Flight Details</title>
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
	        top: 5px;
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

        .flight-list {
            list-style: none;
            padding: 0;
        }

        .flight-item {
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

        .flight-item p {
            width: 48%; /* Adjusted width for side-by-side display */
            margin-bottom: 10px;
        }

        .action-buttons button {
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .action-buttons button.view { background-color: #007bff; color: white; }
        .action-buttons button.edit { background-color: #007bff; color: white; }
        .action-buttons button.delete { background-color: #dc3545; color: white; }

        .action-buttons button:hover {
            background-color: #e4ebf3;
        }
    </style>
</head>
<body>

 <%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl=ctx+"/admin/home";
	%>
  <header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    </header><br><br><br>
     <button class="home-button" onclick="redirectToHome()">Home</button>
<%
  List<Flight> publishedFlights=(List<Flight>) session.getAttribute("publishedFlights");
  List<AirlinesFare> publishedFlightsFare=(List<AirlinesFare>) session.getAttribute("publishedFlightsFare");
  List<Airlines> publishedFlightsSeats=(List<Airlines>) session.getAttribute("publishedFlightsSeats");
%>
    <h1>Published Flight Details</h1>
    <ul class="flight-list">
    <% for(int i=0;i<publishedFlights.size();i++){ %>
        <li class="flight-item">
            <p><strong>Airlines:</strong>  <%= publishedFlights.get(i).getAirlines() %> </p>
            <p><strong> Flight No:</strong> <%= publishedFlights.get(i).getFlightNo() %> </p>
            <p><strong>From:</strong> <%= publishedFlights.get(i).getSource() %></p>
            <p><strong>To:</strong>  <%= publishedFlights.get(i).getDestination()%> </p>
            <p><strong> Date:</strong> <%=publishedFlights.get(i).getSourceDate() %> </p>
            <p><strong> Date:</strong> <%= publishedFlights.get(i).getDestinationDate()%> </p>
            <p><strong>Time:</strong> <%= publishedFlights.get(i).getSourceTime() %></p>
            <p><strong>Time:</strong> <%= publishedFlights.get(i).getDestinationTime()%></p>
            <p><strong>TimeZone:</strong> <%= publishedFlights.get(i).getSourceTimeZone() %></p>
             <p><strong>TimeZone:</strong> <%=  publishedFlights.get(i).getDestinationTimeZone()%></p>
              <p><strong>Economy Class Fare:</strong> <%= publishedFlightsFare.get(i).getEconomyClassFare()%></p>
            <p><strong>First Class Fare:</strong> <%= publishedFlightsFare.get(i).getFirstClassFare() %></p>
            <p><strong>Business Class Fare:</strong> <%= publishedFlightsFare.get(i).getBusinessClassFare()%></p>
             <p><strong>Total Seats:</strong> <%= publishedFlightsSeats.get(i).getTotalSeats() %></p>
            <p><strong>Economy Seats:</strong> <%= publishedFlightsSeats.get(i).getEconomyClassSeats() %></p>
            <p><strong>First Class Seats:</strong> <%= publishedFlightsSeats.get(i).getFirstClassSeats() %> </p>
            <p><strong>Business Class Seats:</strong> <%= publishedFlightsSeats.get(i).getBusinessClasSeats() %></p>
            <div class="action-buttons">
                <button class="view" onclick="viewPassengerList(<%= publishedFlights.get(i).getId()%>)">View Passenger List</button>
                <button class="edit" onclick="editFare(<%= publishedFlights.get(i).getId() %>)">Edit Fare</button>
                <button class="edit" onclick="editFlightDetails(<%= publishedFlights.get(i).getId() %>)">Edit Flight Details </button>
                <button class="delete" onclick="confirmDelete(<%= publishedFlights.get(i).getId() %>)">Delete Flight</button>
               
             </div>
        </li>
       <% } %>
    </ul>

<script>
    function viewPassengerList(flightId) {
        window.location.href = "getPassengersList?id=" + flightId;
    }

    function editFare(flightId) {
        window.location.href = "flightFare?id=" + flightId;
    }

    function editFlightDetails(flightId) {
        window.location.href = "updateFlights?id=" + flightId;
    }

    function confirmDelete(flightId) {
        var shouldDelete = confirm("Do you want to delete this flight?");
        if (shouldDelete) {
            window.location.href = "deleteFlights?id=" + flightId;
        }
    }
    function redirectToHome() {
        window.location.href ='<%= homeUrl %>';
    }
</script>

<footer>
        &copy; 2023 Flight Booking System
    </footer>

</body>
</html>


 

