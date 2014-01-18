<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" java.sql.*"%>


<div id="newStudent">
	<div id="headline-reg">
			<h2 id="headline">הרשמה לסטודנט חדש</h2>
	</div >
	<form id="main-form" method="post" name="studregi" dir="rtl">
			ת.ז:<input type="text" id="sid">
			שם פרטי:<input type="text" id="firstname">
			שם משפחה:<input type="text" id="lastname">
			שם פרטי (English):<input type="text" id="firstnamee"> <br>
			שם משפחה (English):<input type="text" id="lastnamee">
			סיסמא:<input type="text" id="password">
			אישור סיסמא:<input type="text" id="confirmpassword"><br>
			e-mail:<input type="text" id="e-mail">
			כתובת מגורים (English):<input type="text" id="address">
			עיר:<input type="text" id="city"><br>
			מספר טלפון:<input type="text" id="phone">
			טלפון משני:<input type="text" id="seconderyphone">
			בחר מכללה: <select required name="Collage" id="collage">
				<option value="empty" id="a">בחר</option>
				<option value="JBTJer" id="b">מכללת ג'ון ברייס ירושלים</option>
				<option value="JBTTlv" id="c">מכללת ג'ון ברייס תל אביב</option>
				<option value="HColl" id="d">המכללה החרדית</option>
				<option value="Extern" id="e">אקסטרני</option>
			</select>

			בחר קורס: <select required name="Course" id="courses">
				<option value="empty">בחר</option>
			</select>
			<br>
			<br> <input type="checkbox" name="siteRegulations" value="regulation" id="tak" >קראתי את ה<a href="">תקנון</a><br>
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
			var firstnameh=selectform.find('#firstname').val();
			var lastnameh=selectform.find('#lastname').val();
			var firstnamee=selectform.find('#firstnamee').val();
			var lastnamee=selectform.find('#lastnamee').val();
			var password=selectform.find('#password').val();
			var confirmpassword=selectform.find('#confirmpassword').val();
			var mail=selectform.find('#e-mail').val();
			var address=selectform.find('#address').val();
			var city =selectform.find('#city').val();
			var phone=selectform.find('#phone').val();
			var seconderyphone=selectform.find('#seconderyphone').val();
			var collageId=selectform.find('#collage').val();
			var course=selectform.find('#courses').val();
			var check=document.getElementById("tak").checked;
			var dataString='id='+id+'&firstname='+firstnameh+'&lastname='+lastnameh+'&firstnameeng='+firstnamee
							+'&lastnameeng='+lastnamee+'&password='+password+'&confirmpassword='+confirmpassword
							+'&email='+mail+'&address='+address+'&city='+city+'&phone1='+phone+'&phone2='+seconderyphone
							+'&collage='+collageId+'&course='+course+'&check='+check;
			

			$.ajax({
				async: false,
				type: "POST",
				url: "insertStudentToDB",
				data: dataString,
				success: function(ret){
					// success
					var _ret = ret.trim();
					if(_ret == 1)
					{
						alert("הרישום בוצע בהצלחה!!!");
						window.location.href='Main';	
					}
				}
			});
	});
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
					options += '<option value="' + res[i+1] + '">' + res[i+1]+ '</option>';
				$("#courses").html(options);
						
			}
		});
	});
</script>

</div>