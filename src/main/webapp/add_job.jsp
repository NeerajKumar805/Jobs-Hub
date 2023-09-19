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
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/admin_navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x mb-3"></i>
						<%
						if (session.getAttribute("msg") != null) {
						%>
						<div class="text-center alert alert-danger" role="alert">
							<%=session.getAttribute("msg")%>
						</div>

						<%
						session.removeAttribute("msg");
						}
						%>
						<h5>Add Jobs</h5>
					</div>
					<form action="addJobServlet" method="post">
						<div class="form-group">
							<label>Enter Title</label><input type="text" name="title"
								required class="form-control">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location" required
									class="custom-select" id="inlinerFormCustomSelectpref">
									<option selected>Choose..</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Hydrabad">Hydrabad</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Category</label><select class="custom-select" required
									id="inlineFormCustomSelectpref" name="category">
									<option selected>Choose..</option>
									<option value="IT">IT..</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" required name="status">
									<option class="Active" selected value="Active">Active</option>
									<option class="Inactive" value="Active">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="3" cols="" name="des" class="form-control"></textarea>
						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>