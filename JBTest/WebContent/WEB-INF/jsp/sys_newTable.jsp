<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table id="newTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
	<tr bgcolor="#909090">
	<td>ת.ז</td>
	<td>שם משפחה</td>
	<td>שם פרטי</td>
	<td>תאריך</td>
	<td>שעה</td>
</tr>

<% String[][] newArr = DBConnectionClass.searchNewTests(); %>
<% if (newArr != null){ %>
<% int rowsNew = DBConnectionClass.rowsNum(newArr); %>
<% for (int i=0; i<rowsNew; i++) { %>
	<tr>
	<% for (int j=0; j<5; j++) { %>
		<td>
			<% if (j == 0) {%>
			<a href="Sys_Confirm?tid=<%= newArr[i][j] %>">
				<%= newArr[i][j] %>
			</a>
			<% } %>
			<% if (j != 0) {%>
				<%= newArr[i][j] %>
			<% } %>	
 		</td>
   	<% } %>
	</tr>
<% } %>
<% } %>
	
</table>