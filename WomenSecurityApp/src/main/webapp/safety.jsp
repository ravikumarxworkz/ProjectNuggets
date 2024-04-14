<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Safety page</title>
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

.card {
	background-color: lightseagreen;
	box-sizing: border-box;
	box-shadow: 0px 10px 5px rgba(115, 148, 194, 0.1);
}

body {
	background-color: #f8f9fa;
}

.container {
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-top: 50px;
}

.point {
	margin-bottom: 30px;
}

h5 {
	font-style: italic;
	text-transform: uppercase;
}

.card-title {
	font-weight: bold;
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
	<br>
	<div class="container">
		<div class="row ms-5">
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTl8OjX8ndAltTDBYeLz9p-IS8Va2NOYj63lGz4712NUseTIMFJ"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Trust Your Instincts</h5>
					<p class="card-text">Always trust your gut feeling. If you feel
						uncomfortable or sense danger, remove yourself from the situation
						as soon as possible.</p>
				</div>
			</div>

			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2jjT0pE-YLs2fDBv2zN8lsExXLNT80i__Afhza5XVeg4ReXZz"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Stay Aware of Your Surroundings</h5>
					<p class="card-text">Be alert and observant of your
						surroundings, especially in unfamiliar or isolated areas. Avoid
						distractions like using your phone excessively.</p>
				</div>
			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTG7Aqgcim5VH8wnZaIbK6wTrfJHbujxzT44lscyNSuXckPSTgG"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Travel in Groups</h5>
					<p class="card-text">When possible, travel with friends or in
						groups, especially at night. There is safety in numbers.</p>
				</div>
			</div>
		</div>
		<br> <br>
		<div class="row ms-5">
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiRB2oyIfBar8La6vVno_pmd_8_kmq5BbEshkoRRikFXAl9rxT"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Learn Self-Defense</h5>
					<p class="card-text">Consider taking self-defense classes to
						empower yourself with skills to protect yourself if needed.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS7Ck5qwoj_zGLThlgFUGjN9kQPBs0UV3sqDE_amPF464KA6KNT"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Trustworthy Contacts</h5>
					<p class="card-text">Share your whereabouts and travel plans
						with trusted friends or family members. Use safety apps that allow
						them to track your location in real-time.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2hKARwaTi-Jso2uXeWuPzj4QSOFj6LJ6pB5_ToHYQ8BHAf-AN"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Emergency Contacts</h5>
					<p class="card-text">Keep a list of emergency contacts handy,
						including local authorities, trusted friends, and hotlines for
						assistance.</p>
				</div>
			</div>
		</div>
		<br> <br>
		<div class="row ms-5">
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcY1N84vxY8VwRF9i3ORfWccsGOAIhUINNjs_AHFPuvnR7NElZ"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Escaping Assault</h5>
					<p class="card-text">Learn self-defense techniques, carry a
						whistle or personal alarm, and create a safety plan with trusted
						contacts. If attacked, aim for vulnerable areas, scream for help,
						and flee to a safe location.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQeZHtLeh9zquMrFeAqgn6xzS4q5H_R1JkRt57vLJb-mnkqVuxU"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Preventing Ragging</h5>
					<p class="card-text">Stay connected with friends, avoid
						isolated areas, and be assertive. If confronted, firmly decline
						participation, seek help from authorities, and report incidents
						immediately.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRB7O_CSGYmpqG_fHc6tBLNJ9zv8ve6duxTFCUglL2HGjfehxkX"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Avoiding Rape</h5>
					<p class="card-text">Stay in well-lit areas, avoid walking
						alone at night, trust your instincts, and carry personal safety
						devices like pepper spray or alarms. If approached, yell loudly,
						attract attention, and seek help.</p>
				</div>
			</div>
		</div>
		<br> <br>
		<div class="row ms-5">
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTm2_pjDjudC8cMxO7Rt9JuVMEZ3SUVzuvaCJBVnrZame0w92OT"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Handling Stalking</h5>
					<p class="card-text">Document incidents, change routines, and
						inform trusted individuals. Utilize safety apps for tracking and
						alerting, seek legal assistance if necessary, and obtain a
						restraining order if the situation escalates.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img
					src="data:image/jpeg;base64,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"
					height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Dealing with Harassment</h5>
					<p class="card-text">Assert boundaries, firmly confront
						perpetrators, and keep evidence of harassment. Report incidents to
						authorities or HR departments, seek support from counselors or
						support groups, and explore legal options.</p>
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
