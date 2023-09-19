<%
if (session.getAttribute("currentUser") == null)
	response.sendRedirect("login.jsp");
%>

<%@page import="com.entities.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.JobDao"%>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:view jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/admin_navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary mt-3">All jobs</h5>
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
				<%
				JobDao j = new JobDao(DBconnect.getCon());
				List<Jobs> list = j.getAllJobs();
				for (Jobs jobs : list) {
				%>
				<div class="card mt-3">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-3x mb-2"></i>
						</div>
						<h6><%=jobs.getTitle()%></h6>
						<%
							if(jobs.getDescription().length() >= 0 && jobs.getDescription().length() <=120){
						%>
							<pre><%=jobs.getDescription()%></pre>
						<%}else{ %>
							<pre><%=jobs.getDescription().substring(0,120)%>...</pre>
						<%} %>
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
						<div class="text-center">
							<a href="edit_job.jsp?id=<%=jobs.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a>
							<a href="DeleteJobServlet?id=<%=jobs.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>