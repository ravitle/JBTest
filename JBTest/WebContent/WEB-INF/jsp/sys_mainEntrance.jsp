<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import= "jbtestPro_v1.server.DBConnectionClass" %>

<%	String user = request.getParameter("username");	
	String password = request.getParameter("password");
		
	//DBConnectionClass.compUserStaff(user, password);	
	// session
	if (user != null && password != null)
	{
		if (DBConnectionClass.compUserNameStaff(user, password) == 0)
		{
			session.setAttribute("currSystem",user);
			String redirectURL = "Sys_Main";
		    response.sendRedirect(redirectURL);	
		}
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="MainEntrance.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script type="text/javascript" language="javascript" src="jbtest_main/jbtest_main.nocache.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_main.js"></script>
	</head>
	<body>
		<%@ include file="header.jsp"%>
		<div id="pageContainer">
		<div id="mainTool" dir="rtl">
		<h2>
		<a href="Main" style="color:white">כניסת סטודנט</a>
		<a href="links" style="color:white">קישורים</a>
		<a href="aboutUs" style="color:white">אודות</a>
		<a href="contactUs" style="color:white">צור קשר</a>
		</h2>
		</div>
		<br>
		<div id="pageContainerTable">
		
		<h1  align="center" dir="rtl">ברוכים הבאים ל-JBTest</h1>
		<div id="enterTable">

			<table dir="rtl" bgcolor="#E0E0E0" bordercolor="#C8C8C8" border="1"
				width="30%" align="center" cellpadding="30" cellspacing="20">
				<tr>
					<form action="Sys_MainEntrance" method="post" id="enterFrom" name="enter" dir="rtl">
						<td>
							שם משתמש:<input type="text" name="username"> <br>
							סיסמא:<input type="password" name="password"> <br> <a
							href="sysForgotPasswordUser">שכחת סיסמא/שם משתמש?</a><br>
							<input type="submit" value="כניסה" id="enterbutton">
						</td> 
					</form>
				</tr>
			</table>

		</div>
		</div>	
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>