<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <h2>
 <%
 String headermessage=(String) request.getAttribute("headermessage");
 if(headermessage!=null)
 {
 	out.print(headermessage);
 }
 
 %>
 
 </h2>
<p>
<%

String message=(String) request.getAttribute("message");
if(message!=null)
{
	out.print(message);
}

%>
</p>