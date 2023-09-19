<%@page import="com.entities.User"%>
<nav
	class="navbar sticky-top navbar-expand-lg navbar-dark bg-primary bg-custom">
	<a class="navbar-brand" href="home.jsp">JobHub</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link active"
				href="home.jsp"><i class="fa fa-home"></i> Home <span
					class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fas fa-eye"></i> View All Jobs</a></li>
			<li class="nav-item active"><a class="nav-link" href="oneUserJobs.jsp"><i
					class="fas fa-eye"></i> My Jobs</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<%
			User user = (User) session.getAttribute("currentUser");
			%>
			<a href="#" class="btn btn-light mr-1" data-toggle="modal"
				data-target="#user-profile"><i class="fas fa-sign-in-alt"></i> <%=user.getName()%></a>
			<a href="logoutServlet" class="btn btn-light"><i
				class="fas fa-user"></i> Logout</a>
		</form>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="user-profile" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa fa-user-circle fa-5x"></i>
						</div>
						<table class="table table-striped mt-3">
							<tr>
								<th>Name : </th>
								<th><%=user.getName() %></th>
							</tr>
							<tr>
								<th>Email : </th>
								<th><%=user.getEmail() %></th>
							</tr>
							<tr>
								<th>Qualification : </th>
								<th><%=user.getQualification() %></th>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Edit</button> -->
			</div>
		</div>
	</div>
</div>