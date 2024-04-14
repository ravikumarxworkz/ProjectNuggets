<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Sign Up</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" />

<style>
/*--------------    COMMON CSS CODE FOR ALL BODY AND NAVIGATION BAR    --------------  */
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

/*--------------     CSS CODE FOR SIGNUP AND EMAIL VERIFICATION    --------------  */
.registration-form {
	padding: 50px 0;
	background-color: transparent;
}

.registration-form form {
	background-color:;
	max-width: 600px;
	margin: auto;
	padding: 50px 70px;
	border-radius: 30px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}

.registration-form .form-icon {
	text-align: center;
	border-radius: 50%;
	font-size: 40px;
	color: white;
	width: 100px;
	height: 100px;
	margin: auto;
	margin-bottom: 50px;
	line-height: 100px;
}

.registration-form .item {
	border-radius: 20px;
	margin-bottom: 25px;
	padding: 10px 20px;
}

.registration-form .create-account {
	border-radius: 30px;
	padding: 10px 20px;
	font-size: 18px;
	font-weight: bold;
	background-color: green; /* Light pink */
	border: none;
	color: white;
	margin-top: 20px;
}

.registration-form .social-media {
	max-width: 600px;
	margin: auto;
	padding: 35px 0;
	text-align: center;
	border-radius: 30px;
	color: black;
	border-top: 1px solid #dee9ff;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .social-icons {
	margin-top: 30px;
	margin-bottom: 16px;
}

.registration-form .social-icons a {
	font-size: 23px;
	margin: 0 3px;
	color: blueviolet;
	border: 1px solid;
	border-radius: 50%;
	width: 45px;
	display: inline-block;
	height: 45px;
	text-align: center;
	background-color: white;
	line-height: 45px;
}

.registration-form .social-icons a:hover {
	text-decoration: none;
	color: white;
	background-color: black;
	opacity: 0.6;
}

@media ( max-width : 576px) {
	.registration-form form {
		padding: 50px 20px;
	}
	.registration-form .form-icon {
		width: 70px;
		height: 70px;
		font-size: 30px;
		line-height: 70px;
	}
}

.form-label {
	font-weight: bold;
}

