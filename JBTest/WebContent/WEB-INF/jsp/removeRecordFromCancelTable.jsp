<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 if (request.getParameter("id") == null && request.getParameter("date") == null) {  %>
	 0
 <%} else { 
	int id = Integer.parseInt(request.getParameter("id").toString());
	String date = request.getParameter("date").toString();
	// remove record from db using the id
	DBConnectionClass.deleteTest(id,date);
	%>
	1
<% } %>