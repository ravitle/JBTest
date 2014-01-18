<%@ page import="jbtestPro_v1.server.DBConnectionClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String radio_checked =  request.getParameter("rsearch");
	String search = request.getParameter("searchReq");	
	String redirectURL = "Sys_Main";
	
	if(radio_checked.equals("id") && DBConnectionClass.searchStudent(search) == null )
	{
		response.sendRedirect(redirectURL);  
	}	
	else if( radio_checked.equals("course") && DBConnectionClass.searchByCourseCode(search) == null)
	{
		response.sendRedirect(redirectURL);  
	}
	
	else if(radio_checked.equals("date") && DBConnectionClass.validDate(search) == -1)
	{
		response.sendRedirect(redirectURL);  
	}
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
			
			<div id="load-student" dir="rtl">
			<br><br><br><br>
			<% int id = Integer.parseInt(search); %>
			<% if (radio_checked.equals("id") && DBConnectionClass.getStudentByID(id) != null){
				response.sendRedirect("Sys_StudentPage?tid="+id);		
			} %>
	
			
			<% if (radio_checked.equals("course") && DBConnectionClass.searchByCourseCode(search) != null){ %>
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
			
			<% if (radio_checked.equals("date") && DBConnectionClass.validDate(search) != -1){ %>
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
		</div>
		
	</body>
</html>