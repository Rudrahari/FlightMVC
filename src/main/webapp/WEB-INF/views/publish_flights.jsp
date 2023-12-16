<%@page import="java.util.HashSet"%>
<%@page import="flight.app.entities.Airlines"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Publish Flight</title>
</head>
<body>
    <form action="publishFlight" method="get">
        <input type="text" name="airlinesName" placeholder="Enter Airlines name"/> <br/>
         <input type="text" name="flightNo" placeholder="Enter Flight No: "/> <br/>
         <input type="text" name="flightModel" placeholder="Enter Flight Model: "/> <br/>
         <input type="text" name="source" placeholder="From: "/> <br/>
         <input type="text" name="sourceTimeZone" placeholder="TimeZone(From): "/> <br/>
         <input type="text" name="destination" placeholder="To: "/> <br/>
         <input type="text" name="destinationTimeZone" placeholder="TimeZone(To): "/> <br/>
         <input type="number" name="totalDuration" placeholder="Enter Total Duration: "/> <br/>
         <input type="date" name="sourceDate" placeholder="Enter Source Date:" /><br/>
         <input type="time" name="sourceTime" placeholder="Enter Source Time: " min="00:00" max="23:59"/> <br/>
         <input type="date" name="destinationDate" placeholder="Enter Destination Date:"/><br/>
         <input type="time" name="destinationTime" placeholder="Enter Destination Time: " min="00:00" max="23:59"/> <br/>
         <input type="number" name="economyClassFare" placeholder="Enter Economy Class Fare: "/> <br/>
         <input type="number" name="firstClassFare" placeholder="Enter First Class Fare: "/> <br/>
         <input type="number" name="businessClassFare" placeholder="Enter Business Class Fare: "/> <br/>
       
      
        <input type="submit" value="Submit"/>

    </form>

</body>
</html> -->
<%-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Publish Flight</title>
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

