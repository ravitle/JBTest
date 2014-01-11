<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<table id="todayTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
	<tr bgcolor="#909090">
		<td>ת.ז</td>
		<td>שם משפחה</td>
		<td>שם פרטי</td>
		<td>שעה</td>
		<td></td>
		<td></td>
	</tr>
	
	<% Vector<String[]> todayArr = DBConnectionClass.getTodayTests(); 
		String[] tempT;%>
	<% if (todayArr != null) {
			for(int i = 0; i< todayArr.size();i++){ %>
				<tr id="todayTestRow<%=i%>">	
				<% tempT = todayArr.get(i);			
				   for (int j=0; j<3; j++) { %>
					<td>
  						<%= tempT[j] %>
 					</td>
 					
				<% } %>
				<td>
 					<%=tempT[3].substring(0, 5) %>
 				</td>
   				<td id="tableTDpass">
   					<input type="submit" value="עבר" id="pass<%=i%>" class="passButton">
   					<input type="hidden" value="<%=todayArr.get(i)[0] %>" id="userIdpass">
   				</td>
   				<td id="tableTDfail">
   					<input type="submit" value="נכשל" id="fail<%=i%>" class="failButton">
   					<input type="hidden" value="<%=todayArr.get(i)[0] %>" id="userIdfail">
   				</td>
   			</tr>
			<% } %>
	<% } %>
</table>



<script type="text/javascript">
	$('.passButton').click(function(){
		
		// get the saba of the button
		var selectedRow = $(this).parent().parent();
		var UserId = selectedRow.find('#userIdpass').val();
		
		// sending request to server to remove from db
		var dataString = 'id='+ UserId +'&pass=' + "yes";
		
		
		$.ajax({
			async: false,
			type: "POST",
			url: "updateRecordTestResult",
			data: dataString,
			success: function(ret){
				// success
				
				var _ret = ret.trim();
				if (_ret==1) {
					// visual deleting - remove the element from the table
					selectedRow.hide();
				}
			}
		});
	});
	
	$('.failButton').click(function(){
		
		// get the saba of the button
		var selectedRow = $(this).parent().parent();
		var UserId = selectedRow.find('#userIdfail').val();
		
		// sending request to server to remove from db
		var dataString = 'id='+ UserId + '&pass=' + "no";
		
		
		$.ajax({
			async: false,
			type: "POST",
			url: "updateRecordTestResult",
			data: dataString,
			success: function(ret){
				// success
				
				var _ret = ret.trim();
				if (_ret==1) {
					// visual deleting - remove the element from the table
					selectedRow.hide();
				}
			}
		});
	});
</script>