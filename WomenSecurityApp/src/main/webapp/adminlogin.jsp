<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin login page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
@import url("https://fonts.googleapis.com/css?family=Raleway:400,700");

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

body {
	background: linear-gradient(90deg, #e6e6fa, #b0c4de);
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

.navbar-brand {
	font-size: 30px;
	font-weight: bold;
}
/*   common css code for all body page and navbar */
.centered {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh;
}

.custom-form {
	width: 60%;
	max-width: 400px;
	padding: 15px;
	margin: auto;
	border: 4px solid white;
	border-radius: 10px;
}

.btn-success {
	background-color: #28a745;
	border-color: #28a745;
}
</style>
</head>
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
						href="http://localhost:8080/WomenSecurityApps/homePage">Home</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="http://localhost:8080/WomenSecurityApps/signupPage">SignUp</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="http://localhost:8080/WomenSecurityApps/signinPage">SignIn</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<br>
	<div class="centered">
		<div class="container custom-form">
			<h2 class="text-center">Admin Login</h2>
			<h3 id="errorMessage" style="color: red">${error}</h3>
			<form id="forgotPasswordForm" action="Login" method="post">
				<div class="form-group">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" class="form-control" required="required"> <span
						id="emailError" style="color: red;"></span> <span
						id="emailSuccess" style="color: green;"></span>
				</div>
				<button type="button" class="btn btn-primary btn-block"
					id="checkEmail">Generate OTP</button>

				<div class="form-group mt-3" style="display: none;" id="otpSection">
					<label for="otp">Enter OTP:</label> <input type="text"
						class="form-control" id="otp" name="otp" required> <span
						id="otpError" style="color: red;"></span> <span id="otpsucess"
						style="color: green;"></span>
					<button type="button" class="btn btn-primary btn-block mt-3"
						id="validateOTP">Validate OTP</button>
				</div>
				<div class="form-group mt-3" style="display: none;"
					id="newPasswordSection">
					<label for="newPassword">New Password:</label> <input
						type="password" class="form-control" id="newPassword"
						name="password" required> <span id="errorPassword"
						style="color: red;"></span>
				</div>
				<div class="form-group" style="display: none;"
					id="confirmPasswordSection">
					<label for="confirmPassword">Confirm Password:</label> <input
						type="password" class="form-control" id="confirmPassword"
						name="confirmPassword" required><input type="checkbox"
						id="showPasswordCheckbox" onchange="togglePasswordVisibility()">
					<label for="showPasswordCheckbox">Show Password</label> <span
						id="errorConfirmPassword" style="color: red;"></span>
					<button type="submit" class="btn btn-primary btn-block mt-3"
						id="button" disabled>Submit</button>
					<span style="color: red;">${message}</span>
				</div>
				<div class="alert alert-success mt-3" role="alert"
					id="otpSuccessMessage" style="display: none;">OTP verified
					successfully!</div>
			</form>
		</div>
	</div>
	<script>
		function togglePasswordVisibility() {
			var passwordInput = document.getElementById("confirmPassword");
			var checkbox = document.getElementById("showPasswordCheckbox");

			if (checkbox.checked) {
				passwordInput.type = "text";
			} else {
				passwordInput.type = "password";
			}
		}

		document.getElementById('validateOTP').addEventListener('click',
				function() {
					validateOTP();
				});

		document.getElementById('newPassword').addEventListener('blur',
				function() {
					validatePassword();
				});

		document.getElementById('confirmPassword').addEventListener('blur',
				function() {
					validatePassword();
				});

		document.getElementById('checkEmail').addEventListener('click',
				function() {
					validateEmail();
				});

		function validateEmail() {
			var userEmail = document.getElementById('email').value;

			$
					.ajax({
						url : 'http://localhost:8080/WomenSecurityApps/admin/reemail?email='
								+ userEmail,
						type : 'GET',
						success : function(response) {
							if (response.trim() === 'exists') {
								document.getElementById('emailError').innerHTML = ' ';
								document.getElementById('emailSuccess').innerHTML = '  otp sent to eamil id.';
								document.getElementById('otpSection').style.display = 'block';
								document.getElementById("checkEmail").classList
										.add("btn-success");
								document.getElementById("checkEmail").disabled = true;
							} else {
								document.getElementById('emailError').innerHTML = 'Email is not present.';
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.error('Error:', textStatus, errorThrown);
						}
					});
		}
		function validateOTP() {
			var otpValue = document.getElementById('otp').value;
			var userEmail = document.getElementById('email').value;

			if (otpValue != null && otpValue != "") {
				// Send the OTP and email to the backend for validation
				$
						.ajax({
							url : 'http://localhost:8080/WomenSecurityApps/admin/validateOTP',
							type : 'POST',
							data : {
								otp : otpValue,
								email : userEmail
							},
							success : function(response) {
								if (response.trim() === 'valid') {
									document.getElementById('otpError').innerHTML = ' ';
									document.getElementById('otpsucess').innerHTML = '  otp valide.';
									document
											.getElementById('otpSuccessMessage').style.display = 'block';
									document
											.getElementById('newPasswordSection').style.display = 'block';
									document
											.getElementById('confirmPasswordSection').style.display = 'block';
									document.getElementById("validateOTP").classList
											.remove("btn-primary");
									document.getElementById("validateOTP").classList
											.add("btn-success");
									document.getElementById("validateOTP").disabled = true;
								} else {
									document.getElementById('otpError').innerHTML = 'Invalid OTP.';
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console
										.error('Error:', textStatus,
												errorThrown);
							}
						});
			} else {
				document.getElementById('otpError').innerHTML = 'Please enter a valid OTP.';
				document.getElementById("button").disabled = false;
			}
		}

		function validatePassword() {
			var newPassword = document.getElementById("newPassword").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z]).{8,20}$/;

			if (passwordRegex.test(newPassword)
					&& newPassword === confirmPassword) {
				document.getElementById("errorPassword").innerHTML = "";
				document.getElementById("errorConfirmPassword").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				if (!passwordRegex.test(newPassword)) {
					document.getElementById("errorPassword").innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 20 characters long";
				} else {
					document.getElementById("errorPassword").innerHTML = "";
				}
				if (newPassword !== confirmPassword) {
					document.getElementById("errorConfirmPassword").innerHTML = "Passwords do not match";
				} else {
					document.getElementById("errorConfirmPassword").innerHTML = "";
				}
				document.getElementById("button").disabled = true;
			}
		}
	</script>
	<script>
		// Function to hide the error message after 10 seconds
		function hideErrorMessage() {
			var errorMessage = document.getElementById("errorMessage");
			if (errorMessage) {
				setTimeout(function() {
					errorMessage.style.display = "none";
				}, 10000); // Hide after 10 seconds (10000 milliseconds)
			}
		}

		// Call the function to hide the error message
		hideErrorMessage();
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="/js/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>
