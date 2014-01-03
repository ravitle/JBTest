<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String id = request.getParameter("tid");	
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
			
			<div id="load-student" dir="rtl">
			
			<form method ="post" id="form" name="studentinfoform" dir="rtl">
				ת.ז:<input readonly type="text" name="id" value=<%=id%>>
				sr:<input readonly type="text" name="sr" value="-">
				שם משפחה:<input readonly type="text" name="lnh" value=<%=DBConnectionClass.searchStudent(id).getlNameHeb()%>>
				שם פרטי:<input readonly type="text" name="pnh" value=<%=DBConnectionClass.searchStudent(id).getpNameHeb()%>>
				</br></br>
				שם משפחה(אנגלית):<input readonly type="text" name="lne" value=<%=DBConnectionClass.searchStudent(id).getlNameEng()%>>
				שם פרטי(אנגלית):<input readonly type="text" name="pne" value=<%=DBConnectionClass.searchStudent(id).getpNameEng()%>>
				אימייל:<input readonly type="text" name="email" value=<%=DBConnectionClass.searchStudent(id).getEmail()%>>
				</br></br>
				כתובת:<input readonly type="text" name="address" value=<%=DBConnectionClass.searchStudent(id).getAddress()%>>
				עיר:<input readonly type="text" name="city" value=<%=DBConnectionClass.searchStudent(id).getCity()%>>
				טלפון:<input readonly type="text" name="phone1" value="-">
				פלאפון:<input readonly type="text" name="phone2" value=<%=DBConnectionClass.searchStudent(id).getCellNum()%>>
				</br></br>
				קורס:<input readonly type="text" name="course" value=<%=DBConnectionClass.searchStudent(id).getsCourses().getCourseId()%>>	
				מכללה:<input readonly type="text" name="collage" value=<%=DBConnectionClass.searchStudent(id).getCollage()%>>
				מבחנים חינם:<input readonly type="text" name="freetest" value=<%=DBConnectionClass.searchStudent(id).getFreeTest()%>>	
			</form>
			
			</br>
			<center><h4> מבחן לאשר </h4></center>
			<table id="studentConfirmTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>second shot</td>
				<td></td>
			</tr>
				
			<% String[][] newArr = DBConnectionClass.searchStudentNewTest(id);%>
			<% int rowsNew = DBConnectionClass.rowsNum(newArr);%>		
			<% for (int i=0; i<rowsNew; i++) { %>
				<tr>
					<% for (int j=0; j<4; j++) { %>
						<td>
							<%= newArr[i][j] %>	
 						</td>
 					<% } %>
 					<td><form><input type="submit" value="אשר" id="confirm"></form></td>
				</tr>
			<% } %>
		
			</table>
			
			<center><h4> מבחנים קודמים </h4></center>
			<table id="studentPastTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>עבר</td>
				<td>second shot</td>
			</tr>
			
			<% String[][] prevArr = DBConnectionClass.searchStudentPastTests(id);%>
			<% int rowsPrev = DBConnectionClass.rowsNum(prevArr);%>	
			<% for (int i=0; i<rowsPrev; i++) { %>
				<tr>
					<% for (int j=0; j<5; j++) { %>
						<td>
							<%= prevArr[i][j] %>	
 						</td>
 					<% } %>
				</tr>
			<% } %>
			
			</table>
			
			</br>
			<form method="post" id="form" name="updateform" dir="rtl">
				<center><input type="submit" value="עדכן פרטים" id="update"></center>
			</form>
			
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>