<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="sys_main.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_sys.js"></script>
	</head>
	<body>
		
	<div id="page-container">
		<%@ include file="header.jsp"%>
		<div id="mainContain">
		
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
			<br><br><br><br><br>
			<div id="coursesInfo">				
			<table id="courseTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
				<tr bgcolor="#909090">
				<td>קוד קורס</td>
				<td>שם קורס</td>
				<td>תאריך התחלה </td>
				<td>תאריך סיום</td>
			</tr>
			
			<% String[][] courseArr = DBConnectionClass.courseInfo(); %>
			<% int rows = DBConnectionClass.rowsNum(courseArr); %>
			<% for (int i = 0; i < rows; i++) { %>
				<tr>
				<% for (int j = 0; j < 2; j++) { %>
					<td>
						<% if (j == 0) {%>
						<a href="Sys_CourseUpdate?ccode=<%= courseArr[i][j] %>">
							<%= courseArr[i][j] %>
						</a>
						<% } %>
						<% if (j != 0) {%>
							<%= courseArr[i][j] %>
						<% } %>	
			 		</td>
			   	<% } %>
				</tr>
			<% } %>
				
			</table>
			
			</div>
			<br><br>
			<form action="Sys_New_Course" method ="post" id="form">
				<center><input type="submit" value="הוספת קורס חדש" id="createCourseButton"></center>
			</form>
			</div>
			<%@ include file="footer.jsp"%>
			
		</div>
		
	</body>
</html>