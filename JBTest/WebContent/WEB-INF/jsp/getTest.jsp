<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	Vector<String> courseArr = DBConnectionClass.getTestList(); 
	String g = "";
	for (int i = 0; i<courseArr.size(); i++) {
			 g += i+1 + "," +courseArr.get(i) + ",";
	}
%>	
<%=g %>