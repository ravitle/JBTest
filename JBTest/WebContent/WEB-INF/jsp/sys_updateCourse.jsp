<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%	
	String code = request.getParameter("ccode");	
%>

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
			<div id="new-course-sys">
				<br><h2>עדכון קורס</h2><br><br>
				<form action="Sys_Construction" method ="post" id="form" name="updatecourseform" dir="rtl">
					קוד קורס: <input type="text" name="courseCode" value=<%=code%>><br>
					שם קורס: <input type="text" name="courseName" value=<%=DBConnectionClass.searchByCourseCode(code).getCourseName()%>><br>
					תאריך התחלה: <input type="text" name="startDate"  value="-"><br>
					תאריך סיום: <input type="text" name="endDate" value="-"><br><br>
					<input type="submit" value="עדכן" id="updateCourseButton">
				</form>
			</div>
			</div>
			<%@ include file="footer.jsp"%>
		</div>
		
	</body>
</html>