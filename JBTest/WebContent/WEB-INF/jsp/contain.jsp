<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" java.sql.*"%>


<div>
	<form id="main-form">
		<div id="headline-reg">
			<h2 id="headline">הרשמה לסטודנט חדש</h2>
		</div>
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
			<input type="text" name="firstname(eng)">:שם פרטי (English)
		</div>
		<div class="field">
			<input type="text" name="lastname(eng)">:שם משפחה (English)<br>
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
			<input type="text" name="address">(English):כתובת מגורים
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
		<div class="field" dir="rtl">
			בחר מכללה: <select required name="Collage" id="collage">
				<option value="empty">בחר</option>
				<option value="JBTJer">מכללת ג'ון ברייס ירושלים</option>
				<option value="JBTTlv">מכללת ג'ון ברייס תל אביב</option>
				<option value="HColl">המכללה החרדית</option>
				<option value="Extern">אקסטרני</option>
			</select>


			<script type="text/javascript">
	$('#collage').change(function(){
		
		var collageId = $(this).val();
		
		
		
		
		// sending request to server to remove from db
		//var _ret;
		var dataString = 'id='+ collageId;
		
		
		$.ajax({
			async: false,
			type: "POST",
			url: "showCoursesOfCollage",
			data: dataString,
			success: function(ret){
				// success
				var _ret = ret.trim();
				var res = _ret.split(",");
				var options = '<option value="n">בחר קורס</option>';			
				for(var i =0;i < res.length-1; i+=2)
					options += '<option value="' + res[i] + '">' + res[i+1]+ '</option>';
				$("#courses").html(options);
						
			}
		});
	});
</script>
		</div>
		<div class="field" dir="rtl">
			בחר קורס: <select required name="Course" id="courses">
				<option value="empty">בחר</option>
			</select>
		</div>
		<div class="field" dir="rtl">
			<br>
			<br> <input type="checkbox" name="siteRegulations"
				value="regulation">קראתי את ה<a href="">תקנון</a><br>
		</div>




		<div id="buttondiv">
			<a href="www.google.com">
				<div>
					<input type="submit" value="אשר" class="buttons"
						style="color: white">
				</div>
			</a> <a href="/Reg">
				<div>
					<input type="submit" value="בטל" class="buttons"
						style="color: white">
				</div>
			</a> <a href="/Reg">
				<div>
					<input type="submit" value="נקה" class="buttons"
						style="color: white">
				</div>
			</a>
		</div>
	</form>
</div>