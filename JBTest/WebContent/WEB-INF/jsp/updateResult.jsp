<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String update = request.getParameter("updateReq");	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="sys_main.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="/script_sys.js"></script>
	</head>
	<body>
		<%@ include file="header.jsp"%>
		
		<div id="page-container">
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
		
			</br></br></br></br>
			<form method ="post" id="form" name="studentupdateform" dir="rtl">
				ת.ז:<input type="text" name="id" value=<%=update%>>
				sr:<input type="text" name="sr" value="-">
				שם משפחה:<input type="text" name="lnh" value=<%=DBConnectionClass.searchStudent(update).getlNameHeb()%>>
				שם פרטי:<input type="text" name="pnh" value=<%=DBConnectionClass.searchStudent(update).getpNameHeb()%>>
				</br></br>
				שם משפחה(אנגלית):<input type="text" name="lne" value=<%=DBConnectionClass.searchStudent(update).getlNameEng()%>>
				שם פרטי(אנגלית):<input type="text" name="pne" value=<%=DBConnectionClass.searchStudent(update).getpNameEng()%>>
				אימייל:<input type="text" name="email" value=<%=DBConnectionClass.searchStudent(update).getEmail()%>>
				</br></br>
				כתובת:<input type="text" name="address" value=<%=DBConnectionClass.searchStudent(update).getAddress()%>>
				עיר:<input type="text" name="city" value=<%=DBConnectionClass.searchStudent(update).getCity()%>>
				טלפון:<input type="text" name="phone1" value="-">
				פלאפון:<input type="text" name="phone2" value=<%=DBConnectionClass.searchStudent(update).getCellNum()%>>
				</br></br>
				קורס:<input type="text" name="course" value=<%=DBConnectionClass.searchStudent(update).getsCourses().getCourseId()%>>	
				מכללה:<input type="text" name="collage" value=<%=DBConnectionClass.searchStudent(update).getCollage()%>>
				מבחנים חינם:<input type="text" name="freetest" value=<%=DBConnectionClass.searchStudent(update).getFreeTest()%>>	
				</br></br>
				<center><input type="submit" value="עדכן פרטים" id="update"></center>
			</form>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>