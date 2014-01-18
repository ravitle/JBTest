<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="regTest" >
			<br> 
			
			<h1 align="center">הרשמה למבחן</h1>
			 

			<%@ include file="calender.jsp" %>
			<br>
			<div  align="center"><form id="test_reg_form" dir="rtl">
				תאריך: <input type="text" name="startDate"> 
				שעה: <input type="text" name="startDate"> 
				מבחן:<select>
					<optgroup>
						<option value="001">001 רשתות</option>
						<option value="002">002 תכנות</option>
						<option value="003">003 שיווק באינטרנט</option>
						<option value="004">004 גרפיקה</option>
						
					</optgroup>
				</select>
				<input id="regButton" type="submit" value="הרשם"> 
				<br> 
				<br> 
			</form></div>
</div>			