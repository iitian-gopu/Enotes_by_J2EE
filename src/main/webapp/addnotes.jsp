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
<title>Add Notes</title>

<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.bton {
	border-radius: 12px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_component/Navbar.jsp"%>

		<div class="container mt-5">

			<h1 class="text-center">
				<i class="fa fa-sticky-note " aria-hidden="true"></i> ADD YOUR NOTES
			</h1>
			<div class="row">
				<div class="col-md-12">

					<form action="AddNotesServlet" method="post">
						<div class="form-group">
							<%
							UserDetails us = (UserDetails) session.getAttribute("user");
							if (us != null) {
							%>

							<input type="hidden" value="<%=us.getId()%>" name="uid">

							<%
							}
							%>
							<label for="exampleInputEmail1">Notes Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter Title"
								name="title" required="required">

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Notes Content</label>
							<textarea rows="11" cols="" class="form-control"
								placeholder="Enter Content" name="content" required="required"></textarea>
						</div>
						<div class="container text-center py-1">
							<button type="submit" class="btn btn-info btn-lg bton">
								<i class="fa fa-sticky-note" aria-hidden="true"></i> Add Notes
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
</body>
</html>