<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@  include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>
					

					<%
					String fail_msg = (String) session.getAttribute("login_failed");
					if (fail_msg != null) {
					%>


					<div class="alert alert-danger" role="alert"><%=fail_msg%></div>



					<%
					session.removeAttribute("login_failed");
					}
					%>



					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label>Enter Email*</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Email" name="uemail">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="upass">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">
								<i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>