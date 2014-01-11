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

<%@page import="java.util.*" %>
<% Vector<String[]> newArr = DBConnectionClass.getNewTestsRequest(); 
   String[] temp; %>
<% if (newArr != null){ 
   for (int i=0; i < newArr.size(); i++) { %>
	<tr>
	<% temp = newArr.get(i); 
		 for (int j=0; j<5; j++) { %>
		<td>
			<% if (j == 0) {%>
			<a href="Sys_Confirm?tid=<%=temp[j]%>">
				<%= temp[j] %>
			</a>
			<% } %>
			<% if (j != 0) {%>
				<%= temp[j] %>
			<% } %>	
			
 		</td>
   	<% } %>
	</tr>
<% } %>
<% } %>
	
</table>