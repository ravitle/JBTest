<%@page import="jbtestPro_v1.server.CalenderClass"%>
<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 if (request.getParameter("date") == null && request.getParameter("hour") == null &&
 request.getParameter("secondShot")==null && request.getParameter("test")==null) {  %>
	 0
 <%} else { 
	
	 String date=CalenderClass.dateFormatWebToServer(request.getParameter("date"));
	 String hour=request.getParameter("hour");
	 String secondShot=request.getParameter("secondShot");
	 String test=request.getParameter("test");
	 
	 String tempdate="";
		String[] temp=new String[3];
		temp[0] = date.substring(0,2);
		temp[1] = date.substring(3,5);
		temp[2] = date.substring(6,date.length());
	
	int numOfTestInDay=CalenderClass.getNumOfRegStudent(temp[0], temp[1], temp[2]);
	System.out.println(numOfTestInDay);
	 int id = Integer.parseInt((String)session.getAttribute("currStudent"));
		
	 if(numOfTestInDay>=3)
	 {
		 
	 }
	 else if(numOfTestInDay==-1)	 
	 {
		 DBConnectionClass.insertNewSchedule(date);
		 DBConnectionClass.insertTotest(test, id, date, secondShot, 580, hour);

	 }
	 else
	 {
		 DBConnectionClass.updateSchedule(date);
		 DBConnectionClass.insertTotest(test, id, date, secondShot, 580, hour);

	 }
	 
	
	%>
	1
<% } %>