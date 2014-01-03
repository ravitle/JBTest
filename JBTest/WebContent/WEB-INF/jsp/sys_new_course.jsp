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
			<div id="new-course-sys">
				<br><h2>הוספת קורס חדש</h2><br><br>
				<form action="Sys_Construction" method ="post" id="form" name="newcourseform" dir="rtl">
					קוד קורס: <input type="text" name="courseCode"><br>
					שם קורס: <input type="text" name="courseName"><br>
					תאריך התחלה: <input type="text" name="courseCode"><br>
					תאריך סיום: <input type="text" name="courseName"><br>
					<input type="submit" value="הוסף" id="createButton">
				</form>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>