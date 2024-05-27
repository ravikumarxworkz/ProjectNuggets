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

/*--------------     CSS CODE FOR SIGNUP AND EMAIL VERIFICATION    --------------  */
.container {
	margin-top: 25px:           
	display: flex;
	justify-content: center;
	align-items: center;
	width: 50%;
}
form {
	background-color: #ffffff;
	border-radius: 8px;
	padding: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h5, h2 {
	text-align: center;
	font-weight: bold;
	margin-bottom: 20px;
}

.form-control {
	border-radius: 6px;
	margin-bottom: 15px;
}

.btn-primary {
	border-radius: 6px;
}

.form-column {
	max-width: 500px;
	padding: 20px;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-column h2 {
	text-align: center;
}

button[type="submit"] {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

input::placeholder {
	font-size: 12px;
	font-style: italic;
}

fieldset {
	border: 2px solid #ccc; /* Add an outline */
	padding: 10px; /* Add some padding inside the fieldset */
}

.input-container {
	position: relative;
	margin-bottom: 15px;
	
}

input[type="text"], input[type="email"], input[type="tel"], input[type="date"],
	input[type="password"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-bottom-width: 2px;
	border-radius: 4px;
	box-sizing: border-box;
	transition: all 0.3s;
}

input[type="text"]:focus, input[type="email"]:focus, input[type="tel"]:focus,
	input[type="date"]:focus, input[type="password"]:focus {
	border-color: dodgerblue;
	outline: none;
}

input[type="text"]+label, input[type="email"]+label, input[type="tel"]+label,
	input[type="date"]+label, input[type="password"]+label {
	position: absolute;
	top: 50%;
	left: 10px;
	transform: translateY(-50%);
	color: #999;
	transition: all 0.3s;
	pointer-events: none;
	background-color: #fff;
	padding: 0 5px;
}

input[type="text"]:focus+label, input[type="email"]:focus+label, input[type="tel"]:focus+label,
	input[type="date"]:focus+label, input[type="password"]:focus+label,
	input[type="text"]:valid+label, input[type="email"]:valid+label, input[type="tel"]:valid+label,
	input[type="date"]:valid+label, input[type="password"]:valid+label {
	top: -5px;
	font-size: 12px;
	color: dodgerblue;
}
</style>
</head>
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
					<li class="nav-item active"><a class="nav-link"
						href="logInPage">LogIn</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<br>

	<!-- -----------------------  Email verification HTML code  ------------------------>
	<div class="container" id="emailVerify">
		<form action="#" method="post">
			<h4 class="text-center" style="font-weight: bolder;">Email
				Confirmation Authentication</h4>
			<div class="form-group">
				<label for="email" class="form-label">EmailID:</label> <input
					type="email" id="email" name="email" class="form-control"
					onchange="onEmail()" placeholder="enter your email"
					required="required"> <span id="emailError"
					style="color: red;"></span> <span id="emailSuccess"
					style="color: green;"></span>
			</div>
			<button type="button" class="btn btn-primary btn-block mx-auto mt-3"
				id="checkEmail" disabled="disabled">Generate OTP</button>
			<div class="form-group mt-3" style="display: none;" id="otpSection">
				<label for="otp" class="form-label">Enter OTP:</label> <input
					type="text" placeholder="enter OTP" class="form-control" id="otp"
					name="otp" required> <span id="otpError"
					style="color: red;"></span>
				<button type="button" class="btn btn-primary btn-block mt-3"
					id="validateOTP">Validate OTP</button>
			</div>
		</form>
	</div>
	<!-- -----------------------  SignUP FROM HTML code  ------------------------>
	<div class="container" id="signupForm" style="display: none;">
		<form action="saveVendorDTO" method="post" >
			<h2>Register Form</h2>
			<div id="verificationSuccessMessage" style="display: none;"
				class="alert alert-success" role="alert">Your email has been
				verified successfully. Please fill out all fields to create your
				account.</div>
			<fieldset>
				<h5>Personal Details</h5>
				<div class="mb-3">
					<div class="row">
						<div class="col">
							<div class="input-container">
								<input type="text" class="form-control" id="ownerName"
									name="ownerName" onblur="onName()" required> <label
									for="ownerName">Owner Name</label> <span id="errorownerName"
									style="color: red;"></span>
							</div>
						</div>
						<div class="col">
							<div class="input-container">
								<input type="email" class="form-control" id="signupEmail"
									name="emailId" readonly="readonly"> <label for="email">Email</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="input-container">
								<input type="tel" class="form-control" id="contactNumber"
									name="contactNumber" required
									onchange="validateContactNumber()"> <label
									for="contactNumber">contact Number </label> <span
									id="errorContactNumber" style="color: red;"></span>
							</div>
						</div>
						<div class="col">
							<div class="input-container">
								<input type="tel" class="form-control" id="altContactNumber"
									name="altContactNumber" required
									onchange="validateAltContactNumber()"> <label
									for="AltPhoneNumber">Alt Phone Number</label> <span
									id="erroraltContactNumber" style="color: red;"></span>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
			<br>
			<fieldset>
				<div class="mb-3">
					<h5>Business Details</h5>
					<div class="row">
						<div class="col">
							<div class="input-container">
								<input type="text" class="form-control" id="vendorName"
									name="vendorName" required onchange="onVendorName()"> <label
									for="vendorName">Vendor Name</label> <span id="errorVendorName"></span>
							</div>
						</div>
						<div class="col">
							<div class="input-container">
								<input type="text" class="form-control" id="gstNumber"
									name="GSTNumber" required onchange="onGSTNumber()"> <label
									for="gstNumber">GST Number</label> <span id="errorGSTNumber"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="input-container">
								<input type="date" class="form-control" id="startDate"
									name="startDate" required> <label for="startDate">Business
									Start Date</label>
							</div>
						</div>
						<div class="col">
							<div class="input-container">
								<input type="text" class="form-control" id="website"
									name="website" required onchange="onWebsite()"> <label
									for="website">website</label> <span id="errorWebsite"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="input-container">
								<input type="text" class="form-control" id="address"
									name="address" required> <label for="address">Address</label>
							</div>
						</div>
						<div class="col">
							<div class="input-container">
								<input type="text" class="form-control" id="pincode"
									name="pincode" required onblur="validatePincode()" /> <label
									for="address">pincode</label> <span id="errorpincode"
									style="color: red;"></span>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
			<button id="button" type="submit"
				class="btn btn-primary d-block mx-auto" disabled>Register</button>
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
						"http://localhost:8080/vendorManagementSystem/checkEmailExistence/"
								+ encodeURIComponent(emailValue));
				xhttp.send();

				xhttp.onload = function() {
					if (xhttp.status === 200) {
						var exists = this.responseText === "EmailIDexists";
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
						url : 'http://localhost:8080/vendorManagementSystem/genrateOTPAndSave?email='
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
							url : 'http://localhost:8080/vendorManagementSystem/validateEmailVerificationOTP',
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
	<!---------------------------Check ContactNumber / Website / GSTNumber EXIT In DataBase-->
	<script>
		// Function to validate and check existence of contact number in database
		function validateContactNumber() {
			var contactNumber = document.getElementById("contactNumber").value;
			if (/^\d{10}$/.test(contactNumber)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running in AJAX');

				xhttp.open("GET",
						"http://localhost:8080/vendorManagementSystem/checkContactNumberExistence/"
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
		// Function to validate and check existence of GSTNumber in database
		function onGSTNumber() {
			var gstInput = document.getElementById('gstNumber');
			var gstValue = gstInput.value.trim();
			var gstRegex = /^[A-Za-z0-9]{15}$/;

			if (gstRegex.test(gstValue)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running AJAX for GST Number');

				xhttp.open("GET",
						"http://localhost:8080/vendorManagementSystem/checkGSTNumberExistence/"
								+ encodeURIComponent(gstValue));
				xhttp.send();

				xhttp.onload = function() {
					var exists = this.responseText === "GSTNumberExist";
					if (exists) {
						document.getElementById("errorGSTNumber").innerText = "GST number already exists";
						document.getElementById("button").disabled = true;
					} else {
						document.getElementById("errorGSTNumber").innerText = "";
						document.getElementById("button").disabled = false;
					}
				};
			} else {
				document.getElementById("errorGSTNumber").innerText = "GST number should contain 15 alphanumeric characters";
				document.getElementById("button").disabled = true;
			}
		}
		// Function to validate and check existence of Website in database
		function onWebsite() {
			var websiteInput = document.getElementById('website');
			var websiteValue = websiteInput.value.trim();
			var websiteRegex = /^(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$/;

			if (websiteRegex.test(websiteValue)) {
				const xhttp = new XMLHttpRequest();
				console.log('Running AJAX for Website');

				xhttp.open("GET",
						"http://localhost:8080/vendorManagementSystem/checkWebsiteExistence/"
								+ encodeURIComponent(websiteValue));
				xhttp.send();

				xhttp.onload = function() {
					var exists = this.responseText === "websiteExists";
					if (exists) {
						document.getElementById("errorWebsite").innerText = "Website already exists in the database";
						document.getElementById("button").disabled = true;
					} else {
						document.getElementById("errorWebsite").innerText = "";
						document.getElementById("button").disabled = false;
					}
				};
			} else {
				document.getElementById("errorWebsite").innerText = "Invalid website format";
				document.getElementById("button").disabled = true;
			}
		}
	</script>
	<!-- -----------------------  SignUP FROM EACH FILED VALIDATION CODE  ------------------------>
	<script>
		function onName() {
			var userName = document.getElementById("ownerName").value.trim();

			var isValidLength = userName.replace(/\s+/g, '').length >= 3;

			var isValidCharacters = /^[A-Za-z\s]+$/.test(userName);

			if (isValidLength && isValidCharacters) {
				document.getElementById("errorownerName").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				document.getElementById("errorownerName").innerHTML = "Username must be at least 3 alphabetic characters";
				document.getElementById("button").disabled = true;
			}
		}
		// Function to validate vedor name
		function onVendorName() {
			var userName = document.getElementById("vendorName").value.trim();

			var isValidLength = userName.replace(/\s+/g, '').length >= 3;

			var isValidCharacters = /^[A-Za-z\s]+$/.test(userName);

			if (isValidLength && isValidCharacters) {
				document.getElementById("errorVendorName").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				document.getElementById("errorVendorName").innerHTML = "VendorName must be at least 3 alphabetic characters";
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







