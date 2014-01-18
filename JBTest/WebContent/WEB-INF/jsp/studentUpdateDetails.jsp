<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 
 <%HttpSession studentSession=request.getSession(true); %>
<%String currStud=(String)session.getAttribute("currStudent"); %>
<%
 
	int id = Integer.parseInt(currStud);


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
		
		
		<div id="page-container">
		<%@ include file="header.jsp"%>
				<div id="mainContain">
		
		<%@ include file="studentSearch.jsp" %>
		<%@ include file="studentNavigation.jsp"%>
		
			<br><br><br><br>
						
			<form method ="post" id="updateform" name="studentinfoform" dir="rtl">
				ת.ז:<input readonly type="text" id="id" value=<%=students[0]%>>
				sr:<input  readonly type="text" id="sr" value=<%=students[1]%>>
				שם משפחה:<input type="text" id="lnh" value=<%=students[2]%>>
				
				שם פרטי:<input type="text" id="pnh" value=<%=students[3]%>>
				<br><br>
				שם משפחה(אנגלית):<input type="text" id="lne" value=<%=students[4]%>>
				שם פרטי(אנגלית):<input type="text" id="pne" value=<%=students[5]%>>
				אימייל:<input type="text" id="email" value=<%=students[8]%>>
				<br><br>
				כתובת:<input type="text" id="address" value=<%=students[6]%>>
				עיר:<input type="text" id="city" value=<%=students[7]%>>
				טלפון:<input type="text" id="phone1" value=<%=students[9]%>>
				פלאפון:<input type="text" id="phone2" value=<%=students[10]%>>
				<br><br>
				קורס:<input type="text" id="course" value=<%=students[12]%>>	
				מכללה:<input type="text" id="collage" value=<%=students[11]%>>
				<center><input type="submit" value="עדכן" id="updateStudent" class="updateStudentButton"></center>
				<br><br>
			</form>
			
			
			<script type="text/javascript">
				$('.updateStudentButton').click(function() {

					var selectform =  $(this).parent().parent();
					var id = selectform.find('#id').val();
					var sr = selectform.find('#sr').val();
					var lnameh = selectform.find('#lnh').val();
					var pnameh = selectform.find('#pnh').val();
					var lnamee = selectform.find('#lne').val();
					var pnamee = selectform.find('#pne').val();
					var email = selectform.find('#email').val();
					var address = selectform.find('#address').val();
					var city = selectform.find('#city').val();
					var phone1 = selectform.find('#phone1').val();
					var phone2 = selectform.find('#phone2').val();
					var course = selectform.find('#course').val();
					var collage = selectform.find('#collage').val();
										
					var dataString = 'sid=' + id + '&ssr=' + sr + '&slnh=' + lnameh + '&spnh=' + pnameh
					+ '&slne=' + lnamee + '&spne=' + pnamee + '&semail=' + email + '&saddr=' + address
					+ '&scity=' + city + '&sphone1=' + phone1 + '&sphone2=' + phone2
					+ '&scourse=' + course + '&scollage=' + collage;
					
					
					$.ajax({
						async : false,
						type : "POST",
						url : "studentUpdateInDB",
						data : dataString,
						success : function(ret) {
							// success

							var _ret = ret.trim();
							if (_ret == 1) {
								alert("עודכן!");
							}
						}
					});
				});
			</script>
			</div>
			<%@ include file="footer.jsp"%>
	</div>
		
	</body>
</html>