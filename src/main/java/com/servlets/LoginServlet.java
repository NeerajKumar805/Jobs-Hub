package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			
			String em = request.getParameter("email");
			String ps = request.getParameter("password");
			
			User u = new User();
			
			HttpSession session = request.getSession();
			if ("admin@gmail.com".equals(em) && "admin@121".equals(ps)) {
				session.setAttribute("currentUser", u);
				u.setRole("admin");
				response.sendRedirect("admin.jsp");
			} else {
				
				UserDao userDao = new UserDao(DBconnect.getCon());
				User user = userDao.login(em, ps);
				
				if(user!=null) {
					session.setAttribute("currentUser", user);
					response.sendRedirect("home.jsp");
				}else {
					session.setAttribute("msg", "Invalid credentails!!!");
					response.sendRedirect("login.jsp");
				}
				
//				out.print("Invalid credentails!!!");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
