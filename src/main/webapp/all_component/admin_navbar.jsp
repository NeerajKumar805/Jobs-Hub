<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-primary bg-custom">
	<a class="navbar-brand" href="admin.jsp">JobHub</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link active"
				href="admin.jsp"><i class="fa fa-home"></i> Home <span
					class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link"
				href="add_job.jsp"><i class="fa fa-plus-circle"></i> Post job</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="view_jobs.jsp"><i class="fas fa-eye"></i> View job</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allAppliedJobs.jsp"><i class="fas fa-eye"></i> Applied Jobs</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="#" class="btn btn-light mr-1"><i
				class="fas fa-sign-in-alt"></i> Admin</a> <a href="logoutServlet"
				class="btn btn-light"><i class="fas fa-user"></i> Logout</a>
		</form>
	</div>
</nav>