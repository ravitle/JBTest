<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div>
		<form id="main-form">
		<h3 id="headline">
			<strong>הרשמה לסטודנט חדש</strong>
		</h3>
		<div class="field">
			<input type="text" name="id">:ת.ז
		</div>
		<div class="field">
			<input type="text" name="firstname">:שם פרטי
		</div>
		<div class="field">
			<input type="text" name="lastname">:שם משפחה<br>
		</div>
		<div class="field">
			<input type="text" name="firstname(eng)">:שם פרטי (english)
		</div>
		<div class="field">
			<input type="text" name="lastname(eng)">:שם משפחה (english)<br>
		</div>
		<div class="field">
			<input type="text" name="username">:שם משתמש
		</div>
		<div class="field">
			<input type="text" name="password">:סיסמא
		</div>
		<div class="field">
			<input type="text" name="confirmpassword">:אישור סיסמא<br>
		</div>
		<div class="field">
			<input type="text" name="e-mail">:e-mail<br>
		</div>
		<div class="field">
			<input type="text" name="address">:כתובת מגורים
		</div>
		<div class="field">
			<input type="text" name="city">:עיר<br>
		</div>
		<div class="field">
			<input type="text" name="phone">:מספר טלפון
		</div>
		<div class="field">
			<input type="text" name="seconderyphone">:טלפון משני<br>
		</div>
		<div id="buttondiv">
			<a href="www.google.com">
				<div>
					<input type="submit" value="submit" class="buttons" style="color:white">
				</div>
			</a> <a href="/Reg">
				<div>
					<input type="submit" value="Cancel" class="buttons" style="color:white">
				</div>
			</a> <a href="/Reg">
				<div>
					<input type="submit" value="Clean" class="buttons" style="color:white">
				</div>
			</a>
		</div>
		<div>
			<a href="www.google.com">
				<div>
					<input type="submit" value="תקנון" class="buttons" style="color:white">
				</div>
		</div>
	</form>
</div>