<%@page import="java.sql.Connection"%>
<%@page import="com.gopal.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("img/aaron-burden-xG8IQMqMITM-unsplash.jpg");
	height: 638px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@  include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/Navbar.jsp"%>
	
	<%
	Connection con=DbConnect.getCon();
	System.out.println(con);
	 %>
	
	<div class="container-fluid back-img pt-5">
	
		<div class="text-center ">
			<h1 class="text-white ">
				<i class="fa fa-book" aria-hidden="true"></i> E-Notes Save Your
				Notes
			</h1>
			<a href="login.jsp" class="btn btn-light btn-lg mr-2"><i
				class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a> <a
				href="register.jsp" class="btn btn-light btn-lg"><i
				class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>