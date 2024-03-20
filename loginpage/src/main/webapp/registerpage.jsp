<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
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
	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>
									<form class="mx-1 mx-md-4" action="RegisterPageServlet"
										method="post" onsubmit="return validateForm()">
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="username">User Name</label> <input
													type="text" id="username" name="username"
													class="form-control" required="required" /> <span
													id="usernameError" class="error-message"></span>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="email">Your Email</label> <input
													type="email" id="email" name="email" class="form-control"
													required="required" /> <span id="emailError"
													class="error-message"></span>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="password">Password</label> <input
													type="password" id="password" name="password"
													class="form-control" required="required" /> <span
													id="passwordError" class="error-message"></span>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-key fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="confirmPassword">Confirm
													Your Password</label> <input type="password" id="confirmPassword"
													name="confirmPassword" class="form-control"
													required="required" /> <span id="confirmPasswordError"
													class="error-message"></span>
											</div>
										</div>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button class="btn btn-primary btn-lg" type="submit">Register</button>
										</div>
									</form>

									<%-- Display error message if registration fails --%>
									<%
									String error = request.getParameter("error");
									if (error != null && error.equals("1")) {
									%>
									<p style="color: red;">Registration failed. Please try
										again.</p>
									<%
									}
									%>
									<a href="index.html" class="btn btn-outline-danger"
										role="button">home</a>
								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function validateForm() {
			var username = document.getElementById('username').value;
			var email = document.getElementById('email').value;
			var password = document.getElementById('password').value;
			var confirmPassword = document.getElementById('confirmPassword').value;

			// Reset error messages
			document.getElementById('usernameError').innerHTML = "";
			document.getElementById('emailError').innerHTML = "";
			document.getElementById('passwordError').innerHTML = "";
			document.getElementById('confirmPasswordError').innerHTML = "";

			var isValid = true;

			if (username.trim().length < 4) {
				document.getElementById('usernameError').innerHTML = "Username should be at least 4 characters long";
				isValid = false;
			}

			if (email.trim() === "" || !email.includes("@")) {
				document.getElementById('emailError').innerHTML = "Email should be valid";
				isValid = false;
			}

			if (password.trim() === "") {
				document.getElementById('passwordError').innerHTML = "Password is required";
				isValid = false;
			}

			if (confirmPassword.trim() === "") {
				document.getElementById('confirmPasswordError').innerHTML = "Please confirm your password";
				isValid = false;
			} else if (password !== confirmPassword) {
				document.getElementById('confirmPasswordError').innerHTML = "Passwords do not match";
				isValid = false;
			}
			alert('Registration successful!');
			return isValid;
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>