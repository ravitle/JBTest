<%@ page import="jbtestPro_v1.server.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="calender">
<table   dir="rtl" width="50%" align="center"  >
	<tr bgcolor="#909090">
	<td>א</td>
	<td>ב</td>
	<td>ג</td>
	<td>ד</td>
	<td>ה</td>
	<td>ו</td>
	<td>ש</td>
</tr>

<%int currYear=CalenderClass.getTodayYear(); %>
<%int currMonth=CalenderClass.getTodayMonth(); %>
<%int startDay=CalenderClass.getFirstDayOfMonth(currYear, currMonth); %>
<%int dayInMonth=CalenderClass.daysInMonth(currYear, currMonth); %>

<%int toPrint=1; %>
<% for (int i=0; i<6; i++) { %>
	<%if(toPrint>dayInMonth)break; %>
	<tr>
	<% for (int j=0; j<7; j++) { %>
		
		
		<td id="calenderCell">
		<%if(toPrint<=dayInMonth ) {%>
			<%if(i==0 && j>=startDay-1 || i!=0){ %>
			<%String temp=Integer.toString(toPrint); %>
			<%=temp %>
			<div>
			<%
			String tempDate=Integer.toString(currYear)+"-"+Integer.toString(currMonth)+"-"+temp;
			int testInDay=DBConnectionClass.getNumOfRegStudInDate(tempDate);
			
			for(int n=0;n<3;n++){
				if(j!=0 && j!=5 && j!=6){
				if(testInDay>0)
				{%>
					<a id="takenPlace" style="background-color:red;">תפוס</a><br>
					<%testInDay--;
				}else{%>
					<a id="freePlace" style="background-color:#7CFC00;">פנוי</a><br>
				<%}
				} 
			}
			
			%>
			</div>	
			<%toPrint++; %>
			<%} %>
		<%} %>
 		</td>
 		
   	<% } %>
	</tr>

<% } %>
	
</table>
</div>