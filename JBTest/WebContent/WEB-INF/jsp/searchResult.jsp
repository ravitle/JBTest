<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String radio_checked =  request.getParameter("rsearch");
	String search = request.getParameter("searchReq");	
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
			
			<div id="load-student" dir="rtl">
			</br></br></br></br>
			<% if (radio_checked.equals("id")){ %>
			<form method ="post" id="form" name="studentinfoform" dir="rtl">
				ת.ז:<input readonly type="text" name="id" value=<%=search%>>
				sr:<input readonly type="text" name="sr" value="-">
				שם משפחה:<input readonly type="text" name="lnh" value=<%=DBConnectionClass.searchStudent(search).getlNameHeb()%>>
				שם פרטי:<input readonly type="text" name="pnh" value=<%=DBConnectionClass.searchStudent(search).getpNameHeb()%>>
				</br></br>
				שם משפחה(אנגלית):<input readonly type="text" name="lne" value=<%=DBConnectionClass.searchStudent(search).getlNameEng()%>>
				שם פרטי(אנגלית):<input readonly type="text" name="pne" value=<%=DBConnectionClass.searchStudent(search).getpNameEng()%>>
				אימייל:<input readonly type="text" name="email" value=<%=DBConnectionClass.searchStudent(search).getEmail()%>>
				</br></br>
				כתובת:<input readonly type="text" name="address" value=<%=DBConnectionClass.searchStudent(search).getAddress()%>>
				עיר:<input readonly type="text" name="city" value=<%=DBConnectionClass.searchStudent(search).getCity()%>>
				טלפון:<input readonly type="text" name="phone1" value="-">
				פלאפון:<input readonly type="text" name="phone2" value=<%=DBConnectionClass.searchStudent(search).getCellNum()%>>
				</br></br>
				קורס:<input readonly type="text" name="course" value=<%=DBConnectionClass.searchStudent(search).getsCourses().getCourseId()%>>	
				מכללה:<input readonly type="text" name="collage" value=<%=DBConnectionClass.searchStudent(search).getCollage()%>>
				מבחנים חינם:<input readonly type="text" name="freetest" value=<%=DBConnectionClass.searchStudent(search).getFreeTest()%>>	
			</form>
					
			</br>
			<% String[][] newArr = DBConnectionClass.searchStudentNewTest(search);%>
			<% int rowsNew = DBConnectionClass.rowsNum(newArr);%>	
			<% if (rowsNew != 0){ %>
			<center><h4> מבחן לאשר </h4></center>
			<table id="studentConfirmTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>second shot</td>
				<td></td>
			</tr>
						
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
			<% } %>
			
			<% String[][] todayArr = DBConnectionClass.searchStudentTodayTests(search);%>
			<% int rowsToday = DBConnectionClass.rowsNum(todayArr);%>	
			<% if (rowsToday != 0){ %>
			<center><h4> לסטודנט מבחן היום </h4></center>
			<table id="studentConfirmTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>ת.ז</td>
				<td>שם משפחה</td>
				<td>שם פרטי</td>
				<td>שעה</td>
			</tr>
						
			<% for (int i=0; i<rowsToday; i++) { %>
				<tr>
					<% for (int j=0; j<4; j++) { %>
						<td>
							<%= todayArr[i][j] %>	
 						</td>
 					<% } %>
				</tr>
			<% } %>
		
			</table>
			<% } %>
		
					
			<center><h4> מבחנים קודמים </h4></center>
			<table id="studentPastTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>עבר</td>
				<td>second shot</td>
			</tr>
			
			<% String[][] prevArr = DBConnectionClass.searchStudentPastTests(search);%>
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
			<% } %>
			
			<% if (radio_checked.equals("course")){ %>
			<table id="courseTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מס'</td>
				<td>ת.ז</td>
				<td>שם משפחה</td>
				<td>שם פרטי</td>
			</tr>
			
			
			<% for (int i=0; i<4; i++) { %>
				<tr>
					<% for (int j=0; j<4; j++) { %>
						<td>
							<% if(j==0){%>
								<%=i+1%>
							<% } %>
							<% if(j!=0){%>
								<%=DBConnectionClass.searchCourse(search)[i][j]%>	
 							<% } %>
 						</td>
 					<% } %>
				</tr>
			<% } %>
			
			</table>
			
			<% } %>
			
			<% if (radio_checked.equals("date")){ %>
			<table id="dateTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>ת.ז</td>
				<td>שם משפחה</td>
				<td>שם פרטי</td>
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>עבר</td>
			</tr>
			
			
			<% for (int i=0; i<2; i++) { %>
				<tr>
					<% for (int j=0; j<7; j++) { %>
						<td>
							<%=DBConnectionClass.searchByDate(search)[i][j]%>	
 						</td>
 					<% } %>
				</tr>
			<% } %>
			
			</table>
			<% } %>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>