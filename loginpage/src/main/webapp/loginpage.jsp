<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="login.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
											style="width: 185px;" alt="logo">
										<h4 class="mt-1 mb-5 pb-1">RK Developer</h4>
									</div>
									<form action="LoginPageServlet" method="post" >
										<p>Please login to your account</p>
										<div class="form-outline mb-4">
											<label for="username">user name</label> <br> <input
												type="text" id="username" class="form-control"
												name="username" required="required" placeholder="username">
										</div>
										<div class="form-outline mb-4">
											<label for="passwords">password</label> <br> <input
												type="text" id="passwords" class="form-control"
												name="passwords" required="required" placeholder="passoword">
										</div>
										<div class="text-center pt-1 mb-5 pb-1">
										<button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">submit</button>
										</div>
									</form>
									<%-- Display error message if login fails --%>
									<%
									String error = request.getParameter("error");
									if (error != null && error.equals("1")) {
									%>
									<p style="color: red;">Invalid username or password. Please
										try again.</p>
									<%
									}
									%>
									<%-- Display error message if Register Successful --%>
									<%
									String rs = request.getParameter("registration");
									if (rs != null && rs.equals("success")) {
									%>
									<p style="color: green;">Your Registration is Successful.
										Please Login.</p>
									<%
									}
									%>
									<div
										class="d-flex align-items-center justify-content-center pb-4">
										<p class="mb-0 me-2">Don't have an account?</p>
										<a href="registerpage.jsp" class="btn btn-outline-danger"
											role="button">Create new</a> 
										<p>
									</div>
									<a href="index.html"
										class="btn btn-outline-danger d-block mx-auto" role="button">home</a>
								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4">
									<h4 class="mb-4"> log in uses</h4>
									<p class="small mb-0"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>