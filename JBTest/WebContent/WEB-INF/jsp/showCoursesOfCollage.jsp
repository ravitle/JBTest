<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 if (request.getParameter("id") == null) {  %>
	 0
 <%} else { 
 
	String id = request.getParameter("id").toString();
	// array = select * from courses where collage_id = 'id'
	
	// for(1:array.size) {
	
		// print courseName +  ',' + courseId 
		
	//}
	%>
	
	דדי,1,שלומי,2,מרגריטה,3

<% } %>