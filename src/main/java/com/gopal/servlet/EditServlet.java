package com.gopal.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gopal.dao.PostDao;
import com.gopal.db.DbConnect;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			Integer noteid=Integer.parseInt(req.getParameter("noteid"));
			String title=req.getParameter("title");
			String content=req.getParameter("content");
			PostDao pdao=new PostDao(DbConnect.getCon());
			boolean f=pdao.editNotes(title, content,noteid );
			if(f) {
				System.out.println("update succes");
				HttpSession ss=req.getSession();
				ss.setAttribute("update", "Notes Updated Sucessfully..");
				resp.sendRedirect("shownotes.jsp");
			}
			else {
				System.out.println("update failure");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
