<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="sys_main.css">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>System</title>
		<script type="text/javascript" language="javascript" src="motimonso/motimonso.nocache.js"></script>
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script type="text/javascript" language="javascript" src="script_students.js"></script>
	</head>
	<body>
	<%HttpSession studentSession=request.getSession(true); %>
	<%String currStud=(String)session.getAttribute("currStudent"); %>
	<%Vector <String[]> nextTest=new Vector<String[]>();
	nextTest=	DBConnectionClass.getNextTestById(Integer.parseInt(currStud)); %>
		<%@ include file="header.jsp"%>
		<div id="page-container">
			<%@ include file="studentSearch.jsp" %>
			<%@ include file="studentNavigation.jsp"%>
			
			<h1 align="center">מבחנים</h1>
			<table id="cancelTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
				<tr  bgcolor="#909090">
					<td>מספר קורס</td>
					<td>שם קורס</td>
					<td>תאריך</td>
					<td>שעה</td>
					<td></td>	
				</tr>
				
				<%for(int i=0;i<nextTest.size();i++){	%>
		<tr>
		<%String[] temp=nextTest.get(i); %>
					
			<td><%=temp[0] %>  </td>
			<td><%=temp[1] %>  </td>
			<td><%=temp[2] %>  </td>
			<td><%=temp[3].substring(0, 5) %>  </td>
		<td><input type="submit" value="בטל" id="cancel<%=i%>" class="cancelButton"></td>
		
		</tr>
		<%} %>

			</table>
			
			
			
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>