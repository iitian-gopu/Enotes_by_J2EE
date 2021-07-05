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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
Integer noteid=Integer.parseInt(req.getParameter("note_id"));
PostDao pdao=new PostDao(DbConnect.getCon());
boolean f=pdao.deleteNotes(noteid);
HttpSession ss=null;
if(f) {
	 ss=req.getSession();
	ss.setAttribute("deletemsg", "Your Notes Deleted Successfully");
	resp.sendRedirect("shownotes.jsp");
}
else {
	 ss=req.getSession();
		ss.setAttribute("wrongmsg", "Sorry something went wrong on server");
		resp.sendRedirect("shownotes.jsp");
}
}

}
