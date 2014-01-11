<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
 if (request.getParameter("id") == null) {  %>
	 0
 <%} else { 
 
	String id = request.getParameter("id").toString();
	
	if(id.equals("JBTJer"))	
		id = "ירושלים";
	else if(id.equals("JBTTlv"))	
		id = "תל אביב";
	else if(id.equals("HColl"))	
		id = "חרדית";
	else if(id.equals("Extern"))	
		id = "אקסטרני";
	
	Vector<String> courseArr = DBConnectionClass.getCourseByCollage(id); 
	String g = "";
	for (int i = 0; i<courseArr.size(); i++) {
	
			 g += i+1 + "," +courseArr.get(i) + ",";
				
	}	
	%>
	<%=g %>
	
<% } %>