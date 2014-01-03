<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table id="todayTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
	<tr bgcolor="#909090">
		<td>ת.ז</td>
		<td>שם משפחה</td>
		<td>שם פרטי</td>
		<td>שעה</td>
	</tr>
	
	<% String[][] todayArr = DBConnectionClass.searchTodayTests(); %>
	<% if (todayArr != null) {%>
	<% int rowsToday = DBConnectionClass.rowsNum(todayArr); %>
	<% for (int i=0; i<rowsToday ; i++) { %>
		<tr>
		<% for (int j=0; j<4; j++) { %>
   			<td>
  			<%= todayArr[i][j] %>
 			</td>
   		<% } %>
   		</tr>
	<% } %>
	<% } %>
</table>