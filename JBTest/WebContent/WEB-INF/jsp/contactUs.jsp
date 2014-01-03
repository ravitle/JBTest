<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="MainEntrance.css">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<script type="text/javascript" language="javascript"
	src="jbtest_main/jbtest_main.nocache.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" language="javascript"
	src="script_main.js"></script>
<title>contactUs</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="pageContainer">


		<div id="mainTool" dir="rtl">
			<h2>
				<a href="Sys_MainEntrance" style="color: white">כניסת סגל</a> <a
					href="Main" style="color: white">כניסת סטודנט</a>
					 <a href="links"style="color: white">קישורים</a>
					 <a href="aboutUs" style="color: white">אודות</a>
			</h2>
		</div>
		<br>
		<div id="pageContainerTable">

			<h1 align="center" dir="rtl">צור קשר</h1>

			<br>
			<br>

			<div id="#detail" dir="rtl">

				<table align="center">
					<tr>
						<form action="contactUsThanks">
							<td>שם פרטי:<br>
							<input type="text" name="firstName"> <br> שם משפחה:<br>
							<input type="text" name="lastName"> <br> טלפון:<br>
							<input type="text" name="TelNumber"> <br> פלאפון:<br>
							<input type="text" name="PhoneNumber"> <br> תוכן
								הפנייה:<br>
							<textarea rows="5" name="about" form="usrform"></textarea> <br>
								<input align="middle" type="submit" value="שלח/י"
								id="enterbutton"> <br>

							</td>
						</form>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>