<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%
if (session.getAttribute("currentUser") == null)
	response.sendRedirect("login.jsp");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/j1.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="all_component/admin_navbar.jsp"%>

	<%
	if (session.getAttribute("msg") != null) {
	%>
	<div class="text-center alert alert-success" role="alert">
		<%=session.getAttribute("msg")%>
	</div>

	<%
	session.removeAttribute("msg");
	}
	%>
	<%-- <%
	Connection connection = DBconnect.getCon();
	out.print(connection);
	%> --%>
	<div class="text-center back-img bg-primary">
		<h1 class="p-4">Welcome Admin</h1>
	</div>
</body>
</html>