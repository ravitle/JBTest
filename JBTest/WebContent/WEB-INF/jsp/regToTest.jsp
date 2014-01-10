<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="regTest" >
			
			<h1 align="center">הרשמה למבחן</h1>
			
			<%@ include file="calender.jsp" %>
			<br>
			<div align="center"><form id="test_reg_form" dir="rtl">
				תאריך: <input type="text" name="startDate"> 
				שעה: <input type="text" name="startDate"> 
				קורס:<select>
					<optgroup>
						<option value="001">001 רשתות</option>
						<option value="002">002 תכנות</option>
						<option value="003">003 שיווק באינטרנט</option>
						<option value="004">004 גרפיקה</option>
					</optgroup>
				</select><br>
				<br> <input type="submit" value="הרשם"> <input
					type="submit" value="ביטול">
			</form></div>
</div>			