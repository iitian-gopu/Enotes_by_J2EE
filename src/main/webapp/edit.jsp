<%@page import="com.gopal.bean.Post"%>
<%@page import="com.gopal.db.DbConnect"%>
<%@page import="com.gopal.dao.PostDao"%>
<%@page import="com.gopal.bean.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
UserDetails ud = (UserDetails) session.getAttribute("user");
if (ud == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.bton {
	border-radius: 12px;
}
</style>
</head>
<body>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDao pdao = new PostDao(DbConnect.getCon());
	Post p = pdao.getDatabyId(noteid);
	%>
	<div class="container-fluid">
		<%@include file="all_component/Navbar.jsp"%>

		<div class="container mt-5">

			<h1 class="text-center text-danger ">
				<i class="fa fa-sticky-note " aria-hidden="true"></i> Edit YOUR
				NOTES
			</h1>
			<div class="row">
				<div class="col-md-12">

					<form action="EditServlet" method="post">
						<input type="hidden" value="<%=noteid%>" name="noteid">

						<div class="form-group">

							<div class="text-danger ">
								<label for="exampleInputEmail1"><b>Notes Title</b></label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Title"
									name="title" required="required" value="<%=p.getTitle()%>">
							</div>
						</div>
						<div class="form-group">
							<div class="text-danger">
								<label for="exampleInputPassword1"><b>Notes Content</b></label>
								<textarea rows="11" cols="" class="form-control"
									placeholder="Enter Content" name="content" required="required"
									><%=p.getContent()%></textarea>
							</div>
						</div>
						<div class="container text-center py-1">
							<button type="submit" class="btn btn-info btn-lg bton">
								<i class="fa fa-sticky-note" aria-hidden="true"></i> Edit Notes
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5">
		<%@ include file="all_component/footer.jsp"%>
	</div>
</html>