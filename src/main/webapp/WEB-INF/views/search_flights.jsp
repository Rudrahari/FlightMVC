<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Flights</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	flex-direction: column;
}

h1 {
	color: #007bff;
	margin-bottom: 20px;
}

#search-form {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 600px;
}

label {
	display: block;
	margin-bottom: 10px;
	color: #555;
}

input {
	width: calc(100% - 20px);
	padding: 15px;
	margin-bottom: 15px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 15px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
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

</style>
</head>
<body>

<%
Date currentDate=Date.valueOf(LocalDate.now());

%>
	<h1>Search Flights</h1>

	<form id="search-form" onsubmit="return submitForm()">
		<div style="flex: 1; margin-right: 10px;">
			<label for="origin">From:</label> <input type="text" id="origin"
				name="source" required>
		</div>

        <div id="suggestionsContainer" class="suggestions-container"></div>
        
		<div style="flex: 1; margin-right: 10px;">
			<label for="destination">To::</label> <input type="text"
				id="destination" name="destination" required>
		</div>

		<div style="flex: 1; margin-right: 10px;">
			<label for="travel-date">Date:</label> <input type="date"
				id="travel-date" name="travelDate" min="<%= currentDate%>"required>
		</div>

		<button type="submit">Search Flights</button>
	</form>

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
    </script>
</body>
</html>
 --%>
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Flights</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	flex-direction: column;
}
header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            position: fixed;
            top: 0;
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
            width: 100%;
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

h1 {
	color: #007bff;
	margin-bottom: 20px;
}

#search-form {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 600px;
}

label {
	display: block;
	margin-bottom: 10px;
	color: #555;
}

input {
	width: calc(100% - 20px);
	padding: 15px;
	margin-bottom: 15px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 15px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
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

</style>
</head>
<body>

<%
Date currentDate=Date.valueOf(LocalDate.now());

%>

	<header>
        <a href="home" class="logo">Flight Booking System</a>
    </header><br><br>
	<h1>Search Flights</h1>
	<button class="home-button" onclick="redirectToHome()">Home</button>

	<form id="search-form" onsubmit="return submitForm()">
		<div style="flex: 1; margin-right: 10px;">
			<label for="origin">From:</label> <input type="text" id="origin"
				name="source" required>
		</div>

        <div id="suggestionsContainer" class="suggestions-container"></div>
        
		<div style="flex: 1; margin-right: 10px;">
			<label for="destination">To::</label> <input type="text"
				id="destination" name="destination" required>
		</div>

		<div style="flex: 1; margin-right: 10px;">
			<label for="travel-date">Date:</label> <input type="date"
				id="travel-date" name="travelDate" min="<%= currentDate%>"required>
		</div>
		

		<button type="submit">Search Flights</button>
	</form>
	<footer>
        &copy; 2023 Flight Booking System
    </footer>

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
        
function redirectToHome() {
    window.location.href = 'home'; //user
}

    </script>
</body>
</html>
 