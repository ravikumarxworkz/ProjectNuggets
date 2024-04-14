<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Change Password</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	font-family: Arial, sans-serif;
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

#nav-link {
	color: white;
	font-size: 20px;
	font-weight: bold;
	background-color: blueviolet;
	border: none;
	padding: 10px 10px;
}

#nav-link:hover {
	background-color: deeppink;
	border-radius: 25px;
}

.dropdown-menu {
	right: 0;
	min-width: auto;
	z-index: 999;
}

.dropdown-item {
	padding: 0.5rem 1rem;
}

.dropdown-item:hover, .dropdown-item:focus {
	background-color: deeppink;
	color: #fff;
}

.dropdown-menu a.dropdown-item:focus, .dropdown-menu a.dropdown-item:hover
	{
	background-color: deeppink;
	color: #fff;
	border-color: #007bff;
}

.profile-photo {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 5px;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	margin-top: 50px;
}

.card {
	background-color: transparent;
	border: 4px solid black;
	border-radius: 10px;
}

.form-group label {
	font-weight: bold;
}

.card-title {
	text-align: center;
	font-weight: bolder;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg  fixed-top">
		<a class="navbar-brand" href="#"> <img
			src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQvNZf_pBtDBBjQo5rLJdEWAbip3qXggktTl_04DtYf6FWeX-b0"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${email}">
			<button type="submit" id="nav-link" name="action" value="safety">Safety
				Tips</button>
			<button type="submit" id="nav-link" name="action" value="complaint">Complaint</button>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>

			</button>
		</form>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNavDropdown">
			<form action="actionServlet" method="post">
				<input type="hidden" name="email" value="${email}">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <span
							class="user-display"> <img class="profile-photo"
								src="display?email=${email}">
						</span>

					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink">
							<div class="dropdown-item">
								<img class="profile-photo" src="display?email=${email}">
								${email}
								<!-- User Email -->
							</div>

							<button type="submit" class="dropdown-item" name="action"
								value="profile">
								<i class="fas fa-home"></i> Profile Home
							</button>

							<!-- <button type="submit" class="dropdown-item" name="action"
								value="view">
								<i class="fas fa-eye"></i> View
							</button> -->

							<button type="submit" class="dropdown-item" name="action"
								value="edit">
								<i class="fas fa-user-edit"></i> Edit Profile
							</button>

							<button type="submit" class="dropdown-item" name="action"
								value="changePassword">
								<i class="fas fa-lock"></i> Change Password
							</button>

							<button type="submit" class="dropdown-item" name="action"
								value="delete">
								<i class="fas fa-trash-alt"></i> Delete Account
							</button>

							<button type="submit" class="dropdown-item" name="action"
								value="logout">
								<i class="fas fa-sign-out-alt"></i> Logout
							</button>


						</div></li>
				</ul>
			</form>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Change Password</h5>
				<form id="changePasswordForm" action="changePassword" method="post">
					<div class="form-group mb-4">
						<input type="hidden" name="email" value="${email}">
						<div class="input-group">
							<input type="password" class="form-control" id="oldPassword"
								placeholder="Enter old Password" required name="oldPassword"
								onblur="validatePassword()">
							<button type="button" class="btn btn-outline-info"
								onclick="togglePasswordVisibility('oldPassword')">
								<i class="bi bi-eye"></i>
							</button>
						</div>
					</div>
					<div class="form-group mb-4">
						<div class="input-group">
							<input type="password" class="form-control" id="newPassword"
								placeholder="Enter New Password" aria-label="Password"
								aria-describedby="showPasswordButton" required>
							<button type="button" class="btn btn-outline-info"
								id="showPasswordButton"
								onclick="togglePasswordVisibility('newPassword')">
								<i class="bi bi-eye"></i>
							</button>
							<span id="errorOldPassword" class="error-message"
								style="color: red;"></span> <span id="errorPassword"
								class="error-message" style="color: red;"></span>
						</div>
					</div>
					<div class="form-group mb-4">
						<div class="input-group">
							<input type="password" class="form-control" id="confirmPassword"
								placeholder="Enter confirmPassword" name="confirmPassword"
								required onblur="validatePassword()">
							<button type="button" class="btn btn-outline-info"
								onclick="togglePasswordVisibility('confirmPassword')">
								<i class="bi bi-eye"></i>
							</button>
						</div>
						<span id="errorConfirmPassword" class="error-message"
							style="color: red;"></span>
					</div>
					<div class="row justify-content-center">
						<div class="col-md-10 text-center">
					<button type="submit" class="btn btn-primary mt-4" id="button"
						disabled>Change Password</button>
						</div>
						</div>
					<span id="message" style="color: red;">${message}</span>
					<div>
						<a href="forgotPassword" class="forgot-password-link float-right">Reset
							Password?</a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script>
		function togglePasswordVisibility(fieldId) {
			var passwordField = document.getElementById(fieldId);
			var buttonIcon = passwordField.nextElementSibling
					.querySelector('i');

			if (passwordField.type === 'password') {
				passwordField.type = 'text';
				buttonIcon.classList.remove('bi-eye');
				buttonIcon.classList.add('bi-eye-slash');
			} else {
				passwordField.type = 'password';
				buttonIcon.classList.remove('bi-eye-slash');
				buttonIcon.classList.add('bi-eye');
			}
		}
		function validatePassword() {
			var oldPassword = document.getElementById("oldPassword").value;
			var newPassword = document.getElementById("newPassword").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z]).{8,20}$/;

			if (oldPassword !== newPassword && passwordRegex.test(newPassword)
					&& newPassword === confirmPassword) {
				document.getElementById("errorPassword").innerHTML = "";
				document.getElementById("errorConfirmPassword").innerHTML = "";
				document.getElementById("errorOldPassword").innerHTML = "";
				document.getElementById("button").disabled = false;
			} else {
				if (oldPassword === newPassword) {
					document.getElementById("errorOldPassword").innerHTML = "New password should be different from old password";
				} else {
					document.getElementById("errorOldPassword").innerHTML = "";
				}
				if (!passwordRegex.test(newPassword)) {
					document.getElementById("errorPassword").innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 20 characters long";
					document.getElementById("button").disabled = true;
				} else {
					document.getElementById("errorPassword").innerHTML = "";
				}

				if (newPassword !== confirmPassword) {
					document.getElementById("errorConfirmPassword").innerHTML = "Passwords do not match";
					document.getElementById("button").disabled = true;
				} else {
					document.getElementById("errorConfirmPassword").innerHTML = "";
				}
			}
		}

		/* $(document).ready(function() {
		    $('#changePasswordForm').submit(function(event) {
		        event.preventDefault(); // Prevent the default form submission

		        var formData = $(this).serialize(); // Serialize the form data

		        $.ajax({
		            type: 'POST',
		            url: '/changePassword',
		            data: formData,
		            success: function(response) {
		                if (response.success) {
		                    window.location.href = '/signupPage'; // Redirect to sign-in page
		                } else {
		                    $('#message').text(response.error); // Display error message
		                    validatePassword(); // Trigger password validation to display errors
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error(xhr.responseText);
		            }
		        });
		    });
		}); */
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
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
