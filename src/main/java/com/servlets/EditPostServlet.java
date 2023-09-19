package com.servlets;

import java.io.IOException;

import com.dao.JobDao;
import com.db.DBconnect;
import com.entities.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String loc = request.getParameter("location");
		String cat = request.getParameter("category");
		String status = request.getParameter("status");
		String des = request.getParameter("des");

		Jobs jobs = new Jobs();

		jobs.setId(id);
		jobs.setTitle(title);
		jobs.setLocation(loc);
		jobs.setCategory(cat);
		jobs.setStatus(status);
		jobs.setDescription(des);

		JobDao jobDao = new JobDao(DBconnect.getCon());

		if (jobDao.editJob(jobs)) {
			session.setAttribute("msg", "Job Updated Successfully...");
			response.sendRedirect("view_jobs.jsp");
		} else {
			session.setAttribute("msg", "Oops! Something went wrong!!!");
			response.sendRedirect("view_jobs.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}
