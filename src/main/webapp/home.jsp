<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@  include file="all_component/allcss.jsp"%>
</head>
<body>


<div class="container-fluid">
<%@ include file="all_component/Navbar.jsp"%>
<div class="card py-5">
<div class="card-body text-center">
<img alt="" src="img/paper-pencil_icon-icons.com_52928.png" class="img-fluid mx-auto" style="max-width: 355px;height:355px">
<br>
<hr>

<h1>Start Taking Your Notes</h1>
<a href="addnotes.jsp"class="btn btn-outline-primary">Start Here</a>
</div>
</div>
</div>


<%@ include file="all_component/footer.jsp"%>

</body>
</html>