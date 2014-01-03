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
		<%@ include file="header.jsp"%>
		<div id="page-container">
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
			<div id="todays-test-sys">
				<h2>:נבחנים היום</h2>
				<br>
				<%@ include file="sys_todayTable.jsp"%>
			</div>
			<div id="new-test-sys">
				<br>
				<br>
				<br>
				<h2>:נרשמים שמחכים לאישור רישום</h2>
				<br>
				<%@ include file="sys_newTable.jsp"%>
			</div>
			<div id="cancle-test-sys">
				<br>
				<br>
				<br>
				<h2>:נרשמים שמחכים לאישור ביטול</h2>
				<br>
				<%@ include file="sys_cancelledTable.jsp"%>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>