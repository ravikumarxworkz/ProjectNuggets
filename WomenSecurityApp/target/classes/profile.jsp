<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" integrity="..." crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="shortcut icon" href="voter.svg" type="image/x-icon" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="voter.svg" type="image/x-icon" />
Bootstrap CSS
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

Bootstrap JS
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->
</head>
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

/* Adjust hover styles */
.dropdown-item:hover,
.dropdown-item:focus {
    background-color: deeppink;
    color: #fff;
}

/* Adjust focus styles */
.dropdown-menu a.dropdown-item:focus,
.dropdown-menu a.dropdown-item:hover {
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
</style>
<body>
	<nav class="navbar navbar-expand-lg  fixed-top">
		<a class="navbar-brand" href="#"> <img
			src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQvNZf_pBtDBBjQo5rLJdEWAbip3qXggktTl_04DtYf6FWeX-b0"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${email}">
			<button type="submit" id="nav-link" name="action" value="safety">safety
				Tips</button>
			<button type="submit" id="nav-link" name="action" value="complaint">complaint</button>
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

	<div class="container" style="min-height: 100vh; margin-top: 150px;">
		<div class="content mt-3 text-center">
		<%-- 	<h3 style="color: deeppink; font-weight: bolder;">Welcome
				${email}</h3> --%>
		</div>

		<div class="position-relative mt-5">
			<div class="start--15 mt-2 mx-auto"
				style="background-color: #f2f2f2; padding: 10px; border-radius: 8px; width: 80%; text-align: center;">
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

				<%
				Integer complaintNumber = (Integer) request.getAttribute("complaintNumber");
				%>
				<%
				if (complaintNumber != null) {
				%>
				<p style="color: black; font-weight: bold;">
					Complaint number is: <span style="color: red;"><%=complaintNumber%></span>
				</p>
				<%
				}
				%>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>
