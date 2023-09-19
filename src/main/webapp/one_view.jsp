
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
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/user_navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	JobDao jDao = new JobDao(DBconnect.getCon());
	Jobs jobs = jDao.getJobById(id);
	%>
	<div class="container">
		<div class="card mt-3">
			<div class="card-body">
				<div class="text-center text-primary">
					<i class="far fa-clipboard fa-3x mb-2"></i>
				</div>
				<h6><%=jobs.getTitle()%></h6>
				<pre><%=jobs.getDescription()%></pre>
				<br>
				<div class="form-row">
					<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
							value="Location: <%=jobs.getLocation()%>" readonly>
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
							value="Status: <%=jobs.getStatus()%>" readonly>
					</div>
				</div>
				<h6>
					Publish on :
					<%=jobs.getPdate()%></h6>
				<div class="d-flex justify-content-center">
					<a href="home.jsp" class="btn btn-sm bg-secondary text-white mr-3">Go	Back</a>
					<form action="appliedJobs">
					
							<input type="hidden" name="userId" value="<%=user.getId() %>">
							<input type="hidden" name="userEmail" value="<%=user.getEmail() %>">
							<input type="hidden" name="userQual" value="<%=user.getQualification()%>">
							
							<input type="hidden" name="title" value="<%=jobs.getTitle() %>">
							<input type="hidden" name="location" value="<%=jobs.getLocation() %>">
							<input type="hidden" name="category" value="<%=jobs.getCategory() %>">
							<input type="hidden" name="status" value="<%=jobs.getStatus() %>">
							<input type="hidden" name="des" value="<%=jobs.getDescription() %>">
							
							<!-- <input type="submit" value="Apply Now" onclick="apply()" id="appliedOrNot" class="btn btn-sm bg-primary text-white"> -->
							<input type="submit" value="Apply Now" class="btn btn-sm bg-primary text-white">
					</form>
					<!-- <a onclick="apply()"
						class="btn btn-sm bg-success text-white"><span id="appliedOrNot">Apply
						Now</span></a> -->
				</div>
			</div>
		</div>

	</div>
	<!-- <script>
		function apply() {
			Swal.fire({
				position : 'top-end',
				icon : 'success',
				title : 'Job applied successfully',
				showConfirmButton : false,
				timer : 1500
			})
			document.getElementById('appliedOrNot').innerHTML="Applied";
		}
	</script> -->
</body>
</html>