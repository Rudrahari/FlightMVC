<%@page import="flight.app.entities.Airlines"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Airlines</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1 {
            color: #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .edit-button {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .edit-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<%
List<Airlines> allAirlinesModel=(List<Airlines>) session.getAttribute("allAirlinesModel");
%>

    <h1>List of Airlines Model</h1>

    <table>
        <thead>
            <tr>
                <th>Airline Name</th>
                <th>Flight Model</th>
                <th>Flight No</th>
                <th>Total Seats</th>
                <th>Economy Seats</th>
                <th>First Class Seats</th>
                <th>Business Seats</th>
                <th>Action</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <% for(int i=0;i<allAirlinesModel.size();i++) { %>
            <tr>
                <td><%= allAirlinesModel.get(i).getAirlinesName() %></td>
                <td><%= allAirlinesModel.get(i).getFlightModel() %></td>
                <td><%= allAirlinesModel.get(i).getFlightNo() %></td>
                <td><%= allAirlinesModel.get(i).getTotalSeats() %></td>
                <td><%= allAirlinesModel.get(i).getEconomyClassSeats() %></td>
                <td><%= allAirlinesModel.get(i).getFirstClassSeats() %></td>
                <td><%= allAirlinesModel.get(i).getBusinessClasSeats() %></td>
                <td><button><a href="updateAirlines?id=<%= allAirlinesModel.get(i).getId() %>">Edit</a></button></td>
                <td><button><a href="deleteAirlines?id=<%= allAirlinesModel.get(i).getId() %>">Delete</a></button></td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Airlines</title>
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
	        top: 15px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .edit-button, .delete-button {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .edit-button {
            background-color: #007bff;
            color: white;
        }

        .edit-button:hover {
            background-color: #0056b3;
        }

        .delete-button {
            background-color: #dc3545;
            color: white;
        }

        .delete-button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<% 
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl= ctx+"/admin/home";
	%>
	<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    </header><br><br>
    <button class="home-button" onclick="redirectToHome()">Home</button>
<%
List<Airlines> allAirlinesModel=(List<Airlines>) session.getAttribute("allAirlinesModel");
%>

    <h1>List of Airlines Model</h1>

    <table>
        <thead>
            <tr>
                <th>Airline Name</th>
                <th>Flight Model</th>
                <th>Flight No</th>
                <th>Total Seats</th>
                <th>Economy Seats</th>
                <th>First Class Seats</th>
                <th>Business Seats</th>
                <th>Action</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <% for(int i=0;i<allAirlinesModel.size();i++) { %>
            <tr>
                <td><%= allAirlinesModel.get(i).getAirlinesName() %></td>
                <td><%= allAirlinesModel.get(i).getFlightModel() %></td>
                <td><%= allAirlinesModel.get(i).getFlightNo() %></td>
                <td><%= allAirlinesModel.get(i).getTotalSeats() %></td>
                <td><%= allAirlinesModel.get(i).getEconomyClassSeats() %></td>
                <td><%= allAirlinesModel.get(i).getFirstClassSeats() %></td>
                <td><%= allAirlinesModel.get(i).getBusinessClasSeats() %></td>
                <td>
                    <form action="updateAirlines" method="get">
                        <input type="hidden" name="id" value="<%= allAirlinesModel.get(i).getId() %>"/>
                        <button type="submit" class="edit-button">Edit</button>
                        
                    </form>
                </td>
                <td>
                    <button onclick="deleteAirlines('<%= allAirlinesModel.get(i).getId() %>')" class="delete-button">Delete</button>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    
    

    <script>
        function deleteAirlines(id) {
            var shouldDelete = confirm("Are you sure you want to delete this record?");
            if (shouldDelete) {
                window.location.href = "deleteAirlines?id=" + id;
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

