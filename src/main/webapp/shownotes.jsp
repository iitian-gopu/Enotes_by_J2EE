<%@page import="com.gopal.bean.Post"%>
<%@page import="java.util.List"%>
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
<title>Show Notes</title>
<style type="text/css">
.hro {
	border-top: 3px solid black;
}

.brder {
	border: 2px;
}
</style>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>
<div class="container-fluid">
	<%@include file="all_component/Navbar.jsp"%>
<%
String upmsg=(String)session.getAttribute("update");
if(upmsg!=null){%>
	
	<div class="alert alert-success" role="alert"><%=upmsg%></div>
	
	
<% session.removeAttribute("update");
}
%>
	<div class="container">
		<h2 class="text-center mt-3 text-danger">
			<i class="fa fa-files-o" aria-hidden="true"></i> All Notes
		</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (ud != null) {
					PostDao pdao = new PostDao(DbConnect.getCon());
					List<Post> lst = pdao.getData(ud.getId());
					for (Post po : lst) {
				%>
				<div class="card mt-5 border border-dark">
					<img alt="" src="img/paper-pencil_icon-icons.com_52928.png"
						class="card-img-top mt-3 mx-auto" style="max-width: 100px">

					<div class="card-body  p-3">

						<h2 class="card-title text-primary"><%=po.getTitle()%></h2>
						<hr class="hro">
						<p><%=po.getContent()%></p>
						<p>
							<b class="text-danger"> <i class="fa fa-user"
								aria-hidden="true"></i>  Published By:
							</b> <b class="text-primary"><%=ud.getName()%></b>
						</p>
						<p>
							<b class="text-danger"><i class="fa fa-clock-o"
								aria-hidden="true"></i> Published Date:</b> <b class="text-primary"><%=po.getPdate()%></b><br>
						</p>
						<div class="container text-center mt-2">

							<a href="DeleteServlet?note_id=" class="btn btn-danger"><i
								class="fa fa-trash-o" aria-hidden="true"></i> Delete</a> <a
								href="edit.jsp?note_id=<%=po.getId() %>" class="btn btn-primary"><i
								class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>

						</div>
					</div>
				</div>
				<%
				}

				}
				%>

			</div>
		</div>
	</div>
	</div>
	<div class="mt-3">
	<%@ include file="all_component/footer.jsp"%>
	</div>

</body>
</html>