<%@page import="java.util.*"%>
<%@ page import="jbtestPro_v1.server.DBConnectionClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="sys_main.css">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>System</title>
<script type="text/javascript" language="javascript"
	src="motimonso/motimonso.nocache.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" language="javascript"
	src="script_students.js"></script>
</head>
<body>
	
	<%HttpSession studentSession=request.getSession(true); %>
	<%String currStud=(String)session.getAttribute("currStudent"); %>
	<%session.setAttribute("fName",DBConnectionClass.searchStudent(currStud).getpNameHeb()); %>
	<%session.setAttribute("lName",DBConnectionClass.searchStudent(currStud).getlNameHeb()); %>
	<%Vector <String[]> result=new Vector<String[]>();
	result=	DBConnectionClass.getHistoryTestById(Integer.parseInt(currStud)); %>
	<%@ include file="header.jsp"%>
	<div id="page-container">
		
		<%@ include file="studentSearch.jsp" %>
		<%@ include file="studentNavigation.jsp"%>
		
		<h1 align="center">מבחנים</h1>
		<table id="table" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
		<tr bgcolor="#909090">
				<td>מספר קורס</td>
				<td>שם קורס</td>
				<td>תאריך</td>
				<td>שעה</td>
		</tr>
		
		</table>
		<h1 align="center">הסטוריה</h1>
		<table id="table" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
		<tr bgcolor="#909090">
				<td>מספר קורס</td>
				<td>שם קורס</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>ציון</td>
		</tr>
		
		<%for (Object o : result) { %>	
		<tr>
	
			<td>  </td>
			<td>  </td>
			<td>  </td>
			<td>  </td>
		
		
		</tr>
		<%} %>

		</table>


	
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>