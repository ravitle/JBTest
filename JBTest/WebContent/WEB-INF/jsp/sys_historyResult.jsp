<%@page import="java.util.Vector"%>
<%@ page import="jbtestPro_v1.server.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String startD = request.getParameter("startDate");	
	String endD = request.getParameter("endDate");	
	if(startD == null || endD == null)
	{
		String redirectURL = "Sys_HistoryResult";
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
		<%@ include file="header.jsp"%>
		
		<div id="page-container">
			<%@ include file="sys_search.jsp"%>
			<%@ include file="sys_navigation.jsp"%>
		
			</br></br></br></br>
				<div id="history-sys">
				<h2>דו"ח תקופתי</h2><br>
				<form action="Sys_HistoryResult" method ="get" id="form" name="historyform" dir="rtl">
					בחר תאריך התחלה: <input type="text" name="startDate">
					בחר תאריך סיום: <input type="text" name="endDate">
					<input type="submit" value="בחר" id="chooseButton"><br>
				</form>
				<br>
				<table id="historyTable" dir="rtl" width="80%" align="center" cellpadding="5" cellspacing="5">
					<tr bgcolor="#909090">
						<td>ת.ז</td>
						<td>שם משפחה</td>
						<td>שם פרטי</td>
						<td>תאריך</td>
						<td>שעה</td>
						<td>עלות</td>
					</tr>
				<% if(startD != null && endD != null) {%>
					
				<%String start = CalenderClass.dateFormatWebToServer(startD);%>	
				<%String end = CalenderClass.dateFormatWebToServer(endD); %>					
						
				<% Vector<String[]> history = DBConnectionClass.historyResult(start, end); %>
					<% if (history != null){ %>
				<% for (int i=0; i<history.size(); i++) { %>
					<tr>
					<%String[] tempArr = history.get(i);  %>
					<% for (int j=0; j<4; j++) { %>
						<td>
							<%= tempArr[j] %>
				 		</td>
				   	<% } %>
				   	<td>
				   	<%=tempArr[4].substring(0,5)%>
				   	</td>
				   	<td>
				   	<%=tempArr[5].substring(0,3)%>
				   	</td>
					</tr>
				<% } %>
				<% } %>
				<% } %>						
				
			 	</table>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>