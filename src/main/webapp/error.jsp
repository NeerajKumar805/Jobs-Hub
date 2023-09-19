<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
					<div class="container text-center">
		<img src="img/error.png" class="img-fluid w-25">
		<h3 class="display-4">Sorry ! Something went wrong ...</h3>
		<%=exception%>
		<br>
		<a href="profile.jsp"
			class="btn bg-primary text-white mt-3">Home</a>
	</div>
</body>
</html>