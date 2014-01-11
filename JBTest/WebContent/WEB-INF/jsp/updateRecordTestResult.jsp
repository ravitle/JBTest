<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 if (request.getParameter("id") == null && request.getParameter("pass") == null ) {  %>
	 0
 <%} else { 
	int id = Integer.parseInt(request.getParameter("id").toString());
	String pass = request.getParameter("pass").toString();
	// update users result in test
	DBConnectionClass.updateTestResult(id, pass);
	%>
	1
<% } %>