<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>


<%
 if (request.getParameter("id") == null && request.getParameter("firstname") == null && request.getParameter("lastname") == null 
 && request.getParameter("firstnameeng") == null && request.getParameter("lastnameeng") == null 
 && request.getParameter("password") == null && request.getParameter("confirmpassword") == null 
 && request.getParameter("email") == null && request.getParameter("address") == null 
 && request.getParameter("city") == null && request.getParameter("phone1") == null 
 && request.getParameter("phone2") == null && request.getParameter("collage") == null 
 && request.getParameter("course") == null && request.getParameter("check") == null 
 && request.getParameter("check").toString().equals(false) 
 && request.getParameter("confirmpassword").toString().equals(request.getParameter("password").toString())) {  %>
	 0
 <%} else { 
		int id = Integer.parseInt(request.getParameter("id").toString());
		String lastNameh = request.getParameter("lastname").toString();
		String firstNameh = request.getParameter("firstname").toString();
		String lastNamee = request.getParameter("lastnameeng").toString();
		String firstNamee = request.getParameter("firstnameeng").toString();
		String password = request.getParameter("password").toString();
		String email = request.getParameter("email").toString();
		String address = request.getParameter("address").toString();
		String city = request.getParameter("city").toString();
		String phone1 = request.getParameter("phone1").toString();
		String phone2 = request.getParameter("phone2").toString();
		String course = request.getParameter("course").toString();
		String collage = request.getParameter("collage").toString();
		
		DBConnectionClass.insertToSql(id, firstNameh, lastNameh, firstNamee, lastNamee, password, address, city, email, phone1, phone2, collage, course);
	 %>
		1
 <%}%>