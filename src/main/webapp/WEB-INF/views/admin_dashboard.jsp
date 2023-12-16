<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <h1><a href="adminProfilePage">Profile</a></h1>
<h1><a href="airlines/flights">Publish New Flights</a></h1>
<h1> <a href="airlines/displayPublishedFlights"> Display All Published Flights</a></h1>
<h1><a href="airlines/updateFlights">Update Published Flight Details</a></h1>
<h1><a href="airlines/registration">Add New Airlines/Airlines Model</a></h1>
<h1><a href="airlines/updateAirlines">Update Airlines Seat Availability Details</a></h1>
<h1><a href="airlines/flightFare">Update Published Airlines Fare</a></h1>
<h1><a href="airlines/getAllPublishedAirlinesmodel">Display All Flights Model</a></h1>

</body>
</html> -->

<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 20px;
	position: relative;
}

.dashboard {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.dashboard-item {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 300px;
	text-align: center;
}

h2 {
	color: #007bff;
}

a {
	display: block;
	margin-top: 10px;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
}

a:hover {
	background-color: #0056b3;
}

.logout-button {
	position: absolute;
	top: 10px;
	right: 10px;
}

.logout-button a {
	padding: 10px;
	background-color: red;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
}

.logout-button a:hover {
	background-color: darkred;
}
</style>
</head>
<body>

	<h2>Admin Dashboard</h2>

	<div class="logout-button">
		<a href="logout">Logout</a>
	</div>

	<div class="dashboard">
		<div class="dashboard-item">
			<h3>Profile</h3>
			<a href="adminProfilePage">View Profile</a>
		</div>

		<div class="dashboard-item">
			<h3>New Flights</h3>
			<a href="flights">Publish New Flights</a>
		</div>

		<div class="dashboard-item">
			<h3>Published Flights</h3>
			<a href="displayPublishedFlights">View  All Published Flights</a>
		</div>
		
		<div class="dashboard-item">
			<h3>Deleted Flights</h3>
			<a href="displayDeletedFlights">View  All Deleted Flights</a>
		</div>
		

	

		<div class="dashboard-item">
			<h3>New Airlines/Airlines Model</h3>
			<a href="registration">Add New Airlines/Airlines Model</a>
		</div>

<div class="dashboard-item">
	<h3>Display All Flights Model</h3>
	<a href="getAllPublishedAirlinesmodel">Display All Flights Model</a>
	</div>
	</div>

</body>
</html>
 -->
 
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

header {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	text-align: center;
}

.logo {
	font-size: x-large;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	
}

.dashboard {
	display: flex;
    flex-wrap: wrap;
    gap: 25px; 
	padding: 20px;
	justify-content: center;
}

.dashboard-item {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	padding: 70px;
	width: 300px;
	text-align: center;
	margin: 10px;
	background-color: #2d29291b;
}

h2 {
	color: #007bff;
	text-decoration: none;
	border-radius: 4px;
	padding: 10px;
	text-align: center;
}

a {
	display: block;
	margin-top: 15px;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	text-align: center; 

}

a:hover {
	background-color: #0056b3;
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

.logout-button {
	position: fixed;
	top: 10px;
	right: 30px;
}

.logout-button a {
	padding: 10px;
	background-color: red;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
}

.logout-button a:hover {
	background-color: darkred;
}

footer {
	background-color: #007bff;
	color: white;
	text-align: center;
	padding: 10px;
	position: fixed;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<body> 

<header>
    <a href="#" class="logo">Flight Booking System</a>
</header>

<h2>Admin Dashboard</h2>

<button class="home-button">Home</button>

<div class="logout-button">
    <a href="logout">Logout</a>
</div>

<div class="dashboard">
	<div class="dashboard-item">
		<h3>Profile</h3>
		<a href="adminProfilePage">View Profile</a>
	</div>

	<div class="dashboard-item">
		<h3>New Flights</h3>
		<a href="flights">Publish New Flights</a>
	</div>

	<div class="dashboard-item">
		<h3>Published Flights</h3>
		<a href="displayPublishedFlights">View  All Published Flights</a>
	</div>
	
	<div class="dashboard-item">
		<h3>Deleted Flights</h3>
		<a href="displayDeletedFlights">View  All Deleted Flights</a>
	</div>
	



	<div class="dashboard-item">
		<h3>New Airlines/Airlines Model</h3>
		<a href="registration">Add New Airlines/Airlines Model</a>
	</div>

<div class="dashboard-item">
<h3>Display All Flights Model</h3>
<a href="getAllPublishedAirlinesmodel">Display All Flights Model</a>
</div>
</div>

<footer>
    &copy; 2023 Flight Booking System
</footer>

</body>
</html>