<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="continer-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x mb-2" aria-hidden="true"></i>
							<%
							if (session.getAttribute("msg") != null) {
							%>
							<div class="text-center alert alert-danger" role="alert">
								<%=session.getAttribute("msg")%>
							</div>

							<%
							session.removeAttribute("msg");
							}
							if (session.getAttribute("signupMsg") != null) {
							%>
							<div class="text-center alert alert-success" role="alert">
								<%=session.getAttribute("signupMsg")%>
							</div>

							<%
							session.removeAttribute("signupMsg");
							%>
							<%
							}
							%>
							<h5>Login here</h5>
						</div>
						<form action="loginServlet" method="post">
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									required="required" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter password</label> <input
									required="required" type="password" class="form-control"
									id="exampleInputpassword1" name="password">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>