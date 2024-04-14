<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Women security</title>
<script type="text/javascript">
    // Disable the back button
    history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="shortcut icon"
	href="https://www.svgrepo.com/show/530572/accelerate.svg"
	type="image/x-icon" style="color: aliceblue;">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
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

.container {
    font-family: Arial, sans-serif;
    max-width: 600px;
    padding: 10px; /* Reduced padding */
    border: 3px solid white;
    border-radius: 5px ;
    text-align: left;
    background-size: cover;
    background-position: center;
    height: 380px;
    
}

.container h3 {
    font-size: 18px; /* Reduced font size for headings */
}

.container p {
    font-size: 14px; /* Reduced font size for paragraphs */
}


.incident {
	margin-bottom: 10px;
}

p {
	font-weight: bolder;
}

.navbar {
	background-color: blueviolet;
}

.nav-link {
	color: white;
	font-size: 20px;
	font-weight: bold;
}

.nav-link:hover {
	background-color: deeppink;
	border-style: double;
	border-radius: 25px;
}

.Report {
	font-style: italic;
	color: purple;
}

strong {
	color: red;
}




.round-button {
	display: inline-block;
	width: 50px;
	height: 50px;
	border: 2px solid #f5f5f5;
	border-radius: 50%;
	background-color: white;
	color: blueviolet;
	text-align: center;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0 0 3px gray;
	/* Adjustments for centering text */
	line-height: 50px; /* Same as height */
	vertical-align: middle;
}

.round-button:hover {
	background-color: RED;
	text-decoration: none;
}
</style>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg">
			<a class="navbar-brand" href="#"> <img
				src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQvNZf_pBtDBBjQo5rLJdEWAbip3qXggktTl_04DtYf6FWeX-b0"
				alt="logo" width="70" height="40"
				class="d-inline-block align-text rounded-circle">
			</a> <a id="sos-button" class="round-button" href="tel:112">SOS</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="signinPage">SignIn</a></li>
					<li class="nav-item"><a class="nav-link" href="signupPage">SignUp</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="container">
		<h3  style="text-align: center; color: white; font-size: bold; background-color:blueviolet" >Latest Women's Incidents news In India</h3>
		<marquee behavior="scroll" direction="up" onmouseover="this.stop();"
			onmouseout="this.start();" scrolldelay="250" position="absolute"
			overflow="hidden" height="300">
	   <ul>
        <li class="incident"><strong>Harassment:</strong><span class="Report">Incident in Mumbai city, Maharashtra state.</span>
            <p>Details: The victim reported being harassed by a group of individuals near [location]. The incident has been reported to the authorities, and an investigation is ongoing.</p>
        </li>
        <li class="incident"><strong>Assault:</strong><span class="Report"> Reported in Bengaluru city, Karnataka state.</span>
            <p>Details: The victim was assaulted by an unknown assailant while walking home from work. The victim sustained minor injuries and has filed a police report.</p>
        </li>
        <li class="incident"><strong>Domestic Violence:</strong> <span class="Report"> Case in Kolkata city, West Bengal state.</span>
            <p>Details: The victim reported being subjected to domestic violence by her partner. The victim has been provided with necessary support and resources to ensure her safety.</p>
        </li>
        <li class="incident"><strong>Stalking:</strong><span class="Report"> Incident reported in Hyderabad city, Telangana state.</span>
            <p>Details: The victim reported being stalked by an individual known to her. The victim has taken measures to ensure her safety and has sought assistance from the authorities.</p>
        </li>
        <li class="incident"><strong>Rape:</strong><span class="Report">Reported in Delhi city, Delhi state.</span>
            <p>Details: The incident occurred on [date]. The victim has been identified as [name], and the perpetrator is currently under investigation.</p>
        </li>
    </ul>

		</marquee>
	</div>
	<br>
    <footer class="text-center">
    <div class="text-center p-3" style="background-color: blueviolet">
     
            <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998" href="https://www.facebook.com/" target="_blank" role="button"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-primary btn-floating m-1" style="background-color: #55acee" href="https://twitter.com/" target="_blank" role="button"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-primary btn-floating m-1" style="background-color: #dd4b39" href="https://mail.google.com/" target="_blank" role="button"><i class="fab fa-google"></i></a>
            <a class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac" href="https://www.instagram.com/" target="_blank" role="button"><i class="fab fa-instagram"></i></a>
         <a class="text-white" href="http://women's-security.com" target="_blank">© 2023 Copyright:women's security.com</a>
    </div>
</footer>

	<script>
    const button = document.getElementById('sos-button');

    let pressStartTime = 0;
    let pressEndTime = 0;
    let pressDuration = 0;

    button.addEventListener('mousedown', () => {
        pressStartTime = new Date().getTime();
    });

    button.addEventListener('mouseup', () => {
        pressEndTime = new Date().getTime();
        pressDuration = pressEndTime - pressStartTime;

        if (pressDuration >= 3000) {
            const confirmed = confirm("Do you want to call emergency services?");
            if (confirmed) {
                window.location.href = button.getAttribute('href');
            }
        }
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

