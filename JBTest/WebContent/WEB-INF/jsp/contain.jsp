<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" java.sql.*"%>


<div>
	<div id="headline-reg">
			<h2 id="headline">הרשמה לסטודנט חדש</h2>
	</div>
	<form id="main-form" method="post" name="studregi" dir="rtl">
			<input type="text" id="sid">:ת.ז
			<input type="text" id="firstname">:שם פרטי
			<input type="text" id="lastname">:שם משפחה<br>
			<input type="text" id="firstname(eng)">:שם פרטי (English)
			<input type="text" id="lastname(eng)">:שם משפחה (English)<br>
			<input type="text" id="password">:סיסמא
			<input type="text" id="confirmpassword">:אישור סיסמא<br>
			<input type="text" id="e-mail">:e-mail<br>
			<input type="text" id="address">(English):כתובת מגורים
			<input type="text" id="city">:עיר<br>
			<input type="text" id="phone">:מספר טלפון
			<input type="text" id="seconderyphone">:טלפון משני<br>
			בחר מכללה: <select required name="Collage" id="collage">
				<option value="empty">בחר</option>
				<option value="JBTJer">מכללת ג'ון ברייס ירושלים</option>
				<option value="JBTTlv">מכללת ג'ון ברייס תל אביב</option>
				<option value="HColl">המכללה החרדית</option>
				<option value="Extern">אקסטרני</option>
			</select>

			בחר קורס: <select required name="Course" id="courses">
				<option value="empty">בחר</option>
			</select>
			<br>
			<br> <input type="checkbox" name="siteRegulations"
				value="regulation">קראתי את ה<a href="">תקנון</a><br>
					<input type="submit" value="אשר" class="insertbutton" style="color: white" id=insert>
					<input type="submit" value="בטל" class="buttons"
						style="color: white">
					<input type="submit" value="נקה" class="buttons"
						style="color: white">
	</form>
	<script type="text/javascript">
	
			$('.insertbutton').click(function(){
				
			var selectform = $(this).parent().parent();
			var id= selectform.find('#sid').val();
			alert(id);
			
			}
					
			
			)
	
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
<<<<<<< HEAD
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
=======
>>>>>>> 2224f2711393c844b408360e4d636ff5d8e314e6
</div>