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
	<tr id="confirmRow<%=i%>">
	<% temp = newArr.get(i); 
		 for (int j=0; j<4; j++) { %>
		<td>
				<%= temp[j] %>			
 		</td>
   	<% } %>
   	<td>
   		<%=temp[4].substring(0, 5) %>
   	</td>
   	<td id="tableTD">
   		<input type="submit" value="אשר" id="confirm<%=i%>" class="confirmButton">
   		<input type="hidden" value="<%=newArr.get(i)[0]%>" id="userId">
   	</td>
	</tr>
<% } %>
<% } %>
	
</table>



<script type="text/javascript">
$('.confirmButton').click(function(){
	// get the saba of the button
	var selectedRow = $(this).parent().parent();
	var UserId = selectedRow.find('#userId').val();
	window.location.href = 'Sys_StudentPage?tid=' + UserId;
});
</script>