<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table id="newTable" dir="rtl" width="80%" align="center" cellpadding="5" cellspacing="5">
	<tr bgcolor="#909090">
	<td>ת.ז</td>
	<td>שם משפחה</td>
	<td>שם פרטי</td>
	<td>תאריך</td>
	<td>שעה</td>
	<td></td>
</tr>

<%@page import="java.util.*" %>
<% Vector<String[]> newArr = DBConnectionClass.getNewTestsRequest(); 
   String[] temp; %>
<% if (newArr != null){ 
   for (int i=0; i < newArr.size(); i++) { %>
	<tr>
	<% temp = newArr.get(i); 
		 for (int j=0; j<4; j++) { %>
		<td>
				<%= temp[j] %>			
 		</td>
   	<% } %>
   	<td>
   		<%=temp[4].substring(0, 5) %>
   	</td>
   	<td>
   		<input type="submit" value="אשר" id="confirm<%=i%>" class="confirmButton">
   	</td>
	</tr>
<% } %>
<% } %>
	
</table>