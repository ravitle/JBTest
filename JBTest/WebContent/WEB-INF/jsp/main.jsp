<%@page import="jbtestPro_v1.server.CalenderClass"%>
<%@page import="jbtestPro_v1.server.StudentClass"%>
<%@page import="jbtestPro_v1.server.DBConnectionClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	
	String user = request.getParameter("username");	
	String password = request.getParameter("password");
	
	// session
	if (user != null && password != null)
	{
		if (DBConnectionClass.compUserNameStudent(user, password)==0)
		{	
			session.setAttribute("visitMainPage", 0);
			session.setAttribute("currStudent", user);
			String[] hebName=DBConnectionClass.getStudentHeb(Integer.parseInt(user));
			session.setAttribute("fName",hebName[0]); 
			session.setAttribute("lName",hebName[1]); 
			String redirectURL = "student_main";
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
	<title>Student</title>
		
	</head>
	<body>
	
		<%@ include file="header.jsp"%>
	<div id="pageContainer">
		<div id="mainTool" dir="rtl">
		<h2>
		<a href="Sys_MainEntrance" style="color:white" >כניסת סגל</a>
		<a href="links" style="color:white">קישורים</a>
		<a href="aboutUs" style="color:white">אודות</a>
		<a href="contactUs" style="color:white">צור קשר</a>
		</h2>
		</div>
	<br>
	<div id="pageContainerTable">
		
		<h1 align="center" dir="rtl">ברוכים הבאים ל-JBTest</h1>
		
		<div id="enterTable">

			<table dir="rtl" bgcolor="#E0E0E0" bordercolor="#C8C8C8" border="1"
				width="30%" align="center" cellpadding="30" cellspacing="20">
				<tr>
					<form action="Main"
						method="post" id="enterFrom" name="enter" dir="rtl">
						<td>
						שם משתמש:<input type="text" name="username"> <br>
							סיסמא:<input type="password" name="password"> <br> <a
							href="StudentForgetPassword">שכחת סיסמא?</a><br>
							<a href="Reg">משתמש חדש</a> <br>
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