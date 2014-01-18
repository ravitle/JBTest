<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="regTest" >
			<br> 
			
			<h1 align="center">הרשמה למבחן</h1>
			 

			<%@ include file="calender.jsp" %>
			<br>
			<div  align="center">
			
			
			<form id="test_reg_form" dir="rtl">
				תאריך: <input type="text" id="date"> 
				שעה: <input type="text" id="hour"> 
				second shot:<input type="text" id="secondShot">
				מבחן:<select required="Test" id="tests">
					<option value="empty">בחר</option>
				</select>
				
				<input id="regButton" type="submit" value="הרשם" class="regButton"> 
				
				<br> 
				<br> 
			</form></div>
</div>			


<script type="text/javascript">

	$.ajax({
		async:false,
		type:"POST",
		url:"getTestList",
		success:function(ret){
			var _ret=ret.trim();
			var res=_ret.split(",");
			var options='<option value="n">בחר</option>' ;
			for(var i=0;i<res.length-1;i+=2)
				options+='<option value="' + res[i+1]+'">'+res[i+1]+'</option>';
			$("#tests").html(options);	
		}
});

	$('#regButton').click(function(){
		
		var selectForm = $(this).parent().parent();
		var date = selectForm.find('#date').val();
		var hour = selectForm.find('#hour').val();
		var secondShot = selectForm.find('#secondShot').val();
		var test = selectForm.find('#tests').val(); 
		
		var dataString = 'date='+date+'&hour='+hour+'&secondShot='+secondShot+'&test='+test;
		$.ajax({
			async:false,
			type:"POST",
			url:"insertManager",
			data:dataString,
			success:function(ret){
				var _ret=ret.trim();
				if (_ret==1)
					alert("הרשמה למבחן בוצעה בהצלחה!");
			}
		
		
		
		
		});
	});
	
</script>