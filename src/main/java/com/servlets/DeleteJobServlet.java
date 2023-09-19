package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.JobDao;
import com.db.DBconnect;
import com.entities.Jobs;

/**
 * Servlet implementation class DeleteJobServlet
 */
public class DeleteJobServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		int id = Integer.parseInt(request.getParameter("id"));

		Jobs jobs = new Jobs();

		jobs.setId(id);

		JobDao jobDao = new JobDao(DBconnect.getCon());

		if (jobDao.deleteJob(id)) {
			session.setAttribute("msg", "Job deleted successfully...");
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
