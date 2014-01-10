<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "jbtestPro_v1.server.DBConnectionClass" %>

<%
	
	String userName = request.getParameter("userName");	
	String email = request.getParameter("email");
	
	// session
	if (userName != null && email != null)
	{
		if (DBConnectionClass.changeSysPasswordCheck(userName, email) == 0)
		{	
			String redirectURL = "PasswordHasChanged";
		    response.sendRedirect(redirectURL);	
		}
	}
	

	// session
	if (email != null)
	{
		if (DBConnectionClass.changeSysUserCheck(email) == 0)
		{	
			String redirectURL = "UserHasChanged";
		    response.sendRedirect(redirectURL);	
		}
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<link type="text/css" rel="stylesheet" href="MainEntrance.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<script type="text/javascript" language="javascript" src="jbtest_main/jbtest_main.nocache.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_main.js"></script>
		<title>ForgetPassword</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div id="pageContainer">
		<div id="mainTool" dir="rtl">
		<h2>
		<a href="Sys_MainEntrance" style="color:white" >כניסת סגל</a>
		<a href="links" style="color:white">קישורים</a>
		<a href=aboutUs style="color:white">אודות</a>
		<a href="contactUs" style="color:white">צור קשר</a>
		</h2>
		</div>
	<br>
	<div id="pageContainerTable">
		<table align= "center"  dir="rtl" bgcolor="#E0E0E0" bordercolor="#C8C8C8" border="1"
				width="30%"  cellpadding="30" cellspacing="20" >
		<tr>
		<td>
		<form action="sysForgotPasswordUser" method="post" id="enterFrom" name="enter" dir="rtl">
							<h5>	שכחת סיסמא?</h5>
		שם משתמש:<input type="text" name="user"> <br>
								
			אימייל:<input type="text" name="email"><br>
			<input type="submit" value="אשר" id="changePassword">
		</form>
		</td>
	
		<td>
		<form action="sysForgotPasswordUser" method="post" id="enterFrom" name="enter" dir="rtl">
				<h5>שכחת משתמש?</h5>
			אימייל:<input type="text" name="email"><br>
			<input type="submit" value="אשר" id="changeUserName">
		</form>
		</td>
		</tr>
		</table>
		
	</div>


</body>
</html>