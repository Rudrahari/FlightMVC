<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="flight.app.entities.BookingDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <!-- Add your CSS styles here -->
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

        form {
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

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input, select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error {
            color: red;
            margin-bottom: 10px;
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
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .total-amount {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
BookingDetails bookingDetails=(BookingDetails) session.getAttribute("flightTicket");
%>
    <form action="generateBookingTickets" method="get" onsubmit="return validateForm()">
        <h1>Payment Page</h1>
        
        <label for="totalAmount" class="total-amount"><%= bookingDetails.getTotalFare() %></label>
       
        <input type="hidden" id="totalAmount" name="totalAmount" value="500.00">

        <label for="cardType">Card Type:</label>
        <select id="cardType" name="cardType" required>
            <option value="Visa">Visa</option>
            <option value="Mastercard">Mastercard</option>
            <option value="American Express">American Express</option>
            <option value="RuPay">RuPay</option>
        </select>

        <label for="cardNumber">Credit Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" required pattern="[0-9]{13,19}" maxlength="19" placeholder="Enter 13 to 19-digit card number">

        <div class="error" id="cardNumberError"></div>

        <label for="expiryDate">Expiry Date:</label>
        <input type="date" id="expiryDate" name="expiryDate" required>

        <div class="error" id="expiryDateError"></div>

        <label for="cvv">CVV:</label>
        <input type="password" id="cvv" name="cvv" required pattern="[0-9]{3,4}" placeholder="Enter CVV">

        <div class="error" id="cvvError"></div>

        <button type="submit">Pay Now</button>
    </form>

    <script>
        function validateForm() {
            // Card number validation
            var cardNumber = document.getElementById('cardNumber').value;
            var cardType = document.getElementById('cardType').value;
            var cardNumberError = document.getElementById('cardNumberError');

            // Regular expression for card types
            var visaPattern = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
            var mastercardPattern = /^(?:5[1-5][0-9]{14})$/;
            var amexPattern = /^(?:3[47][0-9]{13})$/;
            var rupayPattern = /^(?:6[0-9]{15})$/;

            var valid = false;

            switch (cardType) {
                case 'Visa':
                    valid = visaPattern.test(cardNumber);
                    break;
                case 'Mastercard':
                    valid = mastercardPattern.test(cardNumber);
                    break;
                case 'American Express':
                    valid = amexPattern.test(cardNumber);
                    break;
                case 'RuPay':
                    valid = rupayPattern.test(cardNumber);
                    break;
                default:
                    valid = false;
            }

            if (!valid) {
                cardNumberError.innerHTML = 'Invalid card number for the selected card type.';
                return false;
            } else {
                cardNumberError.innerHTML = '';
            }

            // Expiry date validation
            var expiryDate = document.getElementById('expiryDate').value;
            var expiryDateError = document.getElementById('expiryDateError');
            var currentDate = new Date();
            var currentMonth = currentDate.getMonth() + 1;
            var currentYear = currentDate.getFullYear() % 100;

            var enteredMonth = parseInt(expiryDate.split('-')[1], 10);
            var enteredYear = parseInt(expiryDate.split('-')[0], 10);

            if (enteredYear < currentYear || (enteredYear === currentYear && enteredMonth < currentMonth)) {
                expiryDateError.innerHTML = 'Invalid expiry date.';
                return false;
            } else {
                expiryDateError.innerHTML = '';
            }

            var cvv = document.getElementById('cvv').value;
            var cvvError = document.getElementById('cvvError');
            var cvvPattern = /^[0-9]{3,4}$/;

            if (!cvvPattern.test(cvv)) {
                cvvError.innerHTML = 'Invalid CVV.';
                return false;
            } else {
                cvvError.innerHTML = '';
            }

            return true;
        }
    </script>
</body>
</html> --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <!-- Add your CSS styles here -->
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
	        top: 2px;
	        left: 30px;
        	background-color: white;
        	color: #007bff;
	        padding: 10px 20px;
	        border: none;
	        border-radius: 4px;
	        cursor: pointer;
	        width:5%; 
	        z-index: 1000;
         }

		.home-button:hover {
		background-color: silver;
}

        form {
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

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input, select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error {
            color: red;
            margin-bottom: 10px;
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
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .total-amount {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
Date tommorowDate=Date.valueOf(LocalDate.now().plusDays(1));

%>
<%
BookingDetails bookingDetails=(BookingDetails) session.getAttribute("flightTicket");
%>
		<header>
        <a href="#" class="logo">Flight Booking System</a>
    	</header><br><br>
    <form action="generateBookingTickets" method="get" onsubmit="return validateForm()">
        <h1>Payment Page</h1>
        
        <label for="totalAmount" class="total-amount"><strong>Amount to be Paid:</strong>  <%= bookingDetails.getTotalFare() %></label>
       
        <input type="hidden" id="totalAmount" name="totalAmount" value="<%= bookingDetails.getTotalFare() %>">

        <label for="cardType">Card Type:</label>
        <select id="cardType" name="cardType" required>
            <option value="Visa">Visa</option>
            <option value="Mastercard">Mastercard</option>
            <option value="American Express">American Express</option>
            <option value="RuPay">RuPay</option>
        </select>

        <label for="cardNumber">Credit Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" required pattern="[0-9]{13,19}" maxlength="19" placeholder="Enter 13 to 19-digit card number">

        <div class="error" id="cardNumberError"></div>

        <label for="expiryDate">Expiry Date:</label>
        <input type="date" id="expiryDate" min="<%= tommorowDate %>" name="expiryDate" required>

        <div class="error" id="expiryDateError"></div>

        <label for="cvv">CVV:</label>
        <input type="password" id="cvv" name="cvv" required pattern="[0-9]{3,4}" placeholder="Enter CVV">

        <div class="error" id="cvvError"></div>

        <button type="submit">Pay Now</button>
        <button class="home-button">Home</button>
    </form>
    	<footer>
        &copy; 2023 Flight Booking System
    	</footer>
	

    <script>
        function validateForm() {
            // Card number validation
            var cardNumber = document.getElementById('cardNumber').value;
            var cardType = document.getElementById('cardType').value;
            var cardNumberError = document.getElementById('cardNumberError');

            // Regular expression for card types
            var visaPattern = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
            var mastercardPattern = /^(?:5[1-5][0-9]{14})$/;
            var amexPattern = /^(?:3[47][0-9]{13})$/;
            var rupayPattern = /^(?:6[0-9]{15})$/;

            var valid = false;

            switch (cardType) {
                case 'Visa':
                    valid = visaPattern.test(cardNumber);
                    break;
                case 'Mastercard':
                    valid = mastercardPattern.test(cardNumber);
                    break;
                case 'American Express':
                    valid = amexPattern.test(cardNumber);
                    break;
                case 'RuPay':
                    valid = rupayPattern.test(cardNumber);
                    break;
                default:
                    valid = false;
            }

            if (!valid) {
                cardNumberError.innerHTML = 'Invalid card number for the selected card type.';
                return false;
            } else {
                cardNumberError.innerHTML = '';
            }

            // Expiry date validation
            var expiryDate = document.getElementById('expiryDate').value;
            var expiryDateError = document.getElementById('expiryDateError');
            var currentDate = new Date();
            var currentMonth = currentDate.getMonth() + 1;
            var currentYear = currentDate.getFullYear() % 100;

            var enteredMonth = parseInt(expiryDate.split('-')[1], 10);
            var enteredYear = parseInt(expiryDate.split('-')[0], 10);

            if (enteredYear < currentYear || (enteredYear === currentYear && enteredMonth < currentMonth)) {
                expiryDateError.innerHTML = 'Invalid expiry date.';
                return false;
            } else {
                expiryDateError.innerHTML = '';
            }

            var cvv = document.getElementById('cvv').value;
            var cvvError = document.getElementById('cvvError');
            var cvvPattern = /^[0-9]{3,4}$/;

            if (!cvvPattern.test(cvv)) {
                cvvError.innerHTML = 'Invalid CVV.';
                return false;
            } else {
                cvvError.innerHTML = '';
            }

            return true;
        }
    </script>
</body>
</html>

