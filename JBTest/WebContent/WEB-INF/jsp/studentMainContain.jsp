<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jbtestPro_v1.server.DBConnectionClass"%>
<%@page import="java.util.*" %>

<%HttpSession studentSession=request.getSession(true); %>
<%String currStud=(String)session.getAttribute("currStudent"); %>
<%String[] hebName=DBConnectionClass.getStudentHeb(Integer.parseInt(currStud));%>

	
<%Vector <String[]> historyTest=new Vector<String[]>();
historyTest=	DBConnectionClass.getHistoryTestById(Integer.parseInt(currStud)); %>
	
<%Vector <String[]> nextTest=new Vector<String[]>();
nextTest=	DBConnectionClass.getNextTestById(Integer.parseInt(currStud)); %>

		<br><br><br>

<h1 align="center" >מבחנים</h1>
		<table id="table" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
		<tr bgcolor="#909090">
				<td>מספר קורס</td>
				<td>שם קורס</td>
				<td>תאריך</td>
				<td>שעה</td>
		</tr>
		
		<%for(int i=0;i<nextTest.size();i++){	%>
		<tr>
		<%String[] temp=nextTest.get(i); %>
					
			<td><%=temp[0] %>  </td>
			<td><%=temp[1] %>  </td>
			<td><%=temp[2] %>  </td>
			<td><%=temp[3].substring(0, 5) %>  </td>
		
		
		</tr>
		<%} %>
		
		
		
		
		
		</table>
		<h1 align="center">הסטוריה</h1>
		<table id="table" dir="rtl" width="50%" align="center" cellpadding="5" cellspacing="5">
		<tr bgcolor="#909090">
				<td>מספר קורס</td>
				<td>שם קורס</td>
				<td>תאריך</td>
				<td>ציון</td>
		</tr>
		
		<%for(int i=0;i<historyTest.size();i++){	%>
		<tr>
		<%String[] temp=historyTest.get(i); %>
					
			<td><%=temp[0] %>  </td>
			<td><%=temp[1] %>  </td>
			<td><%=temp[2] %>  </td>
			<td><%if(temp[3].equals("yes")){ %> 
				עובר
				<%}else if(temp[3].equals("no")){ %>
				נכשל
			<%}else{ %>
				אין ציון
			<%} %>
			</td>
		
		
		</tr>
		<%} %>

		</table>


	