h2 {
	color: #007bff;
	text-align: center;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #555;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="number"] {
	width: calc(100% - 20px);
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

.error {
	color: red;
	margin-top: 5px;
}
</style>
</head>
<body>


	<%
	List<Airlines> allAirlines = (List<Airlines>) session.getAttribute("allAirlines");

	HashSet<String> airlinesName = new HashSet();
	HashSet<String> flightModel = new HashSet();
	HashSet<String> flightNo = new HashSet();

	for (int i = 0; i < allAirlines.size(); i++) {
		airlinesName.add(allAirlines.get(i).getAirlinesName());
		flightModel.add(allAirlines.get(i).getFlightModel());
		flightNo.add(allAirlines.get(i).getFlightNo());
	}
	%>
	<h2>Publish Flight</h2>

	<form action="publishFlight" method="get"
		onsubmit="return validateForm()">
		<!-- <label for="airlinesName">Airlines Name:</label>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" required/> <br/>

        <label for="flightNo">Flight No:</label>
        <input type="text" name="flightNo" placeholder="Enter Flight No:" required/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model:" required/> <br/> -->
		<label for="airlinesName">Airlines Name:</label> <select
			name="airlinesName" required>
			<%for(String i:airlinesName){ %>
			<option value="<%=i%>"><%= i %></option>
		    <% } %>
		</select><br /> 
		<label for="flightNo">Flight No:</label> <select
			name="flightNo" required>
			<%for(String j:flightNo){ %>
			<option value="<%= j%>"><%= j %></option>
			<%} %>
		</select><br /> <label for="flightModel">Flight Model:</label> <select
			name="flightModel" required>
			<% for(String k:flightModel){ %>
			<option value="<%= k %>"><%= k %></option>
			<% } %>
	
		</select><br /> <label for="source">From:</label> <input type="text"
			name="source" placeholder="From:" required /> <br /> <label
			for="sourceTimeZone">TimeZone(From):</label> <input type="text"
			name="sourceTimeZone" placeholder="TimeZone(From):" required /> <br />

		<label for="destination">To:</label> <input type="text"
			name="destination" placeholder="To:" required /> <br /> <label
			for="destinationTimeZone">TimeZone(To):</label> <input type="text"
			name="destinationTimeZone" placeholder="TimeZone(To):" required /> <br />

		<label for="totalDuration">Total Duration:</label> <input
			type="number" name="totalDuration"
			placeholder="Enter Total Duration:" required /> <br /> <label
			for="sourceDate">Source Date:</label> <input type="date"
			name="sourceDate" placeholder="Enter Source Date:" required /><br />

		<label for="sourceTime">Source Time:</label> <input type="time"
			name="sourceTime" placeholder="Enter Source Time:" min="00:00"
			max="23:59" required /> <br /> <label for="destinationDate">Destination
			Date:</label> <input type="date" name="destinationDate"
			placeholder="Enter Destination Date:" required /><br /> <label
			for="destinationTime">Destination Time:</label> <input type="time"
			name="destinationTime" placeholder="Enter Destination Time:"
			min="00:00" max="23:59" required /> <br /> <label
			for="economyClassFare">Economy Class Fare:</label> <input
			type="number" name="economyClassFare"
			placeholder="Enter Economy Class Fare:" required /> <br /> <label
			for="firstClassFare">First Class Fare:</label> <input type="number"
			name="firstClassFare" placeholder="Enter First Class Fare:" required />
		<br /> <label for="businessClassFare">Business Class Fare:</label> <input
			type="number" name="businessClassFare"
			placeholder="Enter Business Class Fare:" required /> <br /> <input
			type="submit" value="Submit" />
	</form>

	<script>
		function validateForm() {
			var inputs = document.querySelectorAll('input[required]');

			for (var i = 0; i < inputs.length; i++) {
				var input = inputs[i];

				if (input.value.trim() === '') {
					showError(input, 'This field is required');
					return false;
				} else {
					hideError(input);
				}
			}

			return true;
		}

		function showError(input, message) {
			var errorElement = document.createElement('div');
			errorElement.className = 'error';
			errorElement.innerHTML = message;

			var parent = input.parentElement;
			parent.appendChild(errorElement);
		}

		function hideError(input) {
			var parent = input.parentElement;
			var errorElement = parent.querySelector('.error');

			if (errorElement) {
				parent.removeChild(errorElement);
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
<title>Publish Flight</title>
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
	text-align: center;
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

h2 {
	color: #007bff;
	text-align: center;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #555;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="number"] {
	width: calc(100% - 20px);
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

.home-button {
	position: fixed;
	top: 20px;
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

input[type="submit"]:hover {
	background-color: #0056b3;
}

.error {
	color: red;
	margin-top: 5px;
}
</style>
</head>
<body>
  <%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl=ctx+"/admin/home";
	%>
	<%
	List<Airlines> allAirlines = (List<Airlines>) session.getAttribute("allAirlines");

	HashSet<String> airlinesName = new HashSet();
	HashSet<String> flightModel = new HashSet();
	HashSet<String> flightNo = new HashSet();

	for (int i = 0; i < allAirlines.size(); i++) {
		airlinesName.add(allAirlines.get(i).getAirlinesName());
		flightModel.add(allAirlines.get(i).getFlightModel());
		flightNo.add(allAirlines.get(i).getFlightNo());
	}
	%>
	<header>
		<a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
	</header>
	<br>
	<br>
	<br>
	<h2>Publish Flight</h2>

	<form action="publishFlight" method="get"
		onsubmit="return validateForm()">
		<!--  <label for="airlinesName">Airlines Name:</label>
        <input type="text" name="airlinesName" placeholder="Enter Airlines name" required/> <br/>

        <label for="flightNo">Flight No:</label>
        <input type="text" name="flightNo" placeholder="Enter Flight No:" required/> <br/>

        <label for="flightModel">Flight Model:</label>
        <input type="text" name="flightModel" placeholder="Enter Flight Model:" required/> <br/> -->
		<label for="airlinesName">Airlines Name:</label> <select
			name="airlinesName" required>
			<%
			for (String i : airlinesName) {
			%>
			<option value="<%=i%>"><%=i%></option>
			<%
			}
			%>
		</select><br /> <label for="flightNo">Flight No:</label> <select
			name="flightNo" required>
			<%
			for (String j : flightNo) {
			%>
			<option value="<%=j%>"><%=j%></option>
			<%
			}
			%>
		</select><br />
		 <label for="flightModel">Flight Model:</label>
		 <select name="flightModel" required> <br/>
			<%
			for (String k : flightModel) {
			%>
			<option value="<%=k%>"><%=k%></option>
			<%
			}
			%>
            </select><br /><br>
			<label for="source">From:</label>
			<input type="text" name="source" placeholder="From:" required />
			<br />

			<label for="sourceTimeZone">TimeZone(From):</label>
			<input type="text" name="sourceTimeZone"
			placeholder="TimeZone(From):" required />
			<br />

			<label for="destination">To:</label>
			<input type="text" name="destination" placeholder="To:" required />
			<br />

			<label for="destinationTimeZone">TimeZone(To):</label>
			<input type="text" name="destinationTimeZone"
			placeholder="TimeZone(To):" required />
			<br />

			<label for="totalDuration">Total Duration:</label>
			<input type="number" name="totalDuration"
			placeholder="Enter Total Duration:" required />
			<br />

			<label for="sourceDate">Source Date:</label>
			<input type="date" name="sourceDate" placeholder="Enter Source Date:"
			required />
		<br />

			<label for="sourceTime">Source Time:</label>
			<input type="time" name="sourceTime" placeholder="Enter Source Time:"
			min="00:00" max="23:59" required />
			<br />

			<label for="destinationDate">Destination Date:</label>
			<input type="date" name="destinationDate"
			placeholder="Enter Destination Date:" required />
		<br />

			<label for="destinationTime">Destination Time:</label>
			<input type="time" name="destinationTime"
			placeholder="Enter Destination Time:" min="00:00" max="23:59"
			required />
			<br />

			<label for="economyClassFare">Economy Class Fare:</label>
			<input type="number" name="economyClassFare"
			placeholder="Enter Economy Class Fare:" required />
			<br />

			<label for="firstClassFare">First Class Fare:</label>
			<input type="number" name="firstClassFare"
			placeholder="Enter First Class Fare:" required />
			<br />

			<label for="businessClassFare">Business Class Fare:</label>
			<input type="number" name="businessClassFare"
			placeholder="Enter Business Class Fare:" required />
			<br />

		

			<input type="submit" value="Submit" />
	</form>
  <button class="home-button" onclick="redirectToHome()">Home</button>
	<script>
		function validateForm() {
			var inputs = document.querySelectorAll('input[required]');

			for (var i = 0; i < inputs.length; i++) {
				var input = inputs[i];

				if (input.value.trim() === '') {
					showError(input, 'This field is required');
					return false;
				} else {
					hideError(input);
				}
			}

			return true;
		}

		function showError(input, message) {
			var errorElement = document.createElement('div');
			errorElement.className = 'error';
			errorElement.innerHTML = message;

			var parent = input.parentElement;
			parent.appendChild(errorElement);
		}

		function hideError(input) {
			var parent = input.parentElement;
			var errorElement = parent.querySelector('.error');

			if (errorElement) {
				parent.removeChild(errorElement);
			}
		}
		
		 function redirectToHome() {
		        window.location.href ='<%= homeUrl %>';
		    }
	</script>
	<footer> &copy; 2023 Flight Booking System </footer>
</body>
</html>