.centered {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.custom-form {
	width: 100%;
	max-width: 600px;
	padding: 20px;
	margin: auto;
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
						href="homePage">Home</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="signinPage">SignIn</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<br>
	<!-- -----------------------  Email verification HTML code  ------------------------>
	<div class="registration-form" id="emailVerify">
		<form id="forgotPasswordForm" action="#" method="post">
			<h4 class="text-center" style="font-weight: bolder;" >Email Confirmation Authentication</h4>
			<div class="form-group">
				<label for="email" class="form-label" >EmailID:</label> <input type="email" id="email"
					name="email" class="form-control" onchange="onEmail()" placeholder="enter your email"
					required="required"> <span id="emailError"
					style="color: red;"></span> <span id="emailSuccess"
					style="color: green;"></span>
			</div>
			<button type="button" class="btn btn-primary btn-block mx-auto mt-3"
				id="checkEmail" disabled="disabled">Generate OTP</button>
			<div class="form-group mt-3" style="display: none;" id="otpSection">
				<label for="otp" class="form-label" >Enter OTP:</label> <input type="text"  placeholder="enter OTP"
					class="form-control" id="otp" name="otp" required> <span
					id="otpError" style="color: red;"></span>
				<button type="button" class="btn btn-primary btn-block mt-3"
					id="validateOTP">Validate OTP</button>
			</div>
		</form>
	</div>
	<!-- -----------------------  SignUP FROM HTML code  ------------------------>

	<div class="registration-form" id="signupForm" style="display: none;">
		<form action="saveSignUpValues" method="post" id="registrationForm"
			enctype="multipart/form-data">
			<h4 class="text-center">Sign Up</h4>
			<div id="verificationSuccessMessage" style="display: none;"
				class="alert alert-success" role="alert">Your email has been
				verified successfully. Please fill out all fields to create your
				account.</div>
			<div class="mb-3">
				<label for="userName" class="form-label"><i
					class="fa-solid fa-user"></i>UserName</label> <input type="text"
					class="form-control" id="userName" name="name"
					placeholder="Enter username" required onblur="onName()" /> <span
					id="erroruserName" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label"><i
					class="fa-regular fa-envelope"></i>Email</label> <input type="email"
					class="form-control" id="signupEmail" name="email"
					placeholder="Enter your email" required readonly="readonly">
			</div>
			<div class="mb-3">
				<label for="aadharcardnumber" class="form-label"><i
					class="fa-solid fa-pencil"></i>AadharCard Number</label> <input type="text"
					class="form-control" id="aadharCardNumber" name="aadharCardNumber"
					placeholder="Enter Aadhar card number" required
					onchange="onAadharCardNumber()" /> <span
					id="errorAadharCardNumber" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="contactNumber" class="form-label"><i
					class="fa-solid fa-phone"></i>Contact Number</label> <input type="tel"
					class="form-control" id="contactNumber" name="contactNumber"
					placeholder="Enter contact number" required
					onchange="validateContactNumber()" /> <span
					id="errorContactNumber" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="altContactNumber" class="form-label"><i
					class="fa-solid fa-phone"></i>Alternative Contact Number</label> <input
					type="tel" class="form-control" id="altContactNumber"
					name="altContactNumber"
					placeholder="Enter alternative contact number" required
					onblur="validateAltContactNumber()" /> <span
					id="erroraltContactNumber" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="country" class="form-label"><i
					class="fa-solid fa-globe"></i>Country</label> <input type="text"
					class="form-control" id="country" name="country" value="India"
					readonly />
			</div>
			<div class="mb-3">
				<label for="states" class="form-label"><i
					class="fa-solid fa-city"></i>State</label> <select class="form-select"
					id="states" name="state" required>
					<option value="">Select a state</option>
					<c:forEach items="${allStates}" var="state">
						<option value="${state.stateName}">${state.stateName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mb-3">
				<label for="presentPlace" class="form-label"><i
					class="fa-regular fa-building"></i>Present Place</label> <input type="text"
					class="form-control" id="presentPlace" name="presentPlace"
					placeholder="Enter present place" onblur="validatePresentPlace()"
					required /> <span id="errorPresentPlace" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="pincode" class="form-label"><i
					class="fa-solid fa-location-dot"></i>Pin Code</label> <input type="text"
					class="form-control" id="pincode" name="pincode"
					placeholder="Enter pin code" required onblur="validatePincode()" />
				<span id="errorpincode" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label"><i
					class="fa-solid fa-location-dot"></i>Password</label> <input
					type="password" class="form-control" id="password" name="password"
					placeholder="Enter password" required onblur="validatePassword()" />
				<input type="checkbox" id="showPasswordCheckbox"
					onchange="togglePasswordVisibility('password')">
				<label for="showPasswordCheckbox">Show Password</label> <span
					id="errorPassword" style="color: red;"></span>
			</div>

			<div class="mb-3" id="confirmPasswordField" class="form-group">
				<label for="confirmPassword" class="form-label"><i
					class="fa-solid fa-location-dot"></i>Confirm Password</label> <input
					type="password" class="form-control" id="confirmPassword"
					name="confirmPassword" placeholder="Confirm password" required
					onblur="validatePassword()" /> <input type="checkbox"
					id="showConfirmPasswordCheckbox"
					onchange="togglePasswordVisibility('confirmPassword')">
				<label for="showConfirmPasswordCheckbox">Show Password</label> <span
					id="errorConfirmPassword" style="color: red"></span>
			</div>

			<div class="form-group">
				<button type="submit" id="button"
					class="btn btn-block create-account" disabled>Create
					Account</button>
			</div>
			<c:forEach items="${errors}" var="e">

				<span style="color: red;">${e.message }</span>
			</c:forEach>
		</form>
	</div>

	<!-- -----------------------  Email verification Start ------------------------>
	<script>
		function onEmail() {
			var emailInput = document.getElementById('email');

			// Check if emailInput is not null before accessing its value
			var emailValue = emailInput ? emailInput.value.trim() : '';

			var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			console.log(emailInput);

			if (emailRegex.test(emailValue)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running in ajax');
				xhttp.open("GET",
						"http://localhost:8080/WomenSecurityApps/emailId/"
								+ encodeURIComponent(emailValue));
				xhttp.send();

				xhttp.onload = function() {
					if (xhttp.status === 200) {
						var exists = this.responseText === "exists";
						if (exists) {
							document.getElementById("emailError").innerHTML = "Email already exists";
							document.getElementById("checkEmail").disabled = true;
						} else {
							document.getElementById("emailError").innerHTML = "";
							document.getElementById("checkEmail").disabled = false;
						}
					} else {
						console.error('Error fetching email existence:',
								xhttp.status);
					}
				};
			} else {
				document.getElementById("emailError").innerText = "Please enter a valid email address";
				document.getElementById("checkEmail").disabled = true;
			}
		}
		document.getElementById('checkEmail').addEventListener('click',
				function() {
					validateEmail();
				});

		function validateEmail() {
			var userEmail = document.getElementById('email').value;

			$
					.ajax({
						url : 'http://localhost:8080/WomenSecurityApps/emailVerification?email='
								+ userEmail,
						type : 'GET',
						success : function(response) {
							if (response.trim() === 'Exists') {
								document.getElementById('emailError').innerHTML = ' ';
								document.getElementById('emailSuccess').innerHTML = 'OTP sent to email.';
								document.getElementById('otpSection').style.display = 'block';
							} else {
								document.getElementById('emailError').innerHTML = 'otp is not genrated.';
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.error('Error:', textStatus, errorThrown);
						}
					});
		}
		document.getElementById('validateOTP').addEventListener('click',
				function() {
					validateOTP();
				});
		function validateOTP() {
			var otpValue = document.getElementById('otp').value;
			var userEmail = document.getElementById('email').value;

			if (otpValue != null && otpValue != "") {
				$
						.ajax({
							url : 'http://localhost:8080/WomenSecurityApps/validateEmailVerificationOTP',
							type : 'POST',
							data : {
								otp : otpValue,
								email : userEmail
							},
							success : function(response) {
								if (response.trim() === 'valid') {
									document
											.getElementById('verificationSuccessMessage').style.display = 'block';
									document.getElementById('emailVerify').style.display = 'none';
									document.getElementById('signupForm').style.display = 'block';
									document.getElementById('signupEmail').value = userEmail;
								} else {
									document.getElementById('otpError').innerHTML = 'Invalid OTP.';
									document.getElementById("button").disabled = false;
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
	</script>
	<!-- -----------------------  SignUP FROM EACH FILED VALIDATION CODE  ------------------------>
	<script>
		function togglePasswordVisibility(fieldId) {
			const passwordField = document.getElementById(fieldId);
			passwordField.type = passwordField.type === 'password' ? 'text'
					: 'password';
		}

		function onName() {
			var userName = document.getElementById("userName").value.trim();

			var isValidLength = userName.replace(/\s+/g, '').length >= 3;

			var isValidCharacters = /^[A-Za-z\s]+$/.test(userName);

			if (isValidLength && isValidCharacters) {
				document.getElementById("erroruserName").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				document.getElementById("erroruserName").innerHTML = "Username must be at least 3 alphabetic characters";
				document.getElementById("button").disabled = true;
			}
		}

		function onAadharCardNumber() {
			var aadharInput = document.getElementById('aadharCardNumber');
			var aadharValue = aadharInput.value.trim();
			var aadharRegex = /^\d{12}$/;

			if (aadharRegex.test(aadharValue)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running in AJAX');

				xhttp.open("GET",
						"http://localhost:8080/WomenSecurityApps/aadharNumber/"
								+ encodeURIComponent(aadharValue));
				xhttp.send();

				xhttp.onload = function() {
					var exists = this.responseText === "aadharNumberexists";
					if (exists) {
						document.getElementById("errorAadharCardNumber").innerText = "Aadhar card number already exists";
						document.getElementById("button").disabled = true;
					} else {
						document.getElementById("errorAadharCardNumber").innerText = "";
						document.getElementById("button").disabled = false;

					}
				};
			} else {
				document.getElementById("errorAadharCardNumber").innerText = "Aadhar card number should be a valid 12-digit number";
				document.getElementById("button").disabled = true;
			}
		}

		function validateContactNumber() {
			var contactNumber = document.getElementById("contactNumber").value;
			if (/^\d{10}$/.test(contactNumber)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running in AJAX');

				xhttp.open("GET",
						"http://localhost:8080/WomenSecurityApps/contactNumber/"
								+ encodeURIComponent(contactNumber));
				xhttp.send();

				xhttp.onload = function() {
					var exists = this.responseText === "contactNumberexists";
					if (exists) {
						document.getElementById("errorContactNumber").innerHTML = "Contact number already exists";
						document.getElementById("button").disabled = true;
					} else {
						document.getElementById("errorContactNumber").innerHTML = "";
						document.getElementById("button").disabled = false;
					}
				};
			} else {
				document.getElementById("errorContactNumber").innerText = "Contact number should be a valid 10-digit number";
				document.getElementById("button").disabled = true;
			}
		}

		// Function to validate alternate contact number
		function validateAltContactNumber() {
			var number = document.getElementById("contactNumber").value;
			var altNumber = document.getElementById("altContactNumber").value;
			var numberRegex = /^[0-9]{10}$/;
			if (numberRegex.test(altNumber) && number !== altNumber) {
				document.getElementById("erroraltContactNumber").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				document.getElementById("erroraltContactNumber").innerHTML = number === altNumber ? "Contact and alternate number cannot be same"
						: "Enter 10 digits number";
				document.getElementById("button").disabled = true;
			}
		}

		function validatePresentPlace() {
			var presentPlace = document.getElementById("presentPlace").value
					.trim();
			var isValidPresentPlace = /^[A-Za-z\s]{3,100}$/.test(presentPlace);
			document.getElementById("errorPresentPlace").innerHTML = isValidPresentPlace ? ""
					: "Present Place must be between 3 and 100 characters and can only contain letters and spaces.";
			document.getElementById("button").disabled = !isValidPresentPlace;
		}

		// Function to validate pincode
		function validatePincode() {
			var pincode = document.getElementById("pincode").value;
			var pincodeRegex = /^\d{6}$/;
			if (pincodeRegex.test(pincode)) {
				document.getElementById("errorpincode").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				document.getElementById("errorpincode").innerHTML = "Pincode must be 6 digits";
				document.getElementById("button").disabled = true;
			}
		}
		function validatePassword() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z]).{8,20}$/;

			if (passwordRegex.test(password) && password === confirmPassword) {
				document.getElementById("errorPassword").innerHTML = "";
				document.getElementById("errorConfirmPassword").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				if (!passwordRegex.test(password)) {
					document.getElementById("errorPassword").innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 20 characters long";
					document.getElementById("button").disabled = true;
				} else {
					document.getElementById("errorPassword").innerHTML = "";
					document.getElementById("button").disabled = false;
				}

				if (password !== confirmPassword) {
					document.getElementById("errorConfirmPassword").innerHTML = "Passwords do not match";
					document.getElementById("button").disabled = true;
				} else {
					document.getElementById("errorConfirmPassword").innerHTML = "";
					document.getElementById("button").disabled = false;
				}

			}
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script> -->
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







