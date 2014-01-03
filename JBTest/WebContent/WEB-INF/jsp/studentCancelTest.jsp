<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="student_main.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script type="text/javascript" language="javascript" src="motimonso/motimonso.nocache.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_students.js"></script>
	</head>
	<body>
		<%@ include file="header.jsp"%>
		<div id="page-container">
			<%@ include file="studentNavigation.jsp"%>
			<h1 align="center">ברוך הבא</h1>
			<table id="stud_details" dir="rtl" width="50%" align="center"
				cellpadding="5" cellspacing="5">
				<tr>
					<td>ת.ז</td>
					<td>שם משפחה</td>
					<td>שם פרטי</td>
					<td>S.R</td>
				</tr>

			</table>
			<h1 align="center">מבחנים</h1>
			<table id="nextTable" dir="rtl" width="50%" align="center"
				cellpadding="5" cellspacing="5">
				<tr>
					<td>מספר קורס</td>
					<td>שם קורס</td>
					<td>תאריך</td>
					<td>שעה</td>
					
				</tr>

			</table>
			
			<form id="test_reg_form" dir="rtl">
				תאריך: <input type="text" name="startDate"> 
				שעה: <input type="text" name="startDate"> <br><br> 
				<input type="submit" value="בטל הרשמה"> <input
					type="submit" value="ביטול">
			</form>
			
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>