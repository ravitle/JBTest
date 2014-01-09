<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%String fname=(String)session.getAttribute("fName"); %>
<%String lname=(String)session.getAttribute("lName"); %>
<div id="search-sys">
				
					<h3 style="color:white">
						ברוך הבא: <%=lname %> <%=fname %> 
					</h3> 
</div>