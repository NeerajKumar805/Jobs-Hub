
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
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: lightblue;">
	<%@include file="all_component/user_navbar.jsp"%>
					<%
							if (session.getAttribute("applyMsg") != null) {
							%>
							<div class="text-center alert alert-success" role="alert">
								<%=session.getAttribute("applyMsg")%>
							</div>

							<%
							session.removeAttribute("applyMsg");
							}
						%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary mt-3">All jobs</h5>
				<div class="card mt-3">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>
							<div class="form-group col-md-5 mt-1">
								<select class="custom-select" name="location">
									<option value="defaultLoc">Choose..</option>
									<option value="Odisha">Odisha</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Delhi">Delhi</option>
									<option value="Banglore">Banglore</option>
									<option value="Hydrabad">Hydrabad</option>
								</select>
							</div>
							<div class="form-group col-md-5 mt-1">
								<select class="custom-select" name="category">
									<option value="defaultCat">Choose..</option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<input class="btn btn-success" type="submit" value="submit">
						</form>
					</div>
				</div>


				<%
				JobDao j = new JobDao(DBconnect.getCon());
				List<Jobs> list = j.getJobsForUser();
				for (Jobs jobs : list) {
				%>
				<div class="card mt-3">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-3x mb-2"></i>
						</div>
						<h6><%=jobs.getTitle()%></h6>
						<%
							if(jobs.getDescription().length() >= 0 && jobs.getDescription().length() <=50){
						%>
							<pre><%=jobs.getDescription()%></pre>
						<%}else{ %>
							<pre><%=jobs.getDescription().substring(0,50)%>...</pre>
						<%} %>
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
						<div class="text-center">
							<a href="one_view.jsp?id=<%=jobs.getId()%>"
								class="btn btn-sm bg-success text-white">Read More</a>
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