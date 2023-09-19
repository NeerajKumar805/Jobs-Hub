<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/t1.jpg");
	width: 100%;
	height: 83vh;
	background-repeat: no repeat;
	background-size: cover;
	background-position: center;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<%
	if (session.getAttribute("logoutMsg") != null) {
	%>
	<div class="text-center alert alert-success" role="alert">
		<%=session.getAttribute("logoutMsg")%>
	</div>

	<%
	session.removeAttribute("logoutMsg");
	%>
	<%
	}
	%>
	<div class="text-center back-img image-fluid">
		<h1 class="text-pink p-4">
			<i class="fa fa-book" aria-hidden="true"></i> Online job portal
		</h1>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>