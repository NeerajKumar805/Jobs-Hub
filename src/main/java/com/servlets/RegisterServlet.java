package com.servlets;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String qua = request.getParameter("qua");
		
		UserDao uDao = new UserDao(DBconnect.getCon());
		User user = new User(name,email,pwd,qua,"User");
		
		if(uDao.addUser(user)) {
			session.setAttribute("signupMsg", "Registered succesfully... Please login!");
			response.sendRedirect("login.jsp");
		}else {
			session.setAttribute("signupMsg", "Something went wrong");
			response.sendRedirect("signup.jsp");
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
