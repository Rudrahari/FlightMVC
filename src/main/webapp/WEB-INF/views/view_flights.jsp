
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="flight.app.entities.AirlinesFare"%>
<%@page import="flight.app.entities.Airlines"%>
<%@page import="java.util.List"%>
<%@page import="flight.app.entities.Flight"%>
<%@page import=" com.google.gson.Gson "%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flight Search</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 20px;
	color: #333;
}

h1 {
	color: #007bff;
}

#search-form {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	overflow: hidden;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

label {
	display: block;
	margin-bottom: 10px;
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

button {
	background-color: #007bff;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}

#flight-list {
	list-style: none;
	padding: 0;
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.flight-item {
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 15px;
	padding: 20px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	width: 100%; /* Ensure each flight item takes up the full width */
}

.book-button {
	display: inline-block;
	background-color: #007bff;
	color: #fff;
	padding: 8px 15px;
	text-decoration: none;
	border-radius: 4px;
	margin-top: 10px;
}

.book-button:hover {
	background-color: #0056b3;
}

.flight-item strong {
	color: #333;
}

.flight-item:hover {
	transform: scale(1.02);
}
#suggestionsContainer {
            position: absolute;
            width: 15%;
            background-color: #fff;
            border: 1px solid #ccc;
            border-top: none;
            border-radius: 0 0 4px 4px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1;
            display: none; /* Initially hide suggestions */
        }

        .suggestion-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .suggestion-item {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .suggestion-item:hover {
            background-color: #f2f2f2;
        }
          #no-flights-message {
            color: #ff0000; 
            font-size: 18px;
            margin-top: 20px;
        }
</style>
</head>
<body>
	<%
	// List<Flight> displayFlights=(List<Flight>) request.getAttribute("displayFlights");
	// List<AirlinesFare> displayFlightsFare=(List<AirlinesFare>) request.getAttribute("displayFlightsFare");
	// List<Airlines> displaySeatsAvailable=(List<Airlines>) request.getAttribute("displaySeatsAvailable");


     Date currentDate=Date.valueOf(LocalDate.now());

	List<Flight> displayFlights = (List<Flight>) session.getAttribute("displayFlights");
	List<AirlinesFare> displayFlightsFare = (List<AirlinesFare>) session.getAttribute("displayFlightsFare");
	List<Airlines> displaySeatsAvailable = (List<Airlines>) session.getAttribute("displaySeatsAvailable");
	
	Gson gson = new Gson();
	String jsonFlights = gson.toJson(displayFlights);
	String jsonFlightsFare = gson.toJson(displayFlightsFare);
	String jsonFlightSeats = gson.toJson(displaySeatsAvailable);

	request.setAttribute("flights", jsonFlights);
	request.setAttribute("flightsFare", jsonFlightsFare);
	request.setAttribute("flightsSeats", jsonFlightSeats);
	%>
	<h1>Flight Search</h1>
	<p><%=jsonFlights%></p>
	<p><%=jsonFlightsFare%></p>
	<p><%=jsonFlightSeats%></p>
	<form action="flightsList" id="search-form" method="get">
		<div style="flex: 1;">
			<label for="origin">Origin:</label> <input type="text" id="origin"
				name="source" required>
		</div>

        <div id="suggestionsContainer" class="suggestions-container"></div>
		<div style="flex: 1; margin-left: 20px;">
			<label for="destination">Destination:</label> <input type="text"
				id="destination" name="destination" required>
		</div>

		<div style="flex: 1; margin-left: 20px;">
			<label for="travel-date">Date:</label> <input type="date"
				id="travel-date" name="travelDate" min="<%= currentDate %>" required>
		</div>

		<button type="submit">Search Flights</button>
	</form>
	
	<% if (displayFlights == null || displayFlights.isEmpty()) { %>
        <div id="no-flights-message"><h1>No flights available</h1></div>
    <% } else { %>

	<ul id="flight-list">
		<%
		for (int i = 0; i < displayFlights.size(); i++) {
		%>
        <li class="flight-item">
         <strong><%=displayFlights.get(i).getAirlines() %></strong>
        - <%= displayFlights.get(i).getFlightNo() %> <br/>
        <strong><%=displayFlights.get(i).getSource() %></strong>
        (<%= displayFlights.get(i).getSourceTime() %> <%=displayFlights.get(i).getSourceTimeZone() %>)
        ----<%=displayFlights.get(i).getTotalDuration()%> Hours----
         <strong><%= displayFlights.get(i).getDestination() %></strong>
         (<%= displayFlights.get(i).getDestinationTime() %> <%=displayFlights.get(i).getDestinationTimeZone() %>)<br/>
        <strong>Economy Class: </strong><%=displayFlightsFare.get(i).getEconomyClassFare() %>
        | <strong>First Class: </strong><%= displayFlightsFare.get(i).getFirstClassFare() %>
        | <strong>Business Class: </strong><%= displayFlightsFare.get(i).getBusinessClassFare() %><br/>
        <button class="book-button view-book-button" data-flight-id="<%=displayFlights.get(i).getId()%>">Book</button>
        </li>
        
		<%
		}
		%>
	</ul>
	<% } %>

	<!-- <form action="flightsList" method="get">
       
        <input type="text" name="source" placeholder="From: "/> 
        <input type="text" name="destination" placeholder="To: "/>
        <input type="date" name="travelDate" placeholder="Enter date of birth"/>
        <input type="submit" value="Search"/>

   </form> -->
	<table>
		<caption>Flights</caption>
		<tr>
			<th>id</th>
			<th>Airlines</th>
			<th>Flight Model</th>
			<th>Flight NO</th>
			<th>Economy</th>
			<th>First</th>
			<th>Business</th>
			<th>Economy Seats</th>
			<th>First Seats</th>
			<th>Business Seats</th>
			<th>Book</th>

		</tr>
		<%
		for (int i = 0; i < displayFlights.size(); i++) {
		%>

		<tr>
			<td><%=i + 1%></td>
			<td><%=displayFlights.get(i).getAirlines()%></td>
			<td><%=displayFlights.get(i).getFlightModel()%></td>
			<td><%=displayFlights.get(i).getFlightNo()%></td>
			<td><%=displayFlightsFare.get(i).getEconomyClassFare()%></td>
			<td><%=displayFlightsFare.get(i).getFirstClassFare()%></td>
			<td><%=displayFlightsFare.get(i).getBusinessClassFare()%></td>
			<td><%=displaySeatsAvailable.get(i).getEconomyClassSeats()%></td>
			<td><%=displaySeatsAvailable.get(i).getFirstClassSeats()%></td>
			<td><%=displaySeatsAvailable.get(i).getBusinessClasSeats()%></td>
			<td><a href="book?id=<%=displayFlights.get(i).getId()%>">Click
					to Book</a></td>

		</tr>
		<%
		}
		%>


	</table>
	<!-- <script>
    const flights = ${jsonFlights};
    const flightFares = ${jsonFlightsFare};
    const flightSeats = ${jsonFlightSeats};

    console.log(flights);
    console.log(flightFares);
    console.log(flightSeats);
    function searchFlights() {
        const origin = document.getElementById('origin').value.toLowerCase();
        const destination = document.getElementById('destination').value.toLowerCase();
        const travelDate = document.getElementById('travel-date').value;

/*         // Filter flights based on origin, destination, and travel date
        const filteredFlights = flights.filter(flight =>
            flight.origin.toLowerCase() === origin &&
            flight.destination.toLowerCase() === destination &&
            flight.date === travelDate
        ); */

        // Display the filtered flights
        displayFlights(flights);
    }

    function displayFlights(flights) {
        const flightList = document.getElementById('flight-list');
        flightList.innerHTML = '';

        if (flights.length === 0) {
            flightList.innerHTML = '<p>No flights found.</p>';
            return;
        }

        flights.forEach(flight => {
            const fare = flightFares.find(f => f.flightNo === flights.flightNo);
            const seat = flightSeats.find(s => s.flightNo === flights.flightNo);

            const flightItem = document.createElement('li');
            flightItem.classList.add('flight-item');
            flightItem.innerHTML = `
                <strong>${flight.airlines}</strong> - Flight ${flight.flightNo}<br>
              /*   Departure: ${flight.departure} | Arrival: ${flight.arrival} | Date: ${flight.date}<br>
                Fares: Economy $${fare.economyClass} | First Class $${fare.firstClass} | Business Class $${fare.businessClass}<br>
                Seats: Total ${seat.totalSeats} | Economy ${seat.economyClass} | First Class ${seat.firstClass} | Business Class ${seat.businessClass}<br> */
                <a href="javascript:void(0);" class="book-button" onclick="bookFlight('${flight.airline}', '${flight.flightNumber}')">Book</a>
            `;
            flightList.appendChild(flightItem);
        });
    }

    function bookFlight(airline, flightNumber) {
        // Replace this URL with the actual booking page URL
        const redirectUrl = 'https://example.com/booking-page';
        window.location.href = `${redirectUrl}?airline=${encodeURIComponent(airline)}&flightNumber=${encodeURIComponent(flightNumber)}`;
    }
</script> -->
<script>
        function submitForm() {
            const origin = document.getElementById('origin').value;
            const destination = document.getElementById('destination').value;
            const travelDate = document.getElementById('travel-date').value;

            window.location.href = `flightsList?source=${encodeURIComponent(origin)}&destination=${encodeURIComponent(destination)}&travelDate=${encodeURIComponent(travelDate)}`;

            return false; 
        }
      document.addEventListener('DOMContentLoaded', function () {
    const originInput = document.getElementById('origin');
    const destinationInput = document.getElementById('destination');
    const suggestionsContainer = document.getElementById('suggestionsContainer');

    originInput.addEventListener('input', function () {
        const userInput = this.value.trim();
        if (userInput.length > 0) {
            fetchPlaceSuggestions(userInput, 'origin');
        } else {
            suggestionsContainer.innerHTML = '';
        }
    });

    destinationInput.addEventListener('input', function () {
        const userInput = this.value.trim();
        if (userInput.length > 0) {
            fetchPlaceSuggestions(userInput, 'destination');
        } else {
            suggestionsContainer.innerHTML = '';
        }
    });
});

function fetchPlaceSuggestions(input, field) {
    // Simulated suggestions for illustration
    const suggestions = ['kochi','madurai','New York', 'London', 'Paris', 'Tokyo', 'Sydney','Chennai','coimbatore','guwahati'];

    const filteredSuggestions = suggestions.filter(place =>
        place.toLowerCase().includes(input.toLowerCase())
    );

    updateSuggestions(filteredSuggestions, field);
}

function updateSuggestions(suggestions, field) {
    const suggestionsContainer = document.getElementById('suggestionsContainer');
    suggestionsContainer.innerHTML = '';

    if (suggestions.length > 0) {
        const ul = document.createElement('ul');
        ul.classList.add('suggestion-list');
        suggestions.forEach(place => {
            const li = document.createElement('li');
            li.classList.add('suggestion-item');
            li.textContent = place;

            // Attach click event to each suggestion
            li.addEventListener('click', function () {
                document.getElementById(field).value = place;
                suggestionsContainer.innerHTML = ''; // Clear suggestions
            });

            ul.appendChild(li);
        });

        suggestionsContainer.appendChild(ul);
    } else {
        suggestionsContainer.innerHTML = 'No suggestions';
    }
}

function searchFlights() {
    // Implement flight search logic here
    const origin = document.getElementById('origin').value;
    const destination = document.getElementById('destination').value;
    const travelDate = document.getElementById('travelDate').value;

    // Log the selected values for demonstration
    console.log('Origin:', origin);
    console.log('Destination:', destination);
    console.log('Travel Date:', travelDate);
}

function updateSuggestions(suggestions, field) {
            const suggestionsContainer = document.getElementById('suggestionsContainer');
            suggestionsContainer.innerHTML = '';

            if (suggestions.length > 0) {
                const ul = document.createElement('ul');
                ul.classList.add('suggestion-list');
                suggestions.forEach(place => {
                    const li = document.createElement('li');
                    li.classList.add('suggestion-item');
                    li.textContent = place;

                    // Attach click event to each suggestion
                    li.addEventListener('click', function () {
                        document.getElementById(field).value = place;
                        suggestionsContainer.innerHTML = ''; // Clear suggestions
                    });

                    ul.appendChild(li);
                });

                suggestionsContainer.appendChild(ul);

                // Show suggestions container and position it below the input field
                suggestionsContainer.style.display = 'block';
                const inputField = document.getElementById(field);
                const inputRect = inputField.getBoundingClientRect();
                suggestionsContainer.style.top = inputRect.bottom + 'px';
                suggestionsContainer.style.left = inputRect.left + 'px';
            } else {
                suggestionsContainer.style.display = 'none'; // Hide if no suggestions
            }
        }
  
document.addEventListener('click', function (event) {
    if (event.target.classList.contains('view-book-button')) {
        var flightId = event.target.dataset.flightId;

        var isConfirmed = confirm("Do you want to book the ticket?");
        if (isConfirmed) {
            window.location.href = "book?id=" + flightId;
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
<title>Flight Search</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 20px;
	color: #333;
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

#search-form {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	overflow: hidden;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

label {
	display: block;
	margin-bottom: 10px;
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

button {
	background-color: #007bff;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}

#flight-list {
	list-style: none;
	padding: 0;
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.flight-item {
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 15px;
	padding: 20px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	width: 100%; /* Ensure each flight item takes up the full width */
}

.book-button {
	display: inline-block;
	background-color: #007bff;
	color: #fff;
	padding: 8px 15px;
	text-decoration: none;
	border-radius: 4px;
	margin-top: 10px;
}

.book-button:hover {
	background-color: #0056b3;
}

.flight-item strong {
	color: #333;
}

.flight-item:hover {
	transform: scale(1.02);
}
#suggestionsContainer {
            position: absolute;
            width: 15%;
            background-color: #fff;
            border: 1px solid #ccc;
            border-top: none;
            border-radius: 0 0 4px 4px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1;
            display: none; /* Initially hide suggestions */
        }

        .suggestion-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .suggestion-item {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .suggestion-item:hover {
            background-color: #f2f2f2;
        }
          #no-flights-message {
            color: #ff0000; 
            font-size: 18px;
            margin-top: 20px;
        }
</style>
</head>
<body>
	<%
	// List<Flight> displayFlights=(List<Flight>) request.getAttribute("displayFlights");
	// List<AirlinesFare> displayFlightsFare=(List<AirlinesFare>) request.getAttribute("displayFlightsFare");
	// List<Airlines> displaySeatsAvailable=(List<Airlines>) request.getAttribute("displaySeatsAvailable");


     Date currentDate=Date.valueOf(LocalDate.now());

	List<Flight> displayFlights = (List<Flight>) session.getAttribute("displayFlights");
	List<AirlinesFare> displayFlightsFare = (List<AirlinesFare>) session.getAttribute("displayFlightsFare");
	List<Airlines> displaySeatsAvailable = (List<Airlines>) session.getAttribute("displaySeatsAvailable");
	
	Gson gson = new Gson();
	String jsonFlights = gson.toJson(displayFlights);
	String jsonFlightsFare = gson.toJson(displayFlightsFare);
	String jsonFlightSeats = gson.toJson(displaySeatsAvailable);

	request.setAttribute("flights", jsonFlights);
	request.setAttribute("flightsFare", jsonFlightsFare);
	request.setAttribute("flightsSeats", jsonFlightSeats);
	%>
		<header>
        <a href="home" class="logo">Flight Booking System</a>
    	</header><br><br>
	<h1>Flight Search</h1>
	<button class="home-button" onclick="redirectToHome()">Home</button>
<%-- 	<p><%=jsonFlights%></p>
	<p><%=jsonFlightsFare%></p>
	<p><%=jsonFlightSeats%></p> --%>
	
	
	
	<form action="flightsList" id="search-form" method="get">
		<div style="flex: 1;">
			<label for="origin">Origin:</label> <input type="text" id="origin"
				name="source" required>
		</div>

        <div id="suggestionsContainer" class="suggestions-container"></div>
		<div style="flex: 1; margin-left: 20px;">
			<label for="destination">Destination:</label> <input type="text"
				id="destination" name="destination" required>
		</div>

		<div style="flex: 1; margin-left: 20px;">
			<label for="travel-date">Date:</label> <input type="date"
				id="travel-date" name="travelDate" min="<%= currentDate %>" required>
		</div>

		<button type="submit">Search Flights</button>
		
	</form>
		<footer>
        &copy; 2023 Flight Booking System
    	</footer>
	
	<% if (displayFlights == null || displayFlights.isEmpty()) { %>
        <div id="no-flights-message"><h1>No flights available</h1></div>
    <% } else { %>

	<ul id="flight-list">
		<%
		for (int i = 0; i < displayFlights.size(); i++) {
		%>
        <li class="flight-item">
         <strong><%=displayFlights.get(i).getAirlines() %></strong>
        - <%= displayFlights.get(i).getFlightNo() %> <br/>
        <strong>Travel Date: </strong><%= displayFlights.get(i).getSourceDate() %>
      <br/>  <strong><%=displayFlights.get(i).getSource() %></strong>
        (<%= displayFlights.get(i).getSourceTime() %> <%=displayFlights.get(i).getSourceTimeZone() %>)
        ----<%-- <%=displayFlights.get(i).getTotalDuration()%> Hours --%>----
         <strong><%= displayFlights.get(i).getDestination() %></strong>
         (<%= displayFlights.get(i).getDestinationTime() %> <%=displayFlights.get(i).getDestinationTimeZone() %>)<br/>
        <strong>Economy Class: </strong><%=displayFlightsFare.get(i).getEconomyClassFare() %>
        | <strong>First Class: </strong><%= displayFlightsFare.get(i).getFirstClassFare() %>
        | <strong>Business Class: </strong><%= displayFlightsFare.get(i).getBusinessClassFare() %><br/>
        <button class="book-button view-book-button" data-flight-id="<%=displayFlights.get(i).getId()%>">Book</button>
        </li>
        
		<%
		}
		%>
	</ul>
	<% } %>

	<!-- <form action="flightsList" method="get">
       
        <input type="text" name="source" placeholder="From: "/> 
        <input type="text" name="destination" placeholder="To: "/>
        <input type="date" name="travelDate" placeholder="Enter date of birth"/>
        <input type="submit" value="Search"/>

   </form> -->
<%-- 	<table>
		<caption>Flights</caption>
		<tr>
			<th>id</th>
			<th>Airlines</th>
			<th>Flight Model</th>
			<th>Flight NO</th>
			<th>Economy</th>
			<th>First</th>
			<th>Business</th>
			<th>Economy Seats</th>
			<th>First Seats</th>
			<th>Business Seats</th>
			<th>Book</th>

		</tr>
		<%
		for (int i = 0; i < displayFlights.size(); i++) {
		%>

		<tr>
			<td><%=i + 1%></td>
			<td><%=displayFlights.get(i).getAirlines()%></td>
			<td><%=displayFlights.get(i).getFlightModel()%></td>
			<td><%=displayFlights.get(i).getFlightNo()%></td>
			<td><%=displayFlightsFare.get(i).getEconomyClassFare()%></td>
			<td><%=displayFlightsFare.get(i).getFirstClassFare()%></td>
			<td><%=displayFlightsFare.get(i).getBusinessClassFare()%></td>
			<td><%=displaySeatsAvailable.get(i).getEconomyClassSeats()%></td>
			<td><%=displaySeatsAvailable.get(i).getFirstClassSeats()%></td>
			<td><%=displaySeatsAvailable.get(i).getBusinessClasSeats()%></td>
			<td><a href="book?id=<%=displayFlights.get(i).getId()%>">Click
					to Book</a></td>

		</tr>
		<%
		}
		%>


	</table> --%>
	<!-- <script>
    const flights = ${jsonFlights};
    const flightFares = ${jsonFlightsFare};
    const flightSeats = ${jsonFlightSeats};

    console.log(flights);
    console.log(flightFares);
    console.log(flightSeats);
    function searchFlights() {
        const origin = document.getElementById('origin').value.toLowerCase();
        const destination = document.getElementById('destination').value.toLowerCase();
        const travelDate = document.getElementById('travel-date').value;

/*         // Filter flights based on origin, destination, and travel date
        const filteredFlights = flights.filter(flight =>
            flight.origin.toLowerCase() === origin &&
            flight.destination.toLowerCase() === destination &&
            flight.date === travelDate
        ); */

        // Display the filtered flights
        displayFlights(flights);
    }

    function displayFlights(flights) {
        const flightList = document.getElementById('flight-list');
        flightList.innerHTML = '';

        if (flights.length === 0) {
            flightList.innerHTML = '<p>No flights found.</p>';
            return;
        }

        flights.forEach(flight => {
            const fare = flightFares.find(f => f.flightNo === flights.flightNo);
            const seat = flightSeats.find(s => s.flightNo === flights.flightNo);

            const flightItem = document.createElement('li');
            flightItem.classList.add('flight-item');
            flightItem.innerHTML = `
                <strong>${flight.airlines}</strong> - Flight ${flight.flightNo}<br>
              /*   Departure: ${flight.departure} | Arrival: ${flight.arrival} | Date: ${flight.date}<br>
                Fares: Economy $${fare.economyClass} | First Class $${fare.firstClass} | Business Class $${fare.businessClass}<br>
                Seats: Total ${seat.totalSeats} | Economy ${seat.economyClass} | First Class ${seat.firstClass} | Business Class ${seat.businessClass}<br> */
                <a href="javascript:void(0);" class="book-button" onclick="bookFlight('${flight.airline}', '${flight.flightNumber}')">Book</a>
            `;
            flightList.appendChild(flightItem);
        });
    }

    function bookFlight(airline, flightNumber) {
        // Replace this URL with the actual booking page URL
        const redirectUrl = 'https://example.com/booking-page';
        window.location.href = `${redirectUrl}?airline=${encodeURIComponent(airline)}&flightNumber=${encodeURIComponent(flightNumber)}`;
    }
</script> -->
<script>
        function submitForm() {
            const origin = document.getElementById('origin').value;
            const destination = document.getElementById('destination').value;
            const travelDate = document.getElementById('travel-date').value;

            window.location.href = `flightsList?source=${encodeURIComponent(origin)}&destination=${encodeURIComponent(destination)}&travelDate=${encodeURIComponent(travelDate)}`;

            return false; 
        }
      document.addEventListener('DOMContentLoaded', function () {
    const originInput = document.getElementById('origin');
    const destinationInput = document.getElementById('destination');
    const suggestionsContainer = document.getElementById('suggestionsContainer');

    originInput.addEventListener('input', function () {
        const userInput = this.value.trim();
        if (userInput.length > 0) {
            fetchPlaceSuggestions(userInput, 'origin');
        } else {
            suggestionsContainer.innerHTML = '';
        }
    });

    destinationInput.addEventListener('input', function () {
        const userInput = this.value.trim();
        if (userInput.length > 0) {
            fetchPlaceSuggestions(userInput, 'destination');
        } else {
            suggestionsContainer.innerHTML = '';
        }
    });
});

function fetchPlaceSuggestions(input, field) {
    // Simulated suggestions for illustration
    const suggestions = ['kochi','madurai','New York', 'London', 'Paris', 'Tokyo', 'Sydney','Chennai','coimbatore','guwahati','Kadapa','Donakonda','Kurnool','Puttaparthi','Rajahmundry','Tirupati','Vijayawada',
    	'Visakhapatnam','Daporijo','Itanagar','Pasighat','Tezu','Dabolim','Mopa','Bhavnagar','Bhuj','Deesa',
    	'paris','singapore','Haneda','Hong Kong','malaysia','Jamnagar','Junagadh','Kandla','Mundra',
    	'Mithapur','Porbandar','Rajkot','Vadodara','Hisar','Kangra','Kullu-Manali','Shimla','Ballari','Bengaluru',
    	'Bidar','Hubli','Kalaburagi','Koppal','Mangaluru','Mysuru','Shivamogga','Kannur','kochi','Kozhikode',
    	'Thiruvananthapuram','Asansol','Balurghat','Coochbehar','Kolkata','Malda','Hyderabad','Warangal','Coimbatore',
    	'Hosur','Madurai','Neyveli','Salem','Thanjavur','Thoothukkudi','Tiruchirappalli','Vellore','Chennai',
    	'Gangtok','Amritsar','Bathinda','Jalandhar','Ludhiana','Pathankot','Angul','Berhampur','Jeypore','Utkela',
    	'Imphal','Nagpur','Shirdi','Solapur','Pune','Mumbai','Jammu','Srinagar'];

    const filteredSuggestions = suggestions.filter(place =>
        place.toLowerCase().includes(input.toLowerCase())
    );

    updateSuggestions(filteredSuggestions, field);
}

function updateSuggestions(suggestions, field) {
    const suggestionsContainer = document.getElementById('suggestionsContainer');
    suggestionsContainer.innerHTML = '';

    if (suggestions.length > 0) {
        const ul = document.createElement('ul');
        ul.classList.add('suggestion-list');
        suggestions.forEach(place => {
            const li = document.createElement('li');
            li.classList.add('suggestion-item');
            li.textContent = place;

            // Attach click event to each suggestion
            li.addEventListener('click', function () {
                document.getElementById(field).value = place;
                suggestionsContainer.innerHTML = ''; // Clear suggestions
            });

            ul.appendChild(li);
        });

        suggestionsContainer.appendChild(ul);
    } else {
        suggestionsContainer.innerHTML = 'No suggestions';
    }
}

function searchFlights() {
    // Implement flight search logic here
    const origin = document.getElementById('origin').value;
    const destination = document.getElementById('destination').value;
    const travelDate = document.getElementById('travelDate').value;

    // Log the selected values for demonstration
    console.log('Origin:', origin);
    console.log('Destination:', destination);
    console.log('Travel Date:', travelDate);
}

function redirectToHome() {
    window.location.href = 'home'; //user
}


function updateSuggestions(suggestions, field) {
            const suggestionsContainer = document.getElementById('suggestionsContainer');
            suggestionsContainer.innerHTML = '';

            if (suggestions.length > 0) {
                const ul = document.createElement('ul');
                ul.classList.add('suggestion-list');
                suggestions.forEach(place => {
                    const li = document.createElement('li');
                    li.classList.add('suggestion-item');
                    li.textContent = place;

                    // Attach click event to each suggestion
                    li.addEventListener('click', function () {
                        document.getElementById(field).value = place;
                        suggestionsContainer.innerHTML = ''; // Clear suggestions
                    });

                    ul.appendChild(li);
                });

                suggestionsContainer.appendChild(ul);

                // Show suggestions container and position it below the input field
                suggestionsContainer.style.display = 'block';
                const inputField = document.getElementById(field);
                const inputRect = inputField.getBoundingClientRect();
                suggestionsContainer.style.top = inputRect.bottom + 'px';
                suggestionsContainer.style.left = inputRect.left + 'px';
            } else {
                suggestionsContainer.style.display = 'none'; // Hide if no suggestions
            }
        }
  
document.addEventListener('click', function (event) {
    if (event.target.classList.contains('view-book-button')) {
        var flightId = event.target.dataset.flightId;

        var isConfirmed = confirm("Do you want to book the ticket?");
        if (isConfirmed) {
            window.location.href = "book?id=" + flightId;
        }
    }
});
</script>

</body>
</html>