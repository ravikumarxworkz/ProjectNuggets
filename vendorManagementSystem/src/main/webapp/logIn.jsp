<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LogIn page</title>
<!-- Bootstrap 4.1.3 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- Font Awesome 5.3.1 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<!-- Bootstrap 5.3.2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

@import url('https://fonts.googleapis.com/css?family=Numans');

html, body {
	background: linear-gradient(90deg, #e6e6fa, #b0c4de);
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}

.navbar {
	background-color: black;
}
.nav-link {
	color: white;
	font-size: 20px;
	font-weight: bold;
}

.nav-link:hover {
	color: orangered;
	border-radius: 25px;
	color: orangered;
}

.navbar-toggler {
	color: white;
	background-color: white;
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
	height: auto;
	/* height: 370px; */
	margin-top: 20px;
	width: 400px;
	background-color: transparent;
	/* background: linear-gradient(90deg, #e6e6fa, #b0c4de); */
}

#otpExpirationMessage {
	margin-top: 10px;
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
				src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
				alt="logo" width="70" height="40"
				class="d-inline-block align-text rounded-circle">
			</a><span style="color: white; font-style: italic;">VendorManagement</span>
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
					<li class="nav-item"><a class="nav-link" href="registerPage">Register</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<br>
	<div class="d-flex justify-content-center align-items-center"
		class="alert alert-success" role="alert"">
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
		<div class="row justify-content-center align-items-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h3 class="text-center font-weight-bold">LOGIN</h3>
					</div>
					<div class="card-body">
						<form id="loginForm" action="logInProfile" method="post">
							<div class="form-group">
								<label for="email">Email</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" class="form-control" id="email" name="email"
										placeholder="Email" onchange="onEmail()">
								</div>
								<span id="errorEmail" style="color: red"></span> <span
									id="emailSuccess" style="color: green;"></span>
							</div>
							<div class="form-group text-center">
								<button type="button" class="btn btn-primary" id="sendOTPButton"
									onclick="sendOTP()" disabled>Send OTP</button>
							</div>
							<div id="otpSection">
								<div class="form-group">
									<label for="otp">Enter OTP</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-key"></i></span>
										</div>
										<input type="text" class="form-control" id="otp" name="OTP"
											placeholder="Enter OTP">
									</div>
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
							<div class="form-group text-center">
								<button type="submit" class="btn btn-success" id="loginButton"
									disabled>Login</button>
							</div>
						</form>
						<div class="text-center" style="color: black;">
							<p>
								Don't have an account? <a href="registerPage"
									style="color: blueviolet;">Register here</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function onEmail() {
			var emailInput = document.getElementById('email');

			var emailValue = emailInput ? emailInput.value.trim() : '';

			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			console.log(emailInput);

			if (emailRegex.test(emailValue)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running in ajax');
				xhttp.open("GET",
						"http://localhost:8080/vendorManagementSystem/checkEmailExistence/"
								+ encodeURIComponent(emailValue));
				xhttp.send();

				xhttp.onload = function() {
					if (xhttp.status === 200) {
						var exists = this.responseText === "EmailIDexists";
						if (exists) {
							document.getElementById("errorEmail").innerText = "";
							document.getElementById("sendOTPButton").disabled = false;
							document.getElementById("loginButton").disabled = false;
						} else {
							document.getElementById("errorEmail").innerText = "Emailid is not exists";
							document.getElementById("sendOTPButton").disabled = true;
						}
					} else {
						console.error('Error fetching email existence:',
								xhttp.status);
					}
				};
			} else {
				document.getElementById("errorEmail").innerText = "Please enter a valid email address";
				document.getElementById("sendOTPButton").disabled = true;
			}
		}

		function sendOTP() {
			var userEmail = document.getElementById('email').value;
			console.log('this is send otp method');

			$
					.ajax({
						url : 'http://localhost:8080/vendorManagementSystem/loginOTP/genrateLoginOTPAndSave?email='
								+ userEmail,
						type : 'GET',
						success : function(response) {
							if (response.trim() === 'OPTSentSuccessfully') {
								document.getElementById('errorEmail').innerText = ' ';
								document.getElementById('emailSuccess').innerText = 'OTP sent to email. The OTP will expire in 2 minutes.';
								document.getElementById("sendOTPButton").disabled = true;
							} else {
								document.getElementById('errorEmail').innerText = 'otp is not genrated.';
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.error('Error:', textStatus, errorThrown);
						}
					});
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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