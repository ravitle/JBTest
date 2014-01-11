<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<table id="table" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
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
	<tr id="cancelRow<%=i%>">
	<% for (int j=0; j<5; j++) { %>
		<td>
			<%= cancelledArr[i][j] %>
 		</td>
   	<% } %>
   	<td id="tableTD">
   		
   		<input type="submit" value="בטל" id="cancel<%=i%>" class="cancelButton">
   		<input type="hidden" value="<%=cancelledArr[i][0] %>" id="userId" />
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
		
		
		
		// sending request to server to remove from db
		//var _ret;
		var dataString = 'id='+ UserId;
		
		
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

		
		
		//alert(selectedRow.attr("id"));
		//alert($(this).attr("id"));
		//alert("Ravit is the queen");
	});
</script>