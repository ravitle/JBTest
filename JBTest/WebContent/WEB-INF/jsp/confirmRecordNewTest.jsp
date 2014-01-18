<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 if (request.getParameter("id") == null && request.getParameter("pressed") == null && request.getParameter("date") == null){  %>
	 0
 <%} else { 
	int id = Integer.parseInt(request.getParameter("id").toString());
	String date = request.getParameter("date");
	String free = request.getParameter("pressed").toString();
	// confirm record in db using the id
	DBConnectionClass.confirmTest(id,date,free);
	%>
	1
<% } %>