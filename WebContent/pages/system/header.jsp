<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.SimpleDateFormat,java.math.*" %>
<%@ include file="/utility/dbcontext.jsp" %>
<%
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%= application.getContextPath() %>/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= application.getContextPath() %>/assets/css/overload.css">