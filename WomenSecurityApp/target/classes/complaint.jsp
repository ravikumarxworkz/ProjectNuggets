<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>complaint page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
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
	/* border-style: double; */
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

.complaint-form {
	background-size: cover;
	background-position: center;
	width: 400px;
	padding: 20px;
	border-radius: 10px;
	color: black;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	background-color: transparent;
}
textarea#aboutIncident { 
    height: 50px;
}

.form-group {
	margin-bottom: 10px;
}

.btn-primary {
	width: 100%;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg">
		<a class="navbar-brand" href="#"> <img
			src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQvNZf_pBtDBBjQo5rLJdEWAbip3qXggktTl_04DtYf6FWeX-b0"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${email}">
			<button type="submit" id="nav-link" name="action" value="safety">Safety
				Tips</button>
			<button type="submit" id="nav-link" name="action"
				value="complaintHistory">Complaint History</button>
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
	<div class="container">
		<div class="row">
			<%
			String complaint = (String) request.getAttribute("message");
			%>
			<%
			if (complaint != null) {
			%>
			<p style="color: black; font-weight: bold;"><%=complaint%></p>
			<%
			}
			%>

			<h4 class="text-center mb-2">Register Complaint Here!!!!</h4>
			<div
				class="col-md-5 blue-bg justify-content-center align-items-center text-center">
				<div class="mt-10">
					<img
						src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSiwaDoSWKK-8ZhoRwZ0ocWPlrezoGCbc6gdkLYMDmcvOEbbR8T"
						alt="Sample photo" class="h-45 w-100"
						style="border-top-left-radius: .25rem; border-bottom-left-radius: .35rem;">
				</div>
			</div>
			<div class="col-md-6 form-container">
				<form action="complaintSave" method="post" class="complaint-form">
					<input type="hidden" name="email" value="${email}">
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="name" name="name" required>
					</div>
					<div class="form-group">
						<label for="incidentTiming">Incident Timing:</label> <input
							type="datetime-local" class="form-control" id="incidentTiming"
							name="incidentTiming" required>
					</div>
					<div class="form-group">
						<label for="place">Place:</label> <input type="text"
							class="form-control" id="place" name="place" required>
					</div>
					<div class="form-group">
						<label for="aboutIncident">About Incident:</label>
						<textarea class="form-control" id="aboutIncident"
							name="aboutIncident" rows="3" required></textarea>
					</div>
					<div class="form-group">
						<label for="contactNumber">Contact Number:</label> <input
							type="tel" class="form-control" id="contactNumber"
							name="phoneNumber" pattern="[0-9]{10}" required> <small
							id="contactNumberHelp" class="form-text text-muted">Please
							enter a 10-digit phone number.</small>
					</div>
					<input type="hidden" name="action" value="complaintSave" />
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>

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
