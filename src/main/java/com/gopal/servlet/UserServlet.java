package com.gopal.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.bean.UserDetails;
import com.gopal.dao.UserDao;
import com.gopal.db.DbConnect;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	
	
@Override
public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String name=req.getParameter("uname");
	String email=req.getParameter("uemail");
	String password=req.getParameter("upass");
	UserDetails ud=new UserDetails();
	ud.setName(name);
	ud.setEmail(email);
	ud.setPassword(password);
	UserDao dao=new UserDao(DbConnect.getCon());
	boolean f=dao.addUser(ud);
	HttpSession ss;
	if(f) {
		ss=req.getSession();
		ss.setAttribute("reg_success", "Registration Successfully");
		resp.sendRedirect("register.jsp");
	}
	else {
		ss=req.getSession();
		ss.setAttribute("reg_fail", "Sorry Something Went Wrong on Server");
		resp.sendRedirect("register.jsp");
	}
	
}
}
