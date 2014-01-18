<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="MainEntrance.css">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<script type="text/javascript" language="javascript" src="jbtest_main/jbtest_main.nocache.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" language="javascript" src="script_main.js"></script>

<title>links</title>
</head>
<body>

<div id="pageContainer">
<%@ include file="header.jsp"%>
		<div id="mainContain">

	<div id="mainTool" dir="rtl">
	<h2>
		<a href="Sys_MainEntrance" style="color:white">כניסת סגל</a>
		<a href="Main" style="color:white">כניסת סטודנט</a>
		<a href="aboutUs" style="color:white">אודות</a>
		<a href="contactUs" style="color:white">צור קשר</a>
	</h2>	
	
	</div>
	<br>
	<div id="pageContainerTable" align="center">

		<h1 align="center" dir="rtl">קישורים</h1>

		<%@ include file="logo_links.jsp"%>
	
	</div>
	</div>
	<%@ include file="footer.jsp"%>
</div>


</body>
</html>