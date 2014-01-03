<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table id="cancelTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
	<tr bgcolor="#909090">
	<td>ת.ז</td>
	<td>שם משפחה</td>
	<td>שם פרטי</td>
	<td>תאריך</td>
	<td>שעה</td>
	<td></td>
</tr>

<% String[][] cancelledArr = DBConnectionClass.searchCancelledTests(); %>
<% if (cancelledArr != null){ %>
<% int rowsCan = DBConnectionClass.rowsNum(cancelledArr); %>
<% for (int i=0; i<rowsCan; i++) { %>
	<tr>
	<% for (int j=0; j<5; j++) { %>
		<td>
			<%= cancelledArr[i][j] %>
 		</td>
   	<% } %>
   	<td><form><input type="submit" value="בטל" id="cancel"></form></td>
	</tr>
<% } %>
<% } %>
	
</table>