
<%
if (session.getAttribute("currentUser") == null)
	response.sendRedirect("login.jsp");
%>

<%@page import="java.util.ArrayList"%>
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
<title>View Job By Category or Location</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/admin_navbar.jsp"%>

<%
				JobDao j = new JobDao(DBconnect.getCon());
				List<Jobs> list = j.getAppliedAllJobs();
				%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary mt-3">My jobs</h5>

				<%
				for (Jobs jobs : list) {
				%>
				<div class="card mt-3">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-3x mb-2"></i>
						</div>
						
						<%-- <h5><%=jobs.getUserId()%></h5>
						<h5><%=jobs.getUserQual()%></h5> --%>
						<div class="d-flex justify-content-between">
										<h6><%=jobs.getTitle()%></h6>
										<h6 class="mr-5">Applied by : <%=jobs.getUserEmail()%></h6>
						</div>
							<pre><%=jobs.getDescription()%></pre>
						<br>
						<div class="form-row mt-4">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location : <%=jobs.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category : <%=jobs.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
							Publish on :
							<%=jobs.getPdate()%></h6>
						<%-- <div class="text-center">
							<a href="one_view.jsp?id=<%=jobs.getId()%>"
								class="btn btn-sm bg-success text-white">Read More</a>
						</div> --%>
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