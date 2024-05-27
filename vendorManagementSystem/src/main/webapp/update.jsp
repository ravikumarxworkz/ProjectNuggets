<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>profile update page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Raleway', sans-serif;
}

body {
	background: linear-gradient(90deg, #e6e6fa, #b0c4de);
}

.navbar {
	background-color: black;
	min-height: 60px;
}

.navbar-brand img {
	border-radius: 50%;
}

.navbar-brand span {
	color: black;
	font-style: italic;
	font-weight: bolder;
}

#compnyName {
	color: white;
	font-style: italic;
	font-weight: bolder;
}

#userName,#notificationIcon {
	color: blue
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
	background-color: blue;
	color: #fff;
}

.dropdown-menu a.dropdown-item:focus, .dropdown-menu a.dropdown-item:hover
	{
	background-color: blue;
	color: #fff;
	border-color: #007bff;
}

.profile-photo {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 5px;
}


.card-header, .card-body, .form-label {
	color: black;
}

.card-header {
	background-color: #007bff;
}

.card-header h3, .form-label {
	font-weight: bold;
}

.card {
	border-radius: 15px;
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
}

.card-body {
	padding: 20px;
}

.card-header {
	border-radius: 15px 15px 0 0;
	padding: 15px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

.form-control {
	border-radius: 5px;
	border-color: #ccc;
}

.container {
	background-color: #f8f9fa;
	padding: 50px 0;
}

.row {
	margin-bottom: 20px;
}

img {
	max-width: 100%;
	height: auto;
}

.round-image {
	width: 150px;
	height: 160px;
	border-radius: 50%;
	overflow: hidden;
	display: inline-block;
	border: 2px solid #ccc;
}

.round-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.logo {
	height: 50px;
}

.profile-dropdown img {
	height: 30px;
	width: 30px;
	border-radius: 50%;
	margin-right: 10px;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="navbar-brand" href="#"> <img
			src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-bell"></i></a></li>
				<li class="nav-item dropdown profile-dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img src="display?email=${email}"
						alt="User Avatar"><span id="userName"></span></a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<div class="dropdown-item" style="text-align: right;">
							<%-- <img class="profile-photo" src="display?email=${email}">
                        ${email} --%>
						</div>
						<a href="actionServlet?action=profile" class="dropdown-item"><i
							class="fas fa-home"></i> Profile Home</a> <a
							href="actionServlet?action=edit" class="dropdown-item"><i
							class="fas fa-user-edit"></i> Edit Profile</a> <a
							href="actionServlet?action=logout" class="dropdown-item"><i
							class="fas fa-sign-out-alt"></i> Logout</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<br>
	<br>
	<div class="container">
		<form action="updateVendorProfile" id="userProfileForm"
			enctype="multipart/form-data" method="post">
			<c:set var="user" value="${userProfile}" />
			<div class="row justify-content-center">
				<!-- User Profile -->
				<div class="col-md-8">
					<div class="card mt-5">
						<div class="card-header text-center">
							<h3>User Profile</h3>
						</div>
						<div class="card-body">
							<div class="row mb-3">
								<div class="col-md-3">
									<label for="userName" class="form-label"><i
										class="fa-solid fa-user"></i>Owner Name:</label>
								</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="ownerName"
										name="ownerName" onblur="onName()" value="${user.ownerName}"
										required readonly="readonly" /><span id="errorownerName"
										style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-3">
									<label for="email" class="form-label"><i
										class="fa-solid fa-envelope"></i>Email:</label>
								</div>
								<div class="col-md-9">
									<input type="email" class="form-control" id="email"
										name="emailId" value="${user.emailId}" readonly="readonly" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-3">
									<label for="contactNumber" class="form-label"><i
										class="fa-solid fa-phone"></i>Contact Number:</label>
								</div>
								<div class="col-md-9">
									<input type="text" class="form-control" id="contactNumber"
										name="contactNumber" value="${user.contactNumber}"
										onblur="validateContactNumber()" required readonly /> <span
										id="errorContactNumber" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-3">
									<label for="altContactNumber" class="form-label"><i
										class="fa-solid fa-phone"></i>altContactNumber:</label>
								</div>
								<div class="col-md-9">
									<input type="tel" class="form-control" id="altContactNumber"
										name="altContactNumber" required
										value="${user.altContactNumber}"
										onchange="validateAltContactNumber()" readonly /> <span
										id="erroraltContactNumber" style="color: red;"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- User Image -->
				<div class="col-md-4">
					<div class="card mt-5" style="height: fit-content;">
						<div class="card-header text-center">
							<h3>User Photo</h3>
						</div>
						<div class="card-body text-center">
							<div class="round-image" style="height: 100px; width: 100px">
								<!-- Initially display the user's current photo -->
								<img id="userPhoto"
									src="http://localhost:8080/vendorManagementSystem/display?email=${user.emailId}"
									alt="User Photo">
							</div>
							<div class="mt-3" id="uploadButtonWrapper" style="display: none;">
								<label for="newPhoto" class="btn btn-warning"> <span
									id="uploadLabel">Upload New photo</span> <input type="file"
									id="newPhoto" name="imageFile" accept="image/*" readonly
									style="display: none;" onchange="previewNewPhoto(event)">
								</label>
							</div>
						</div>
					</div>
				</div>
				<!-- Additional Details -->
				<div class="col-md-11 mt-3">
					<div class="card">
						<div class="card-header text-center">
							<h3>Business Details</h3>
						</div>
						<div class="card-body">
							<div class="row">
								<!-- First Column -->
								<div class="col-md-6">
									<!-- Aadhar Card Number -->
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="vendorName" class="form-label"><i
												class="fa-solid fa-user"></i>vendorName:</label>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" id="vendorName"
												name="vendorName" value="${user.vendorName}" required
												onchange="onVendorName()" readonly="readonly">
										</div>
									</div>
									<!-- Country -->
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="country" class="form-label"><i
												class="fa-solid fa-pencil"></i>GSTNumber:</label>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" id="gstNumber"
												name="GSTNumber" value="${user.GSTNumber}" required
												onchange="onGSTNumber()" readonly="readonly"> <span
												id="errorGSTNumber"></span>
										</div>
									</div>
								</div>
								<!-- Second Column -->
								<div class="col-md-6">
									<!-- Alternative Contact Number -->
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="startDate" class="form-label"><i
												class="fa-solid fa-date"></i>startDate:</label>
										</div>
										<div class="col-md-7">
											<input type="date" class="form-control" id="startDate"
												name="startDate" value="${user.startDate}" required
												readonly="readonly">
										</div>
									</div>
									<!-- State -->
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="states" class="form-label"><i
												class="fa-solid fa-globe"></i>website:</label>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" id="website"
												name="website" value="${user.website}" required
												readonly="readonly" onchange="onWebsite()"> <span
												id="errorWebsite"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- Present Place -->
								<div class="col-md-6">
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="presentPlace" class="form-label"><i
												class="fa-regular fa-building"></i>Address:</label>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" id="address"
												name="address" value="${user.address}" required
												readonly="readonly">
										</div>
									</div>
								</div>
								<!-- Pincode Place -->
								<div class="col-md-6">
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="pincode" class="form-label"><i
												class="fa-regular fa-building"></i>Pin Code:</label>
										</div>
										<div class="col-md-7">
											<input type="text" class="form-control" id="pincode"
												name="pincode" value="${user.pincode}"
												onblur="validatePincode()" required readonly="readonly" />
											<span id="errorpincode" style="color: red;"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-8">
					<c:forEach items="${errors}" var="e">
						<div class="text-center">
							<span style="color: red;">${e.message}</span>
						</div>
					</c:forEach>
					<div class="text-center">
						<span style="color: green;">${message}</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12 text-center">
					<div class="text-center">
						<!-- Wrapping buttons in a div with text-center class -->
						<button type="button" class="btn btn-primary" id="editButton">Edit</button>
						<button id="button" type="submit" class="btn btn-success"
							disabled="disabled">Submit</button>
					</div>
				</div>
			</div>
		</form>
	</div>



	<script>
		document
				.getElementById('editButton')
				.addEventListener(
						'click',
						function() {
							var inputs = document
									.querySelectorAll('#userProfileForm input:not([name="email"])');
							for (var i = 0; i < inputs.length; i++) {
								inputs[i].readOnly = false;
							}
							document.getElementById('editButton').disabled = true;
							document.getElementById('button').disabled = false;
							document.getElementById('uploadButtonWrapper').style.display = 'block';
						});

		const newPhotoInput = document.getElementById('newPhoto');
		const uploadLabel = document.getElementById('uploadLabel');

		newPhotoInput.addEventListener('change', function() {
			if (newPhotoInput.files.length > 0) {
				const fileName = newPhotoInput.files[0].name;
				uploadLabel.textContent = fileName;
			} else {
				uploadLabel.textContent = 'Upload New Photo';
			}
		});
	</script>
	<script>
		function previewNewPhoto(event) {
			var file = event.target.files[0];

			var reader = new FileReader();

			reader.onload = function(e) {
				document.getElementById('userPhoto').src = e.target.result;
			};

			reader.readAsDataURL(file);
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
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var email = "${email}";
			var userName = email.substring(0, email.indexOf('@')); // Extracting name from email
			document.getElementById("userName").textContent = userName; // Setting user name in the span element
		});
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
