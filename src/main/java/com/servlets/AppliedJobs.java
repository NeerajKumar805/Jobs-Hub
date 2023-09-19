package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.JobDao;
import com.db.DBconnect;
import com.entities.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AppliedJobs extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter outPrintWriter = response.getWriter();
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String userEmail = request.getParameter("userEmail");
		String userQual = request.getParameter("userQual");
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String loc = request.getParameter("location");
		String cat = request.getParameter("category");
		String status = request.getParameter("status");
		String des = request.getParameter("des");
		
		Jobs jobs = new Jobs();
		
		jobs.setTitle(title);
		jobs.setLocation(loc);
		jobs.setCategory(cat);
		jobs.setStatus(status);
		jobs.setDescription(des);
		jobs.setUserId(userId);
		jobs.setUserEmail(userEmail);
		jobs.setUserQual(userQual);
		
		JobDao jobDao = new JobDao(DBconnect.getCon());
		if(jobDao.addJobsbyUser(jobs)) {
			session.setAttribute("applyMsg", "Yay, Job Applied Successfully...");
		}else {
			session.setAttribute("applyMsg", "Oops! Already applied!!!");
		}
		response.sendRedirect("home.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
