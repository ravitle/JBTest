<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="sys_main.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script type="text/javascript" language="javascript" src="motimonso/motimonso.nocache.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_students.js"></script>
	</head>
	<body>
		
		
		<div id="page-container">
		<%@ include file="header.jsp"%>
				<div id="mainContain">
		
		<%@ include file="studentSearch.jsp" %>
			<%@ include file="studentNavigation.jsp"%>
			<h1 align="center">לוח זמנים</h1>
			<%@ include file="calender.jsp" %>
			</div>
			<%@ include file="footer.jsp"%>
		</div>
		
	</body>
</html>