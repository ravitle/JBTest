<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 if (request.getParameter("sid") == null && request.getParameter("ssr") == null 
 	&& request.getParameter("slnh") == null && request.getParameter("spnh") == null 
 	&& request.getParameter("slne") == null && request.getParameter("spne") == null 
 	&& request.getParameter("semail") == null && request.getParameter("saddr") == null 
 	&& request.getParameter("scity") == null && request.getParameter("sphone1") == null 
 	&& request.getParameter("sphone2") == null && request.getParameter("scourse") == null 
 	&& request.getParameter("scollage") == null) {  %>
	 0
 <%} else { 
	int id = Integer.parseInt(request.getParameter("sid").toString());
	int sr = Integer.parseInt(request.getParameter("ssr").toString());
	String lastNameh = request.getParameter("slnh").toString();
	String firstNameh = request.getParameter("spnh").toString();
	String lastNamee = request.getParameter("slne").toString();
	String firstNamee = request.getParameter("spne").toString();
	String email = request.getParameter("semail").toString();
	String address = request.getParameter("saddr").toString();
	String city = request.getParameter("scity").toString();
	String phone1 = request.getParameter("sphone1").toString();
	String phone2 = request.getParameter("sphone2").toString();
	String course = request.getParameter("scourse").toString();
	String collage = request.getParameter("scollage").toString();
	// update students details
	DBConnectionClass.updateStudentDetails(id,sr,lastNameh,firstNameh,lastNamee,firstNamee,email,address,city,phone1,phone2,course,collage);
	%>
	1
<% } %>