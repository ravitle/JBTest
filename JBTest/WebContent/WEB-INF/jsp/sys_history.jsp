<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="sys_main.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script type="text/javascript" language="javascript" src="jbtest_sys_v2/jbtest_sys_v2.nocache.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_sys.js"></script>
	</head>
	<body>
		<%@ include file="header.jsp"%>
		<div id="page-container">
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
			<div id="history-sys">
				<h2>דו"ח תקופתי</h2><br>
				<form action="Sys_Construction" method ="post" id="form" name="historyform" dir="rtl">
					בחר תאריך התחלה: <input type="text" name="startDate">
					בחר תאריך סיום: <input type="text" name="endDate">
					<input type="submit" value="בחר" id="chooseButton"><br>
				</form>
				<table id="historyTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
					<tr bgcolor="#909090">
						<td>ת.ז</td>
						<td>שם משפחה</td>
						<td>שם פרטי</td>
						<td>תאריך</td>
						<td>שעה</td>
						<td>עלות</td>
					</tr>
			 	</table>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>