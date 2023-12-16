<%@page import="flight.app.entities.AirlinesFare"%>
<%@page import="flight.app.entities.Airlines"%>
<%@page import="flight.app.entities.Flight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Tickets</title>
</head>
<body>
<%
 // List<Flight> displayFlights=(List<Flight>) request.getAttribute("displayFlights");
 // List<AirlinesFare> displayFlightsFare=(List<AirlinesFare>) request.getAttribute("displayFlightsFare");
 // List<Airlines> displaySeatsAvailable=(List<Airlines>) request.getAttribute("displaySeatsAvailable");
  
  Flight displayFlight=(Flight) session.getAttribute("displayFlight");
  AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
   Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailable");
  
%>
<p><%=   displayFlight.getAirlines() %></p>
<p> <%= displayFlightFare.getEconomyClassFare()%></p>
<p><%=   displaySeatsAvailable.getTotalSeats() %> </p>

<form action="paymentsPage" method="get" onsubmit="return validateForm()">
        Economy Class Seats:<input type="number" name="economy" id="Economy" placeholder="Economy Class"/> <br/>
        First Class Seats :<input type="number" name="first" id="First" placeholder="First Class"/><br/> 
        Business Class Seats: <input type="number" name="business" id="Business" placeholder="Business Class"/><br/> 
        <input type="button" onClick="calculatTotalFare()" value="CalculateFare"/><br/>
         TotalFare:<input type="text" name="result" id="result"></p><br/>
        <!-- TotalFare:<p id="result"></p><br/> -->
        <input type="text" id="airFare" name="totalAirFare"/>
         <input type="text" id="totSeats" name="totalSeats"/>
        <!--   <input type="text" id="economySeats" name="totalEconomySeats" value="0"/>
           <input type="text" id="firstSeats" name="totalFirstSeats" value="0"/>
            <input type="text" id="businessSeats" name="totalBusinessSeats" value="0"/> -->
        <input type="submit" value="Book"/>
</form>
<script>
 function calculatTotalFare()
 {
	 economy=Number(document.getElementById("Economy").value);
	 first=Number(document.getElementById("First").value);
	 business=Number(document.getElementById("Business").value);
	 document.getElementById("totSeats").value=economy+first+business;
	 
	 economyAvailable=<%= displaySeatsAvailable.getEconomyClassSeats()%>;
	 firstAvailable=<%= displaySeatsAvailable.getFirstClassSeats() %>;
	 businessAvailable=<%= displaySeatsAvailable.getBusinessClasSeats() %>;
	 
	 if(economy>economyAvailable || first>firstAvailable || business>businessAvailable )
	{
		 alert("Seats Not Available!! Choose Accordingly");
		 return;
	 }
	 
	 economyFare=economy*<%= displayFlightFare.getEconomyClassFare()%>;
	 firstFare=first*<%= displayFlightFare.getFirstClassFare()%>;
	 businessFare=business*<%= displayFlightFare.getBusinessClassFare()%>;
	 document.getElementById("result").value=economyFare+firstFare+businessFare;
	 document.getElementById("airFare").value=economyFare+firstFare+businessFare;
	 var total=economyFare+firstFare+businessFare;
	/*  var Tot=document.getElementById("result").innerHTML; */

 }
 function validateForm() {
	    var fare = document.getElementById("result").value;

	    if (fare === "" ) {
	        alert("Please calculate fare for your journey");
	        return false;
	    }
	    return true;
	}
