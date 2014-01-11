<%@ page import="jbtestPro_v1.server.DBConnectionClass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div id="search-sys">
				<form action="Sys_Search" method ="get" id="form" name="searchform" dir="rtl">
					<h3 style="color:white">
						חיפוש: <input type="text" name="searchReq">
						<input type="radio" name="rsearch" value="id" checked>לפי ת.ז
						<input type="radio" name="rsearch" value="course">לפי קורס
						<input type="radio" name="rsearch" value="date">לפי תאריך
						<input type="submit" value="חפש" id="searchButton">
					</h3> 
				</form>
</div>
