<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>profile view page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="style.css">
<style>
.card {
	background-image: url('viewpageiamge.avif');
	background-size: cover;
	background-position: center;
	box-sizing: border-box;
	box-shadow: 0px 10px 5px rgba(115, 148, 194, 0.1);
	color: white;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top">
		<a class="navbar-brand" href="#"> <img src="womenlogo.jpeg"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<c:set var="user" value="${userProfile}" />
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${user.email}"> <input
				type="hidden" name="contactNumber" value="${user.contactNumber}">
			<button type="submit" id="nav-btn" class="dropdown-item mr-2"
				name="action" value="home">Home</button>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</form>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNavDropdown">
			<form action="actionServlet" method="post" class="d-flex">
				<c:set var="user" value="${userProfile}" />
				<input type="hidden" name="email" value="${user.email}"> <input
					type="hidden" name="contactNumber" value="${user.contactNumber}">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <span
							class="user-display"><i class="fas fa-user"></i>
								${user.email}</span>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink">
							<button type="submit" class="dropdown-item" name="action"
								value="view">View</button>
							<button type="submit" class="dropdown-item" name="action"
								value="edit">Update</button>
							<button type="submit" class="dropdown-item" name="action"
								value="delete">Delete Account</button>
							<button type="submit" class="dropdown-item" name="action"
								value="logout">Logout</button>
						</div></li>
				</ul>
			</form>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card mt-5">
					<div class="card-header text-center">
						<h3>User Profile</h3>
					</div>
					<div class="card-body">
						<c:set var="user" value="${userProfile}" />
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="userName" class="form-label"><i
									class="fa-solid fa-user"></i>UserName:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="userName"
									value="${user.name}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="aadharcardnumber" class="form-label"><i
									class="fa-solid fa-pencil"></i>Aadhar Card Number:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="aadharcardnumber"
									value="${user.aadharCardNumber}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="birthdate" class="form-label"><i
									class="fa-solid fa-cake-candles"></i>Birth Date:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="birthdate"
									value="${user.dateOfBirth}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="contactNumber" class="form-label"><i
									class="fa-solid fa-phone"></i>Contact Number:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="contactNumber"
									name="contactNumber" value="${user.contactNumber}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="altContactNumber" class="form-label"><i
									class="fa-solid fa-phone"></i>Alternative Contact Number:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="altContactNumber"
									value="${user.altContactNumber}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="email" class="form-label"><i
									class="fa-regular fa-envelope"></i>Email:</label>
							</div>
							<div class="col-md-7">
								<input type="email" class="form-control" id="email" name="email"
									value="${user.email}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="working" class="form-label">Are you working?</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="working"
									value="${user.working}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="country" class="form-label"><i
									class="fa-solid fa-globe"></i>Country:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="country"
									value="${user.country}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="states" class="form-label"><i
									class="fa-solid fa-city"></i>State:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="states"
									value="${user.state}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="presentPlace" class="form-label"><i
									class="fa-regular fa-building"></i>Present Place:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="presentPlace"
									value="${user.presentPlace}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="permanentPlace" class="form-label"><i
									class="fa-solid fa-house"></i>Permanent Place:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="permanentPlace"
									value="${user.permanentPlace}" readonly />
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-5">
								<label for="pincode" class="form-label"><i
									class="fa-solid fa-location-dot"></i>Pin Code:</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="pincode"
									value="${user.pincode}" readonly />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