</script>
</body>
</html> --%>
<%-- <!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book Tickets</title>
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

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
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

        input[type="number"] {
            width: 100%;
        }

        input[type="button"], input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="button"]:hover, input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="text"] {
            width: 100%;
            margin-top: 10px;
        }

        input[type="text"]:read-only {
            background-color: #eee;
        }

        input[type="text"]:disabled {
            background-color: #ddd;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
         .flight-details {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <%
    Flight displayFlight=(Flight) session.getAttribute("displayFlight");
    AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
    Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailable");
    %>

    <p><%= displayFlight.getAirlines() %></p>
    <p> <%= displayFlightFare.getEconomyClassFare()%></p>
    <p><%= displaySeatsAvailable.getTotalSeats() %> </p>
    <div class="flight-details">
        <h2>Flight Details</h2>
        <strong>Airlines: </strong><%= displayFlight.getAirlines() %>
        <strong>Flight No:</strong> <%= displayFlight.getFlightNo() %><br/>
        <strong>From:</strong><%= displayFlight.getSource() %>(<%= displayFlight.getSourceDate() %>-<%= displayFlight.getSourceTime()%>-<%=displayFlight.getSourceTimeZone() %>)<br/>
        <strong>To:</strong><%= displayFlight.getDestination() %>(<%= displayFlight.getDestinationDate() %>-<%= displayFlight.getDestinationTime() %>-<%=displayFlight.getDestinationTimeZone() %>)<br/>
        <strong>Economy Class Fare:</strong><%= displayFlightFare.getEconomyClassFare()%> |
        <strong>First Class Fare:</strong><%=displayFlightFare.getFirstClassFare() %> |
        <strong>Business class Fare:</strong><%= displayFlightFare.getBusinessClassFare() %><br/>
        <strong>Seats Available</strong><br/>
        <strong>Economy Class:</strong><%=displaySeatsAvailable.getEconomyClassSeats() %> |
        <strong>First Class:</strong><%=displaySeatsAvailable.getFirstClassSeats() %> |
        <strong>Business Class:</strong><%= displaySeatsAvailable.getBusinessClasSeats() %>
    </div>

    <form action="paymentsPage" method="get" onsubmit="return validateForm()">
        <label for="Economy">Economy Class Seats:</label>
        <input type="number" name="economy" id="Economy" placeholder="Economy Class" >
        <br/>

        <label for="First">First Class Seats:</label>
        <input type="number" name="first" id="First" placeholder="First Class" >
        <br/>

        <label for="Business">Business Class Seats:</label>
        <input type="number" name="business" id="Business" placeholder="Business Class" >
        <br/>

        <input type="button" onclick="calculatTotalFare()" value="Calculate Fare"/>
        <br/>

        <label for="result">Total Fare:</label>
        <input type="text" name="result" id="result" readonly>
        <br/>

        <label for="airFare">Total Air Fare:</label>
        <input type="text" id="airFare" name="totalAirFare" readonly>
        <br/>

        <label for="totSeats">Total Seats:</label>
        <input type="text" id="totSeats" name="totalSeats" readonly>
        <br/>

        <input type="submit" value="Book"/>
    </form>

    <script>
        function calculatTotalFare() {
            var economy = Number(document.getElementById("Economy").value);
            var first = Number(document.getElementById("First").value);
            var business = Number(document.getElementById("Business").value);

            document.getElementById("totSeats").value = economy + first + business;
            
            if (economy==="" && first==="" && business==="") {
                alert("Please enter valid number of seats for each class.");
                return;
            }

            var economyAvailable = <%= displaySeatsAvailable.getEconomyClassSeats()%>;
            var firstAvailable = <%= displaySeatsAvailable.getFirstClassSeats() %>;
            var businessAvailable = <%= displaySeatsAvailable.getBusinessClasSeats() %>;

           
            if (economy > economyAvailable || first > firstAvailable || business > businessAvailable) {
                alert("Seats Not Available!! Choose Accordingly");
                return;
            }

            var economyFare = economy * <%= displayFlightFare.getEconomyClassFare()%>;
            var firstFare = first * <%= displayFlightFare.getFirstClassFare()%>;
            var businessFare = business * <%= displayFlightFare.getBusinessClassFare()%>;

            document.getElementById("result").value = economyFare + firstFare + businessFare;
            document.getElementById("airFare").value = economyFare + firstFare + businessFare;
        }

        function validateForm() {
            var fare = document.getElementById("result").value;
            var totalSeats = document.getElementById("totSeats").value;

            if (fare === "") {
                alert("Please calculate fare for your journey");
                return false;
            }
          
            if (parseInt(totalSeats) <= 0) {
                alert("Please enter the number of seats for booking.");
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html> --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Book Tickets</title>
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

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
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

        input[type="number"] {
            width: 100%;
        }

        input[type="button"], input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="button"]:hover, input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="text"] {
            width: 100%;
            margin-top: 10px;
        }

        input[type="text"]:read-only {
            background-color: #eee;
        }

        input[type="text"]:disabled {
            background-color: #ddd;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
         .flight-details {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <%
    Flight displayFlight=(Flight) session.getAttribute("displayFlight");
    AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
    Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailables");
    %>
    <%
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl= ctx+"/user/home";;
	%>

   <%--  <p><%= displayFlight.getAirlines() %></p>
    <p> <%= displayFlightFare.getEconomyClassFare()%></p>
    <p><%= displaySeatsAvailable.getTotalSeats() %> </p> --%>
   		<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    	</header><br><br>
    <div class="flight-details">
        <h2>Flight Details</h2>
        <strong>Airlines: </strong><%= displayFlight.getAirlines() %>
        <strong>Flight No:</strong> <%= displayFlight.getFlightNo() %><br/>
        <strong>From:</strong><%= displayFlight.getSource() %>(<%= displayFlight.getSourceDate() %>-<%= displayFlight.getSourceTime()%>-<%=displayFlight.getSourceTimeZone() %>)<br/>
        <strong>To:</strong><%= displayFlight.getDestination() %>(<%= displayFlight.getDestinationDate() %>-<%= displayFlight.getDestinationTime() %>-<%=displayFlight.getDestinationTimeZone() %>)<br/>
        <strong>Economy Class Fare:</strong><%= displayFlightFare.getEconomyClassFare()%> |
        <strong>First Class Fare:</strong><%=displayFlightFare.getFirstClassFare() %> |
        <strong>Business class Fare:</strong><%= displayFlightFare.getBusinessClassFare() %><br/>
        <strong>Seats Available</strong><br/>
        <strong>Economy Class:</strong><%=displaySeatsAvailable.getEconomyClassSeats() %> |
        <strong>First Class:</strong><%=displaySeatsAvailable.getFirstClassSeats() %> |
        <strong>Business Class:</strong><%= displaySeatsAvailable.getBusinessClasSeats() %>
    </div>

    <form action="paymentsPage" method="get" onsubmit="return validateForm()">
        <label for="Economy">Economy Class Seats:</label>
        <input type="number" name="economy" id="Economy" placeholder="Economy Class" >
        <br/>

        <label for="First">First Class Seats:</label>
        <input type="number" name="first" id="First" placeholder="First Class" >
        <br/>

        <label for="Business">Business Class Seats:</label>
        <input type="number" name="business" id="Business" placeholder="Business Class" >
        <br/>

        <input type="button" onclick="calculatTotalFare()" value="Calculate Fare"/>
        <br/>

        <label for="result">Total Fare:</label>
        <input type="text" name="result" id="result" readonly>
        <br/>

        <label for="airFare">Total Air Fare:</label>
        <input type="text" id="airFare" name="totalAirFare" readonly>
        <br/>

        <label for="totSeats">Total Seats:</label>
        <input type="text" id="totSeats" name="totalSeats" readonly>
        <br/>

        <input type="submit" value="Book"/>
        <button class="home-button">Home</button>
    </form>
    <footer>
        &copy; 2023 Flight Booking System
    </footer>
     <button class="home-button" onclick="redirectToHome()">Home</button>
    <script>
        function calculatTotalFare() {
            var economy = Number(document.getElementById("Economy").value);
            var first = Number(document.getElementById("First").value);
            var business = Number(document.getElementById("Business").value);

            document.getElementById("totSeats").value = economy + first + business;
            
            if (economy==="" && first==="" && business==="") {
                alert("Please enter valid number of seats for each class.");
                return;
            }

            var economyAvailable = <%= displaySeatsAvailable.getEconomyClassSeats()%>;
            var firstAvailable = <%= displaySeatsAvailable.getFirstClassSeats() %>;
            var businessAvailable = <%= displaySeatsAvailable.getBusinessClasSeats() %>;

           
            if (economy > economyAvailable || first > firstAvailable || business > businessAvailable) {
                alert("Seats Not Available!! Choose Accordingly");
                return;
            }

            var economyFare = economy * <%= displayFlightFare.getEconomyClassFare()%>;
            var firstFare = first * <%= displayFlightFare.getFirstClassFare()%>;
            var businessFare = business * <%= displayFlightFare.getBusinessClassFare()%>;

            document.getElementById("result").value = economyFare + firstFare + businessFare;
            document.getElementById("airFare").value = economyFare + firstFare + businessFare;
        }

        function validateForm() {
            var fare = document.getElementById("result").value;
            var totalSeats = document.getElementById("totSeats").value;

            if (fare === "") {
                alert("Please calculate fare for your journey");
                return false;
            }
          
            if (parseInt(totalSeats) <= 0) {
                alert("Please enter the number of seats for booking.");
                return false;
            }
            
            return true;
        }
        
        function redirectToHome() {
            window.location.href ='<%= homeUrl %>';
        }
        
    </script>
</body>
</html>

