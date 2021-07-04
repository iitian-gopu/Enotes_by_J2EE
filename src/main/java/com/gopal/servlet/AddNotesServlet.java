package com.gopal.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gopal.bean.Post;
import com.gopal.dao.PostDao;
import com.gopal.db.DbConnect;
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid=Integer.parseInt(req.getParameter("uid"));
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		PostDao pdao=new PostDao(DbConnect.getCon());
		boolean f=pdao.addNotes(title, content, uid);
		if(f) {
			System.out.println("data saved");
			resp.sendRedirect("shownotes.jsp");
		}
		else {
			System.out.println("not saved");
		}
	}

}
