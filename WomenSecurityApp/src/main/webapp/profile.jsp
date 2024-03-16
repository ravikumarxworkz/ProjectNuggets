<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="voter.svg" type="image/x-icon" />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="style.css">
</head>
<style>
body{
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}
.container {
	background-image: url('wo.png');
	background-size: cover;
	background-position: center;
}
.content {
    position: absolute;
    white-space: nowrap;
    animation: marquee 10s linear infinite;
}

@keyframes marquee {
    0% { transform: translateX(100%); }
    100% { transform: translateX(-100%); }
}
</style>
<body>
	<nav class="navbar navbar-expand-lg  fixed-top">
		<a class="navbar-brand" href="#"> <img src="womenlogo.jpeg"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a>
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${email}"> <input
				type="hidden" name="contactNumber" value="${contactNumber}">
			<button type="submit" id="nav-btn" class="dropdown-item mr-2"
				name="action" value="safety">safety</button>
			<button type="submit" id="nav-btn" class="dropdown-item mr-2"
				name="action" value="complaint">complaint?</button>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>

			</button>
		</form>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarNavDropdown">
			<form action="actionServlet" method="post">
				<input type="hidden" name="email" value="${email}"> <input
					type="hidden" name="contactNumber" value="${contactNumber}">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <span
							class="user-display"><i class="fas fa-user"></i> ${email}</span>

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
	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 100vh; margin-top: 70px;">
		   <div class="content mt-3" style="padding: 20px;">
        <h3 style="color: deeppink; font-weight: bolder;">Welcome to Women Security App</h3>
    </div>

		<div>
			<div class="position-absolute start-2 mt-5" id="welcome-message">
					<div  class="start--15 mt-2"  style="display: inline-block; background-color: #f2f2f2; padding:10px; border-radius: 8px; width: 80%;">

						<%
						String complaint = (String) request.getAttribute("complaint");
						if (complaint != null) {
						%>
						<p style="color: black;"><%=complaint%></p>
						<%
						}

						Integer complaintNumber = (Integer) request.getAttribute("complaintNumber");
						if (complaintNumber != null) {
						int complaintNumber1 = complaintNumber;
						%>
						<p style="color: black;">
							Complaint number is: <span style="color: red;"><%=complaintNumber1%></span>
						</p>
						<%
						}
						%>
						<%
						String update = (String) request.getAttribute("updateddata");
						if (update != null) {
						%>
						<p style="color: green"><%=update%></p>
						<%
						}
						%>
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
