<%@page import="java.util.List"%>
<%@page import="flight.app.entities.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admins List</title>
</head>
<body>
<%
  List<Admin> displayAdminsList=(List<Admin>) request.getAttribute("displayAdminsList");
%>
   <table>
    <caption>Flights</caption>
    <tr>
    <th>id</th>
    <th>Full Name</th>
    <th>email</th>
    <th>Mobile</th>
    <th>DOB</th>
    <th>Gender</th>
    <th> Access </th>
    <th>Revoke Access</th>
    <th>Grant Access</th>
    
    </tr> 
    <%    
    for(int i=0;i<displayAdminsList.size();i++){
    	   %>
   
   <tr>
    <td><%= i+1 %></td>
    <td><%= displayAdminsList.get(i).getFullName()%></td>
    <td><%= displayAdminsList.get(i).getEmail()%></td>
    <td><%= displayAdminsList.get(i).getMobile()%></td>
    <td><%= displayAdminsList.get(i).getDob()%></td>
    <td><%= displayAdminsList.get(i).getGender()%></td>
    <td><%= displayAdminsList.get(i).getAccess()%></td>
    <td><a href="revokeAccess?email=<%= displayAdminsList.get(i).getEmail()%>">Revoke</a></td>
    <td><a href="grantAccess?email=<%= displayAdminsList.get(i).getEmail()%>">Grant</a></td>
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
    <meta charset="ISO-8859-1">
    <title>Admins List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            margin: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        caption {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .revoke-button {
            padding: 8px 16px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .revoke-button:hover {
            background-color: #c82333;
        }

        .grant-button {
            padding: 8px 22px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .grant-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
  List<Admin> displayAdminsList=(List<Admin>) request.getAttribute("displayAdminsList");
%>
    <table>
        <caption>Admins List</caption>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Access</th>
            <th>Action </th>
        </tr>

        <%    
        for(int i = 0; i < displayAdminsList.size(); i++) {
        %>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= displayAdminsList.get(i).getFullName()%></td>
            <td><%= displayAdminsList.get(i).getEmail()%></td>
            <td><%= displayAdminsList.get(i).getMobile()%></td>
            <td><%= displayAdminsList.get(i).getDob()%></td>
            <td><%= displayAdminsList.get(i).getGender()%></td>
            <td><%= displayAdminsList.get(i).getAccess()%></td>
            <% if(displayAdminsList.get(i).isActive()){ %>
            <td>
                <form action="revokeAccess" method="get">
                    <input type="hidden" name="email" value="<%= displayAdminsList.get(i).getEmail()%>"/>
                    <button type="submit" class="revoke-button">Revoke</button>
                </form>
            </td>
            <%} %>
              <% if(!displayAdminsList.get(i).isActive()){ %>
            <td>
                <form action="grantAccess" method="get">
                    <input type="hidden" name="email" value="<%= displayAdminsList.get(i).getEmail()%>"/>
                    <button type="submit" class="grant-button">Grant</button>
                </form>
            </td>
             <% } %>
        </tr>
        <%
        }
        %>
    </table>
</body>
</html>

 --%>
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admins List</title>
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

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        caption {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .revoke-button {
            padding: 8px 16px;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .revoke-button:hover {
            background-color: #c82333;
        }

        .grant-button {
            padding: 8px 22px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .grant-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<% 
	String ctx = application.getContextPath();
	//out.print(ctx);
	String homeUrl= ctx+"/admin/home";
%>
<%
  List<Admin> displayAdminsList=(List<Admin>) request.getAttribute("displayAdminsList");
%>
	<header>
        <a href="<%= homeUrl %>" class="logo">Flight Booking System</a>
    </header><br><br><br>
    <table>
        <caption>Admins List</caption>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Access</th>
            <th>Action </th>
        </tr>

        <%    
        for(int i = 0; i < displayAdminsList.size(); i++) {
        %>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= displayAdminsList.get(i).getFullName()%></td>
            <td><%= displayAdminsList.get(i).getEmail()%></td>
            <td><%= displayAdminsList.get(i).getMobile()%></td>
            <td><%= displayAdminsList.get(i).getDob()%></td>
            <td><%= displayAdminsList.get(i).getGender()%></td>
            <td><%= displayAdminsList.get(i).getAccess()%></td>
            <% if(displayAdminsList.get(i).isActive()){ %>
            <td>
                <form action="revokeAccess" method="get">
                    <input type="hidden" name="email" value="<%= displayAdminsList.get(i).getEmail()%>"/>
                    <button type="submit" class="revoke-button">Revoke</button>
                </form>
            </td>
            <%} %>
              <% if(!displayAdminsList.get(i).isActive()){ %>
            <td>
                <form action="grantAccess" method="get">
                    <input type="hidden" name="email" value="<%= displayAdminsList.get(i).getEmail()%>"/>
                    <button type="submit" class="grant-button">Grant</button>
                </form>
            </td>
             <% } %>
        </tr>
        <%
        }
        %>
    </table>
    <button class="home-button" onclick="redirectToHome()">Home</button>
    <script>
        function redirectToHome() {
            window.location.href ='<%= homeUrl %>';
        }
    </script>
    <footer>
        &copy; 2023 Flight Booking System
    </footer>
</body>
</html>
 