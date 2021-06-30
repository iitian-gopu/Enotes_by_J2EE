package com.gopal.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.bean.UserDetails;
import com.gopal.dao.UserDao;
import com.gopal.db.DbConnect;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("uemail");
		String password=req.getParameter("upass");
		UserDetails ud=new UserDetails();
		
		ud.setEmail(email);
		ud.setPassword(password);
		UserDao dao=new UserDao(DbConnect.getCon());
	boolean f=dao.loginUser(ud);
	
	if(f) {
		resp.sendRedirect("home.jsp");
	}
	else {
		HttpSession ss=req.getSession();
		ss.setAttribute("login_failed", "Invalid Username and Password");
		resp.sendRedirect("login.jsp");
	}
	}

}
