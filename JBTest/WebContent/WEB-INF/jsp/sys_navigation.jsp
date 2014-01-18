<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="navigation-bar">
				<a href="Sys_Main" >דף הבית </a>
				<form action="Sys_Update" method ="get" id="form" name="updateform" dir="rtl">
					<h3>
						עדכון פרטי סטודנט: <input type="text" name="tid">
						<input type="submit" value="עדכן" id="updateButton" style="color:white">
					</h3>
				</form>
				<h3>
					<a href="Sys_Schedule" >צפייה בלו"ז </a><br>
					<a href="Sys_History" >דו"ח תקופתי </a><br>
					<a href="Sys_Courses">קורסים </a><br>
					<a href="Main" >התנתק </a><br>
				</h3>
</div>