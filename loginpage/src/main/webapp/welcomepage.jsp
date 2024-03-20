<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>welcome page</title>
<link rel="stylesheet" href="welcome.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body class="mainbody">
	<%
	HttpSession httpSession = request.getSession(false);

	if (httpSession != null && httpSession.getAttribute("username") != null) {

		String username = (String) httpSession.getAttribute("username");
	%>
	<div class="welcome-conatiner">
		<div class="welcome">
			<h1>
				welcome,<%=username%>
				!
			</h1>
			<p>Now you can see my profile, and connect with me by clicking Visit Profile
				 button below:</p>
			<p>
				<a href="https://ravikumarxworkz.github.io/"
					class="btn btn-outline-danger" role="button">Visit Profile</a>
			</p>
			<a href="logout.jsp" class="btn btn-outline-danger" role="button">logout</a>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("loginpage.jsp");
	}
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>

</html>