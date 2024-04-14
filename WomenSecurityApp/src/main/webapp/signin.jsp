<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sign In</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<style>
/*   common css code for all body page and navbar */
@import url('https://fonts.googleapis.com/css?family=Numans');
html, body {
	background: linear-gradient(90deg, #e6e6fa, #b0c4de);
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}
.navbar {
	background-color: blueviolet;
}

.nav-link {
	color: white;
	font-size: 20px;
	font-weight: bold;
}

.nav-link:hover {
	background-color: deeppink;
	border-style: double;
	border-radius: 25px;
}
/*   common css code for all body page and navbar */
.container {
	height: 80%;
	align-content: center;
}

#mainContainer {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.card {
	height: 370px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: transparent;
	/* background: linear-gradient(90deg, #e6e6fa, #b0c4de); */
}

.card-body {
	flex: 1;
}

.card-header h3 {
	color: black;
}

.input-group-prepend span {
	width: 50px;
	background-color: blueviolet;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

input {
	border-radius: 5px;
}

.login_btn {
	color: black;
	background-color: blueviolet;
	width: 100px;
}

.login_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}

.error-message {
	margin-top: 10px; 
	text-align: center;
	font-size: 14px; 
}

.card-footer {
	height: 200px; 
}

.form-group.text-center {
	margin-top: 20px; 
}

.btn.login_btn {
	margin: auto;
	display: block;
}
</style>
<body>
	<header>
		<nav class="navbar navbar-expand-lg">
			<a class="navbar-brand" href="#"> <img
				src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQvNZf_pBtDBBjQo5rLJdEWAbip3qXggktTl_04DtYf6FWeX-b0"
				alt="logo" width="70" height="40"
				class="d-inline-block align-text rounded-circle">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="homePage">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="signupPage">SignUp</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="d-flex justify-content-center align-items-center" class="alert alert-success" role="alert" ">
		<%
		String accountCreateMessage = (String) session.getAttribute("accountCreateMessage");
		if (accountCreateMessage != null) {
		%>
		<p style="color: green" class="success-message"><%=accountCreateMessage%></p>
		<%
		}
		session.removeAttribute("accountCreateMessage"); // Clear the attribute after displaying it
		%>
	</div>
	<div class="container">
		<div class="d-flex justify-content-center align-items-center">
			<!-- Added align-items-center -->
			<div class="card">
				<div class="card-header">
					<h3 style="text-align: center; font-weight: bold">Sign In</h3>
					<!-- Changed font-size to font-weight -->
				</div>
				<div class="card-body">
					<form action="login" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" id="emailId" name="email"
								placeholder="Email" onchange="onEmail()">
						</div>
						<div class="input-group form-group">
							<span id="errorEmail" style="color: red"></span>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control"
								placeholder="Password" name="password">
						</div>
						<div class="input-group form-group align-items-center remember">
							<input type="checkbox" id="showPasswordCheckbox"
								onchange="togglePasswordVisibility()"> <label
								for="showPasswordCheckbox">Show Password</label> <a
								style="color: blueviolet; margin-left: 10px;"
								href="forgotPassword">Forgot your password?</a>
						</div>

						<div class="form-group text-center">
							<input type="submit" value="Login" class="btn login_btn">
						</div>
					</form>
					<div class="d-flex justify-content-center"
						style="color: black; display: flex; align-items: flex-start;">
						<div style="margin-bottom: 10px;">
							Don't have an account? <a style="color: blueviolet;"
								href="signupPage">Sign Up</a>
						</div>
					</div>
					<div class="input-group form-group d-flex justify-content-center">
						<%
						String errorMessage = (String) session.getAttribute("errorMessage");
						if (errorMessage != null) {
						%>
						<p style="color: red" class="error-message"><%=errorMessage%></p>
						<%
						}
						session.removeAttribute("errorMessage"); // Clear the attribute after displaying it
						%>
					</div>

				</div>
			</div>
		</div>
	</div>

	<br>
	<script>
		function togglePasswordVisibility() {
			const passwordFields = document
					.querySelectorAll('input[type="password"]');
			passwordFields.forEach(function(passwordField) {
				passwordField.type = passwordField.type === 'password' ? 'text'
						: 'password';
			});
		}
		function onEmail() {
			var emailInput = document.getElementById('emailId');
			var emailValue = emailInput.value.trim();
			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			if (emailRegex.test(emailValue)) {

				const xhttp = new XMLHttpRequest();
				console.log('Running in ajax');
				xhttp.open("GET",
						"http://localhost:8080/WomenSecurityApps/emailId/"
								+ encodeURIComponent(emailValue));
				xhttp.send();

				xhttp.onload = function() {
					var exists = this.responseText === "exists";
					if (exists) {
						document.getElementById("errorEmail").innerText = "";

					} else {
						document.getElementById("errorEmail").innerText = "Email Id is not exists";
					}
				};
			} else {
				document.getElementById("errorEmail").innerText = "Please enter a valid email address";
			}
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>