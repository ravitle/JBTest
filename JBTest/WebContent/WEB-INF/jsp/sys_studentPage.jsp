<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
 int id = 0;
 if (request.getParameter("tid") != null){ 
	id = Integer.parseInt(request.getParameter("tid").toString());
} 

 String[] students = DBConnectionClass.getStudentByID(id);
 
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
			
			<br><br><br><br>
			
			<div id="load-student" dir="rtl">
			
			<form method ="post" id="studentform" name="studentinfoform" dir="rtl">
				ת.ז:<input readonly type="text" id="id" value=<%=students[0]%>>
				sr:<input readonly type="text" name="sr" value=<%=students[1]%>>
				שם משפחה:<input readonly type="text" name="lnh" value=<%=students[2]%>>
				שם פרטי:<input readonly type="text" name="pnh" value=<%=students[3]%>>
				<br><br>
				שם משפחה(אנגלית):<input readonly type="text" name="lne" value=<%=students[4]%>>
				שם פרטי(אנגלית):<input readonly type="text" name="pne" value=<%=students[5]%>>
				אימייל:<input readonly type="text" name="email" value=<%=students[8]%>>
				<br><br>
				כתובת:<input readonly type="text" name="address" value=<%=students[6]%>>
				עיר:<input readonly type="text" name="city" value=<%=students[7]%>>
				טלפון:<input readonly type="text" name="phone1" value=<%=students[9]%>>
				פלאפון:<input readonly type="text" name="phone2" value=<%=students[10]%>>
				<br><br>
				קורס:<input readonly type="text" name="course" value=<%=students[12]%>>	
				מכללה:<input readonly type="text" name="collage" value=<%=students[11]%>>
				מבחנים חינם:<input readonly type="text" name="freetest" value=<%=students[13]%>>	
			</form>
			
			<br>
			<center><h4> מבחן לאשר </h4></center>
			<table id="studentConfirmTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>second shot</td>
				<td>אישור הבחינה</td>
				<td>מאגר בחינות חינם</td>
			</tr>
			
			
			<%@page import="java.util.*" %>
			<% Vector<String[]> newArr = DBConnectionClass.getNewTestByStudentId(id); 
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
   					<td id="tableTD">
   					<input type="submit" value="אשר" id="confirm" class="finalconfButton">
   					<input type="hidden" value="<%=newArr.get(i)[1]%>" id="date">
   					</td>
   					<td><input type="checkbox" value="free" id="usefreetests"></td>
				</tr>
				<% } %>	
			<% } %>		
			</table>


			<center><h4> מבחנים קרובים </h4></center>
			<table id="studentUpComingTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>second shot</td>
			</tr>
			
			<%@page import="java.util.*" %>
			<% Vector<String[]> upCArr = DBConnectionClass.getUpComingTestByStudentId(id); 
  			 String[] tempUpC; %>
			<% if (upCArr != null){ 
   				for (int i=0; i < upCArr.size(); i++) { %>
					<tr id="upComingRow<%=i%>">
					<% tempUpC = upCArr.get(i); 
		 			for (int j=0; j<4; j++) { %>
						<td id="tableUC">
							<%= tempUpC[j] %>			
 						</td>
   					<% } %>
				</tr>
				<% } %>	
			<% } %>			
			</table>

			

			<center><h4> מבחנים קודמים </h4></center>
			<table id="studentPastTable" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
			<tr bgcolor="#909090">
				<td>מבחן</td>
				<td>תאריך</td>
				<td>שעה</td>
				<td>עבר</td>
				<td>second shot</td>
			</tr>
			
			
			<%@page import="java.util.*" %>
			<% Vector<String[]> prevArr = DBConnectionClass.getHistoryTestStudentId(id); 
  			 String[] temprev; %>
			<% if (prevArr != null){ 
   				for (int i=0; i < prevArr.size(); i++) { %>
					<tr>
					<% temp = prevArr.get(i); 
		 			for (int j=0; j<5; j++) { %>
						<td>
							<%= temp[j] %>			
 						</td>
   					<% } %>
				</tr>
				<% } %>	
			<% } %>		
			</table>
				
			<br>
			<center><input type="submit" value="עדכן פרטים" id="updateStu" class="updateStuButton"></center>
		
			<script type="text/javascript">
				$('.updateStuButton').click(function() {
					var selectedidRow = $(this).parent().parent();
					var id = selectedidRow.find('#id').val();
					window.location.href = 'Sys_Update?tid=' + id;
				});
				$('.finalconfButton').click(function() {

						// get the saba of the button
						var selectedConfRow = $(this).parent().parent();
						var date = selectedConfRow.find('#date').val();
						var checkB = document.getElementById("usefreetests").checked;

						// sending request to server to remove from db
						var dataString = 'id=' + <%=Integer.toString(id)%> + '&date=' + date +'&pressed=' + checkB;	
				
					$.ajax({
						async : false,
						type : "POST",
						url : "confirmRecordNewTest",
						data : dataString,
						success : function(ret) {
							// success

							var _ret = ret.trim();
							if (_ret == 1) {
								// visual deleting - remove the element from the table
								selectedConfRow.hide();
								location.reload();
							}
						}
					});
				});
			</script>
					
		
		</div>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
</html>



