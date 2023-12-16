<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> User Dashboard</title>
</head>
<body>
<h1><a href="user/userProfilePage">Profile</a></h1>
<h1><a href="flight/searchFlights">Search/Book Flights</a></h1>
<h1><a href="viewBookedFlightTickets">Booked Tickets</a></h1>
<h1><a href="cancelFlightTickets">Cancel Ticket</a></h1>
<h1><a href="bookingHistory">Booking History</a></h1>
</body>
</html>
 -->
<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
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

    <h2>User Dashboard</h2>

    <div class="logout-button">
        <a href="logout">Logout</a>
    </div>
    <div class="dashboard">
        <div class="dashboard-item">
            <h3>Profile</h3>
            <a href="userProfilePage">View Profile</a>
        </div>

        <div class="dashboard-item">
            <h3>Search Flights</h3>
            <a href="searchFlights">Search Flights</a>
        </div>

        <div class="dashboard-item">
            <h3>Booked Tickets</h3>
            <a href="viewBookedFlightTickets">View Booked Tickets</a>
        </div>

        <div class="dashboard-item">
            <h3>Cancel Ticket</h3>
            <a href="cancelFlightTickets">Cancel Ticket</a>
        </div>

        <div class="dashboard-item">
            <h3>Booking History</h3>
            <a href="bookingHistory">View Booking History</a>
        </div>
    </div>

</body>
</html> -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            position: relative;
        }
    header { 
    top:0; 
    position: fixed;
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	text-align: center; 
	width: 100%; 
	left: 0; 
	
}

.logo {
	font-size: x-large;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	
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
footer {
	background-color: #007bff;
	color: white;
	text-align: center;
	padding: 10px;
	position: fixed;
	bottom: 0;
	width: 100%; 
	left: 0;
}

.home-button:hover {
	background-color: silver;
}
        

        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            
            
        }

        .dashboard-item {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 70px;
            width: 300px;
            text-align: center;
            background-color: #2d29291b;
        }

        h1{
            color: #007bff;
        }

        a {
            display: block;
            margin-top: 10px;
            padding: 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px; 
            width: 90%; 
           
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
        h3{   
        font-size: 200%;
        }
    </style>
</head>
<body> 
<header>
    <a href="#" class="logo">Flight Booking System</a>
</header><br><br><br>

    <h1>User Dashboard</h1> <br><br>
    <button class="home-button">Home</button>

    <div class="logout-button">
        <a href="logout">Logout</a>
    </div>
    <div class="dashboard">
        <div class="dashboard-item">
            <h3>Profile</h3>
            <a href="userProfilePage">View Profile</a>
        </div>

        <div class="dashboard-item">
            <h3>Search Flights</h3>
            <a href="searchFlights">Search Flights</a>
        </div>

        <div class="dashboard-item">
            <h3>Booked Tickets</h3>
            <a href="viewBookedFlightTickets">View Booked Tickets</a>
        </div>

        <div class="dashboard-item">
            <h3>Cancel Ticket</h3>
            <a href="cancelFlightTickets">Cancel Ticket</a>
        </div>

        <div class="dashboard-item">
            <h3>Booking History</h3>
            <a href="bookingHistory">View Booking History</a>
        </div>
    </div> 
    <footer>
    &copy; 2023 Flight Booking System
</footer>

</body>
</html>
