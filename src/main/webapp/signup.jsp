<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<%
							if (session.getAttribute("signupMsg") != null) {
							%>
							<div class="text-center alert alert-danger" role="alert">
								<%=session.getAttribute("signupMsg")%>
							</div>

							<%
							session.removeAttribute("signupMsg");
							}
							%>
							<h5>Registration</h5>
						</div>
						<h4 class="text-center text-success"></h4>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label>Enter full name</label><input type="text"
									required="required" class="form-control" name="name">
							</div>
							<div class="form-group">
								<label>Enter Email</label><input type="email"
									required="required" class="form-control" name="email">
							</div>
							<div class="form-group">
								<label>Enter password</label><input required="required"
									type="password" class="form-control" name="pwd">
							</div>
							<div class="form-group">
								<label>Qualification</label><input type="text"
									required="required" class="form-control" name="qua">
							</div>
							
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>