<%
if (session.getAttribute("currentUser") == null)
	response.sendRedirect("login.jsp");
%>


<%@page import="com.entities.Jobs"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.JobDao"%>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit post || JOB-HUB</title>
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
						int id = Integer.parseInt(request.getParameter("id"));
						JobDao jobDao = new JobDao(DBconnect.getCon());
						Jobs jobs = jobDao.getJobById(id);
						%>
						<h5>Edit Job details</h5>
					</div>
					<form action="EditPostServlet" method="post">
						<input type="hidden" value="<%=jobs.getId()%>" name="id">
						<div class="form-group">
							<label>Title</label><input type="text" name="title"
								value="<%=jobs.getTitle()%>" required class="form-control">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location" required
									class="custom-select" id="inlinerFormCustomSelectpref">
									<option selected value="<%=jobs.getLocation()%>"><%=jobs.getLocation()%>"
									</option>
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
									<option selected value="<%=jobs.getCategory()%>"><%=jobs.getCategory()%>"..
									</option>
									<option value="IT">IT</option>
									<option value="Devloper">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" required
									name="status">
									<option selected class="Active" value="<%=jobs.getStatus()%>"><%=jobs.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="3" cols="" name="des"
								class="form-control"><%=jobs.getDescription()%></textarea>
						</div>
						<div class="text-center">
							<input type="submit" value="Save Changes"
								class="btn btn-sm bg-primary text-white"> <a
								href="view_jobs.jsp" class="btn btn-sm bg-dark text-white">Back</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>