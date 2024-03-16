<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="style.css">
<style>
.card {
	/* background-color: #7c9ca1; */
	background-color: lightseagreen;
	box-sizing: border-box;
	box-shadow: 0px 10px 5px rgba(115, 148, 194, 0.1);
}

body {
	background-color: #f8f9fa;
}

.container {
	background-color: #fff;
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
.card-title{
   font-weight: bold;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg  fixed-top">
		<a class="navbar-brand" href="#"> <img src="womenlogo.jpeg"
			alt="logo" width="70" height="40" class="d-inline-block align-text rounded-circle">
		</a>
		<form action="actionServlet" method="post" class="d-flex">
			<input type="hidden" name="email" value="${email}"> <input
				type="hidden" name="contactNumber" value="${contactNumber}">
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
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row ms-5">
			<div class="card" style="width: 18rem;">
				<img src="TRUST.jpg" height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Trust Your Instincts</h5>
					<p class="card-text">Always trust your gut feeling. If you feel
						uncomfortable or sense danger, remove yourself from the situation
						as soon as possible.</p>
				</div>
			</div>

			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img src="aware.jpeg" height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Stay Aware of Your Surroundings</h5>
					<p class="card-text">Be alert and observant of your
						surroundings, especially in unfamiliar or isolated areas. Avoid
						distractions like using your phone excessively.</p>
				</div>
			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img src="travel.jpg" height="250px" class="card-img-top" alt="...">
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
				<img src="selfdenfens.webp" height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Learn Self-Defense</h5>
					<p class="card-text">Consider taking self-defense classes to
						empower yourself with skills to protect yourself if needed.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img src="contacts.png" height="250px" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Trustworthy Contacts</h5>
					<p class="card-text">Share your whereabouts and travel plans
						with trusted friends or family members. Use safety apps that allow
						them to track your location in real-time.</p>
				</div>

			</div>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<div class="card" style="width: 18rem;">
				<img src="emergency.jpg" height="250px" class="card-img-top" alt="...">
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
				<img src="escape.jpeg" height="250px" class="card-img-top" alt="...">
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
				<img src="ragging.jpeg" height="250px" class="card-img-top" alt="...">
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
				<img src="rape.jpeg" height="250px" class="card-img-top" alt="...">
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
				<img src="stalking.png" height="250px" class="card-img-top" alt="...">
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
				<img src="harassment.jpeg" height="250px" class="card-img-top" alt="...">
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
