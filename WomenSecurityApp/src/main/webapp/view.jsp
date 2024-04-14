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
<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	font-family: Arial, sans-serif;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

.navbar {
	background-color: blueviolet;
}

#nav-btn {
	color: white;
	background-color: hotpink;
	border-radius: 15px;
	margin: 10px;
}

#nav-btn:hover {
	background-color: deeppink;
	border-style: double;
	border-radius: 25px;
}

.user-display {
	color: white;
	font-weight: bold;
}

.user-display:hover {
	font-weight: bold;
	text-transform: uppercase;
}

.user-display i {
	margin-right: 5px;
	color: deeppink;
}

.card {
	background-image: url('viewpageiamge.avif');
	background-size: cover;
	background-position: center;
	box-sizing: border-box;
	box-shadow: 0px 10px 5px rgba(115, 148, 194, 0.1);
	color: white;
}

.dropdown-item {
	color: #333;
	background-color: #fff;
}

.dropdown-item:hover, .dropdown-item:focus {
	color: #fff;
	background-color: deeppink;
}

.dropdown-menu a.dropdown-item:focus, .dropdown-menu a.dropdown-item:hover
	{
	background-color: deeppink;
	color: #fff;
	border-color: #007bff;
}

.dropdown-item {
	padding: 0.5rem 1rem;
}

.card-header, .card-body, .form-label {
	background-color: #007bff;
	color: #fff;
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
	width: 150px; /* Adjust as needed */
	height: 150px; /* Adjust as needed */
	border-radius: 50%; /* Makes the image round */
	overflow: hidden; /* Ensures the image stays within the circle */
	display: inline-block;
	border: 2px solid #ccc; /* Border color */
}

/* CSS to center the image within the circle */
.round-image img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* Ensures the image fills the circle */
}

.profile-photo {
	width: 50px; /* Adjust as needed */
	height: 50px; /* Adjust as needed */
	border-radius: 50%; /* Makes the image round */
	margin-right: 5px; /* Adds space between the image and email */
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top">
		<a class="navbar-brand" href="#"> <img
			src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQvNZf_pBtDBBjQo5rLJdEWAbip3qXggktTl_04DtYf6FWeX-b0"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${email}">
			<button type="submit" id="nav-btn" class="dropdown-item mr-2"
				name="action" value="profile">Profile</button>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</form>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNavDropdown">
			<form action="actionServlet" method="post" class="d-flex">
				<input type="hidden" name="email" value="${email}">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <span
							class="user-display"> <img class="profile-photo"
								src="display?email=${email}" alt="User Photo">
								${email}
						</span>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink">
							<button type="submit" class="dropdown-item" name="action"
								value="view">View</button>
							<button type="submit" class="dropdown-item" name="action"
								value="edit">Update</button>
							<button type="submit" class="dropdown-item" name="action"
								value="changePassword">Change Password</button>
							<button type="submit" class="dropdown-item" name="action"
								value="delete">Delete Account</button>
							<button type="submit" class="dropdown-item" name="action"
								value="logout">logout</button>
						</div></li>
				</ul>
			</form>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
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
                            <label for="userName" class="form-label"><i class="fa-solid fa-user"></i>User Name:</label>
                        </div>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="userName" value="${user.name}" readonly />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="email" class="form-label"><i class="fa-solid fa-phone"></i>Email:</label>
                        </div>
                        <div class="col-md-9">
                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" readonly />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="contactNumber" class="form-label"><i class="fa-solid fa-phone"></i>Contact Number:</label>
                        </div>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="contactNumber" name="contactNumber" value="${user.contactNumber}" readonly />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- User Image -->
        <div class="col-md-4">
            <div class="card mt-5">
                <div class="card-header text-center">
                    <h3>User Photo</h3>
                </div>
                <div class="card-body text-center">
                    <div class="round-image">
                        <img src="http://localhost:8080/WomenSecurityApps/display?email=${user.email}" alt="User Photo">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Additional Details -->
    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">
                    <h3>Additional Details</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Aadhar Card Number -->
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <label for="aadharcardnumber" class="form-label"><i class="fa-solid fa-pencil"></i>Aadhar Card Number:</label>
                                </div>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="aadharcardnumber" value="${user.aadharCardNumber}" readonly />
                                </div>
                            </div>
                            <!-- Country -->
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <label for="country" class="form-label"><i class="fa-solid fa-globe"></i>Country:</label>
                                </div>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="country" value="${user.country}" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Alternative Contact Number -->
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <label for="altContactNumber" class="form-label"><i class="fa-solid fa-phone"></i>Alternative Contact Number:</label>
                                </div>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="altContactNumber" value="${user.altContactNumber}" readonly />
                                </div>
                            </div>
                            <!-- State -->
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <label for="states" class="form-label"><i class="fa-solid fa-city"></i>State:</label>
                                </div>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="states" value="${user.state}" readonly />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Present Place -->
                        <div class="col-md-6">
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <label for="presentPlace" class="form-label"><i class="fa-regular fa-building"></i>Present Place:</label>
                                </div>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="presentPlace" value="${user.presentPlace}" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Pincode -->
                            <div class="row mb-3">
                                <div class="col-md-5">
                                    <label for="pincode" class="form-label"><i class="fa-solid fa-location-dot"></i>Pin Code:</label>
                                </div>
                                <div class="col-md-7">
                                    <input type="text" class="form-control" id="pincode" name="pincode" value="${user.pincode}" onblur="validatePincode()" />
                                    <span id="errorpincode" style="color: red;"></span>
                                </div>
                            </div>
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
