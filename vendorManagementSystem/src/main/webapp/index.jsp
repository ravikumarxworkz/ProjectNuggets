<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>vendor management</title>
<script type="text/javascript">
	// Disable the back button
	history.pushState(null, null, location.href);
	window.onpopstate = function() {
		history.go(1);
	};
</script>
<!-- Bootstrap 5.3.2 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Favicon -->
<link rel="shortcut icon"
	href="https://www.svgrepo.com/show/530572/accelerate.svg"
	type="image/x-icon">

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

.container {
	width: 80%; /* Custom width */
	max-width: 800px; /* Maximum width */
	padding: 20px; /* Increased padding for better spacing */
	border: 3px solid white;
	border-radius: 5px;
	text-align: center;
	background-position: center;
	height: 400px;
	font-family: Arial, sans-serif;
}

.container h3 {
	font-size: 18px;
	margin-top: 0; /* Remove default margin for h3 */
	padding-top: 10px; /* Add padding-top for spacing */
}

.incident {
	margin-bottom: 10px;
}

p {
	font-weight: bolder;
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
			<button class="navbar-toggler" style="color: white;" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse  justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="logInPage">LogIn</a></li>
					<li class="nav-item"><a class="nav-link" href="registerPage">Register</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>

	<div class="container" id="vendorAnnouncements">
		<h3
			style="text-align: center; color: white; font-size: bold; background-color: blueviolet;">Latest
			Vendor Announcements</h3>
		<marquee behavior="scroll" direction="up" onmouseover="this.stop();"
			onmouseout="this.start();" scrolldelay="250" position="absolute"
			overflow="hidden" height="300px">
			<div id="vendorAnnouncementsContent"></div>
		</marquee>

	</div>
	<br>
	<br>
	<footer class="text-center fixed-bottom">
		<div class="text-center p-3" style="background-color: black;">

			<a class="btn btn-primary btn-floating m-1"
				style="background-color: #3b5998" href="https://www.facebook.com/"
				target="_blank" role="button"><i class="fab fa-facebook-f"></i></a>
			<a class="btn btn-primary btn-floating m-1"
				style="background-color: #55acee" href="https://twitter.com/"
				target="_blank" role="button"><i class="fab fa-twitter"></i></a> <a
				class="btn btn-primary btn-floating m-1"
				style="background-color: #dd4b39" href="https://mail.google.com/"
				target="_blank" role="button"><i class="fab fa-google"></i></a> <a
				class="btn btn-primary btn-floating m-1"
				style="background-color: #ac2bac" href="https://www.instagram.com/"
				target="_blank" role="button"><i class="fab fa-instagram"></i></a> <a
				class="text-white" href="http://women's-security.com"
				target="_blank">© 2023 Copyright:vendorMangement.com</a>
		</div>
	</footer>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// Function to load vendor announcements
							function loadVendorAnnouncements() {
								$
										.ajax({
											type : "GET",
											url : "getVendorAnnouncements", // Replace with your server endpoint
											dataType : "json",
											success : function(announcements) {
												var content = ""; // Initialize empty content
												if (announcements
														&& announcements.length > 0) {
													for (var i = 0; i < announcements.length; i++) {
														var announcement = announcements[i];
														content += "<div class='incident'>"
																+ "<strong>"
																+ announcement.title
																+ ":</strong> "
																+ "<p>"
																+ announcement.message
																+ "</p>"
																+ "</div>";
													}
												} else {
													content = "<p>No vendor announcements available.</p>";
												}
												$("#vendorAnnouncementsContent")
														.html(content); // Set content
											},
											error : function() {
												$("#vendorAnnouncementsContent")
														.html(
																"<p>Failed to fetch vendor announcements.</p>");
											}
										});
							}

							// Call the function to load vendor announcements when the page loads
							loadVendorAnnouncements();
						});
	</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

