<%@page import="jbtestPro_v1.server.CalenderClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%HttpSession staffSession=request.getSession(true); %>
<%String currSys=(String)session.getAttribute("currSystem"); %>

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
<<<<<<< HEAD
		<%@ include file="header.jsp"%>
		<div id="mainContain">
=======
		
>>>>>>> 6095bede805dfd9fe5551cc2c27f034e3aa1fe2f
			<div id = "sys-user">
				<h4 align ="right"><%=DBConnectionClass.staffName(currSys)%> מחובר</h4>
			</div>
			<div id = "sys-date">
				<h4 align ="left"><%=CalenderClass.getTodayFullDate()%></h4>
			</div>
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
<<<<<<< HEAD
			
=======
				<div id="mainContain">
>>>>>>> 6095bede805dfd9fe5551cc2c27f034e3aa1fe2f
			<div id="todays-test-sys">
				<br><br>
				<h3>:נבחנים היום</h3>
				<br>
				<%@ include file="sys_todayTable.jsp"%>
			</div><br>
			<div id="new-test-sys">
				<h3>:נרשמים שמחכים לאישור רישום</h3>
				<br>
				<%@ include file="sys_newTable.jsp"%>
			</div>
			<div id="cancle-test-sys">
				<h3>:נרשמים שמחכים לאישור ביטול</h3>
				<br>
				<%@ include file="sys_cancelledTable.jsp"%>
			</div>
			</div>
<<<<<<< HEAD
			<%@ include file="footer.jsp"%>
=======
>>>>>>> 6095bede805dfd9fe5551cc2c27f034e3aa1fe2f
		</div>
		
	</body>
</html>