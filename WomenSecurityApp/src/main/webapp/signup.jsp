<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sign Up</title>
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
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: Raleway, sans-serif;
}

 body {
  background: linear-gradient(90deg, #E6E6FA, #B0C4DE);
     /* background: linear-gradient(90deg, #C7C5F4, #776BCC); */
} 

.registration-form {
	padding: 50px 0;
	
}

.registration-form form {
background: linear-gradient(135deg, #87CEEB, #4169E1, #FF69B4, #87CEFA, #FFC0CB);
	background-color: #fff;
	max-width: 600px;
	margin: auto;
	padding: 50px 70px;
	border-top-left-radius: 30px;
	border-top-right-radius: 30px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .form-icon {
	text-align: center;
	background-color: #5891ff;
	border-radius: 50%;
	font-size: 40px;
	color: white;
	width: 100px;
	height: 100px;
	margin: auto;
	margin-bottom: 50px;
	line-height: 100px;
}

.registration-form .item {
	border-radius: 20px;
	margin-bottom: 25px;
	padding: 10px 20px;
}

.registration-form .create-account {
	border-radius: 30px;
	padding: 10px 20px;
	font-size: 18px;
	font-weight: bold;
	background-color: hotpink;
	border: none;
	color: white;
	margin-top: 20px;
}

.registration-form .social-media {
	max-width: 600px;
background: linear-gradient(135deg, #87CEEB, #4169E1, #FF69B4, #87CEFA, #FFC0CB);
	margin: auto;
	padding: 35px 0;
	text-align: center;
	border-bottom-left-radius: 30px;
	border-bottom-right-radius: 30px;
	color: black;
	border-top: 1px solid #dee9ff;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
}

.registration-form .social-icons {
	margin-top: 30px;
	margin-bottom: 16px;
}

.registration-form .social-icons a {
	font-size: 23px;
	margin: 0 3px;
	color: white;
	border: 1px solid;
	border-radius: 50%;
	width: 45px;
	display: inline-block;
	height: 45px;
	text-align: center;
	background-color: hotpink;
	line-height: 45px;
}

.registration-form .social-icons a:hover {
	text-decoration: hotpink;
	opacity: 0.6;
}

@media ( max-width : 576px) {
	.registration-form form {
		padding: 50px 20px;
	}
	.registration-form .form-icon {
		width: 70px;
		height: 70px;
		font-size: 30px;
		line-height: 70px;
	}
}

.navbar {
	background-color:skyblue;
}

.nav-link {
	color: white;
	background-color: hotpink;
	border-radius: 15px;
	margin: 10px;
}

.nav-link:hover {
	background-color: deeppink;
	border-style: double;
	border-radius: 25px;
}

.icon{
	color: deeppink;
}
h2{
text-align: center;
}
.navbar-brand img {
    background-color: transparent;
    
}

</style>
</head>
<body>
	<header class="fixed-top">
		<nav class="navbar navbar-expand-lg  fixed-top">
			<a class="navbar-brand" href="#"> <img src="womenlogo.jpeg"
				alt="logo" width="70" height="40" class="d-inline-block align-text rounded-circle">
			</a>
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
						href="index.jsp">Home</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="signin.jsp">SignIn</a></li>
					<li class="nav-item"><a class="nav-link" href="signup.jsp">SignUp</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<br>
	<br>
	<br>
	<div class="registration-form">
		<form action="save" method="post" id="registrationForm">
			<h2>User Registration Form</h2>
			<div class="form-icon">
				<span><i class="icon icon-user"></i></span>
			</div>
			<div class="mb-3">
				<label for="userName" class="form-label"><i
					class="fa-solid fa-user"></i>UserName</label> <input type="text"
					class="form-control" id="userName" name="userName"
					placeholder="Enter username" required onblur="onName()" /> <span
					id="erroruserName" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="aadharcardnumber" class="form-label"><i
					class="fa-solid fa-pencil"></i>AadharCard Number</label> <input type="text"
					class="form-control" id="aadharcardnumber" name="aadharcardnumber"
					placeholder="Enter Aadhar card number" required
					onchange="validateAadharCardNumber()" /> <span
					id="erroraadharcardnumber" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="birthdate" class="form-label"><i
					class="fa-solid fa-cake-candles"></i>BirthDate</label> <input type="date"
					id="birthdate" class="form-control" name="birthdate" required
					onblur="validateBirthdate()" /> <span id="errorbirthdate"
					style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="contactNumber" class="form-label"><i
					class="fa-solid fa-phone"></i>Contact Number</label> <input type="tel"
					class="form-control" id="contactNumber" name="contactNumber"
					placeholder="Enter contact number" required
					onblur="validateContactNumber()" /> <span id="errorContactNumber"
					style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="altContactNumber" class="form-label"><i
					class="fa-solid fa-phone"></i>Alternative Contact Number</label> <input
					type="tel" class="form-control" id="altContactNumber"
					name="altContactNumber"
					placeholder="Enter alternative contact number" required
					onblur="validateAltContactNumber()" /> <span
					id="erroraltContactNumber" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label"><i
					class="fa-regular fa-envelope"></i>Email</label> <input type="email"
					class="form-control" id="email" name="email"
					placeholder="Enter email" required onblur="validateEmail()" /> <span
					id="erroremail" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label class="form-label">Are you working?</label>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="working"
						id="workingYes" value="yes" required="required"> <label
						class="form-check-label" for="workingYes">Yes</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="working"
						id="workingNo" value="no" required="required"> <label
						class="form-check-label" for="workingNo">No</label>
				</div>
			</div>
			<div class="mb-3">
				<label for="country" class="form-label"><i
					class="fa-solid fa-globe"></i>Country</label> <input type="text"
					class="form-control" id="country" name="country" value="India"
					readonly />
			</div>
			<div class="mb-3">
				<label for="states" class="form-label"><i
					class="fa-solid fa-city"></i>State</label> <select class="form-select"
					id="states" name="state" required>
					<option value="">Select State</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="presentPlace" class="form-label"><i
					class="fa-regular fa-building"></i>Present Place</label> <input type="text"
					class="form-control" id="presentPlace" name="presentPlace"
					placeholder="Enter present place" onblur="validatePresentPlace()"
					required /> <span id="errorPresentPlace" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="permanentPlace" class="form-label"><i
					class="fa-solid fa-house"></i>Permanent Place</label> <input type="text"
					class="form-control" id="permanentPlace" name="permanentPlace"
					placeholder="Enter permanent place"
					onblur="validatePermanentPlace()" required /> <span
					id="errorPermanentPlace" style="color: red;"></span>
			</div>
			<div class="mb-3">
				<label for="pincode" class="form-label"><i
					class="fa-solid fa-location-dot"></i>Pin Code</label> <input type="text"
					class="form-control" id="pincode" name="pincode"
					placeholder="Enter pin code" required onblur="validatePincode()" />
				<span id="errorpincode" style="color: red;"></span>
			</div>
			<div class="form-group">
				<button type="submit" id="button"
					class="btn btn-block create-account" disabled>Create
					Account</button>
			</div>
			<%
			String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
			%>
			<p style="color: red;"><%=errorMessage%></p>
			<%
			}
			%>
		</form>
		<div class="social-media">
			<h5>Sign up with social media</h5>
			<div class="social-icons">
				<a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
				<a href="#"><i class="icon-social-google" title="Google"></i></a> <a
					href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
			</div>
		</div>
	</div>
	<script>
    function onName() {
        var userName = document.getElementById("userName").value.trim();

        var isValidUserName = /^[A-Za-z]{3,25}$/.test(userName);

        if (isValidUserName) {
            document.getElementById("erroruserName").innerHTML = "";
            document.getElementById("button").disabled = false; 
        } else {
            document.getElementById("erroruserName").innerHTML = "Username must be between 3 and 25 alphabetic characters";
            document.getElementById("button").disabled = true; 
        }
    }
function validateContactNumber() {
    var number = document.getElementById("contactNumber").value;
    var numberRegex = /^[0-9]{10}$/;
    if (numberRegex.test(number)) {
        document.getElementById("errorContactNumber").innerHTML = "";
        document.getElementById("button").disabled = false;
    } else {
        document.getElementById("errorContactNumber").innerHTML = "Enter 10 digits number";
        document.getElementById("button").disabled = true;
    }
}

function validateAltContactNumber() {
	var number = document.getElementById("contactNumber").value;
    var altNumber = document.getElementById("altContactNumber").value;
    var numberRegex = /^[0-9]{10}$/;
    if (numberRegex.test(altNumber) && number !== altNumber) {
        document.getElementById("erroraltContactNumber").innerHTML = "";
        document.getElementById("button").disabled = false;
    } else {
        document.getElementById("erroraltContactNumber").innerHTML = number === altNumber ? "Contact and alternate number cannot be same" : "Enter 10 digits number";
        document.getElementById("button").disabled = true;
    }
}

function validateAadharCardNumber() {
    var aadharNumber = document.getElementById("aadharcardnumber").value;
    var aadharRegex = /^\d{12}$/; // Corrected regex
    if (aadharRegex.test(aadharNumber)) {
        document.getElementById("erroraadharcardnumber").innerHTML = "";
        document.getElementById("button").disabled = false;
    } else {
        document.getElementById("erroraadharcardnumber").innerHTML = "Aadhar card number must be 12 digits";
        document.getElementById("button").disabled = true;
    }
}

function validateEmail() {
    var email = document.getElementById("email").value;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (emailRegex.test(email)) {
        document.getElementById("erroremail").innerHTML = "";
        document.getElementById("button").disabled = false;
    } else {
        document.getElementById("erroremail").innerHTML = "Invalid email format";
        document.getElementById("button").disabled = true;
    }
}

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

function validatePresentPlace() {
    var presentPlace = document.getElementById("presentPlace").value.trim();
    var isValidPresentPlace = /^[A-Za-z\s]{3,100}$/.test(presentPlace);
    document.getElementById("errorPresentPlace").innerHTML = isValidPresentPlace ? "" : "Present Place must be between 3 and 100 characters and can only contain letters and spaces.";
    document.getElementById("button").disabled = !isValidPresentPlace;
}

function validatePermanentPlace() {
    var permanentPlace = document.getElementById("permanentPlace").value.trim();
    var isValidPermanentPlace = /^[A-Za-z\s]{3,100}$/.test(permanentPlace);
    document.getElementById("errorPermanentPlace").innerHTML = isValidPermanentPlace ? "" : "Permanent Place must be between 3 and 100 characters and can only contain letters and spaces.";
    document.getElementById("button").disabled = !isValidPermanentPlace;
}
function validateBirthdate() {
    var birthdateInput = document.getElementById("birthdate");
    var birthdate = new Date(birthdateInput.value);
    var errorSpan = document.getElementById("errorbirthdate");
    var today = new Date();
    var age = today.getFullYear() - birthdate.getFullYear();
    var m = today.getMonth() - birthdate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthdate.getDate())) {
        age--;
    }

    // Check if age is above 14 and realistic
    if (age > 14 && age < 120) {
        errorSpan.innerHTML = "";
        document.getElementById("button").disabled = false;
    } else if (age >= 120) {
        // Handling unrealistic age
        errorSpan.innerHTML = "Please enter a realistic birthdate.";
        document.getElementById("button").disabled = true;
    } else {
        errorSpan.innerHTML = "You must be above 14 years old.";
        document.getElementById("button").disabled = true;
    }
}
</script>

	<script>
  const indianStates = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  const selectElement = document.getElementById("states");

  indianStates.forEach(state => {
    const option = document.createElement("option");
    option.value = state.toLowerCase().replace(/\s+/g, ''); // Remove spaces and convert to lowercase
    option.textContent = state;
    selectElement.appendChild(option);
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
