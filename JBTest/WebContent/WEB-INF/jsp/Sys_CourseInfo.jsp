<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@page import="java.util.*" %>
<%@ page import="jbtestPro_v1.server.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String code = "";
 if (request.getParameter("tcode") != null){ 
	 code = request.getParameter("tcode");
	} 
 String[] course = DBConnectionClass.getCourseByCode(code);

 
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
		
		
		<div id="page-container">
		<%@ include file="header.jsp"%>
				<div id="mainContain">
		
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
			
			<br><br><br><br>
			
			<div id="coursesInfo">				
			<table id="courseTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
					<tr bgcolor="#909090">
					<td>מס' סידורי</td>
					<td>ת.ז</td>
					<td>שם פרטי</td>
					<td>שם משפחה </td>
				</tr>
				<div dir="rtl" align="center">
				<form method ="post" id="form" name="studentinfoform" dir="rtl" >
				קוד קורס:<input readonly type="text" name="code" value=<%=course[0]%>>
				שם קורס:<input readonly type="text" name="name" value=<%=course[1]%>>
				<br><br>
				
				תאריך התחלה:<input readonly type="text" name="startDate" value=<%=course[2]%>>
				תאריך סיום:<input readonly type="text" name="endDate" value=<%=course[3]%>>
				</form>
				</div>
				<br><br>
				<% Vector<String[]> courseStuArr = DBConnectionClass.CourseCode(code);
				String[] tempS;%>
				<%if(courseStuArr != null){ 
					 for (int i = 0; i < courseStuArr.size(); i++) { %>
						<tr id="courseRow<%=i%>">
						<% tempS = courseStuArr.get(i);			
						   for (int j=0; j<4; j++) { %>
							<td>
									<%if(j==0){%>
										<%=i+1 %>
									<%}else{ %>
										<%= tempS[j-1] %>
					 				<%} %>
					 		</td>
					 		<% } %>	
				
						</tr>		
				<% } %>						 		
			<% } %>	
			
			</table>
	
			<script type="text/javascript">
		$('.upDateButton').click(function(){
			
			// get the saba of the button
			var selectedRow = $(this).parent().parent();
			var courseCode = selectedRow.find('#courseCode').val();
			window.location.href = '?tcode=' + courseCode;
		});
		</script>
			
			
			<br><br>
			<form action="" method ="post" id="form">
			<center><input type="submit" value="עדכן" id="upDateButton"></center>
			</form>
			</div>
			</div>
		<%@ include file="footer.jsp"%>
		</div>
	</body>
</html>