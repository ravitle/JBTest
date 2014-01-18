<%@page import="jbtestPro_v1.server.CalenderClass"%>
<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table id="table" dir="rtl" width="80%" align="center" cellpadding="5" cellspacing="5">
	<tr bgcolor="#909090">
	<td>ת.ז</td>
	<td>שם משפחה</td>
	<td>שם פרטי</td>
	<td>תאריך</td>
	<td>שעה</td>
	<td></td>
</tr>

<%@page import="java.util.*" %>
<% Vector<String[]> cancelledArr = DBConnectionClass.getCancelTestsRequest(); 
   String[] tempC; %>

<% if (cancelledArr != null){ %>
<% for (int i=0; i < cancelledArr.size(); i++) { %>
	<tr id="cancelRow<%=i%>">
	<% tempC = cancelledArr.get(i); %>
	<% for (int j=0; j<4; j++) { %>
		<td>
			<%if (j==3){ %>
				<%=CalenderClass.dateFormatServerToWeb(tempC[j]) %>
			<%}else{%>
				<%= tempC[j] %>
			<%} %>
 		</td>
   	<% } %>
   	<td>
   		<%=tempC[4].substring(0, 5) %>
   	</td>
   	<td id="tableTD">
   		<input type="submit" value="בטל" id="cancel<%=i%>" class="cancelButton">
   		<input type="hidden" value="<%=cancelledArr.get(i)[0] %>" id="userId" />
   		<input type="hidden" value="<%=cancelledArr.get(i)[3] %>" id="date" />
   	</td>
	</tr>
<% } %>
<% } %>
	
</table>

<script type="text/javascript">
	$('.cancelButton').click(function(){
		
		// get the saba of the button
		var selectedRow = $(this).parent().parent();
		var UserId = selectedRow.find('#userId').val();
		var date = selectedRow.find('#date').val();
		
		// sending request to server to remove from db
		var dataString = 'id='+ UserId +'&date=' + date;
		
		
		$.ajax({
			async: false,
			type: "POST",
			url: "removeRecordFromCancelTable",
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