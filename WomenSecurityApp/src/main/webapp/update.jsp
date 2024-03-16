<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>update page</title>
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
	background-image: url('update.jpg');
	background-size: cover;
	background-position: center;
	box-shadow: 0px 10px 5px rgba(115, 148, 194, 0.1);
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg  fixed-top">
		<a class="navbar-brand" href="#"> <img src="womenlogo.jpeg"
			alt="logo" width="70" height="40" class="d-inline-block align-text rounded-circle">
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
						<h3>update your Profile</h3>
					</div>
					<div class="card-body">
						<form action="actionServlet" method="post">
							<c:set var="user" value="${userProfile}" />
							<!-- Existing input fields with name attributes for submission -->
							<!-- Example for one input field, apply similar changes for others -->
							<input type="hidden" class="form-control" name="id" id="id"
								value="${user.id}" />
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="userName" class="form-label"><i
										class="fa-solid fa-user"></i>UserName:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" name="name"
										id="userName" value="${user.name}" onblur="onName()" /> <span
										id="erroruserName" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="aadharcardnumber" class="form-label"><i
										class="fa-solid fa-pencil"></i>Aadhar Card Number:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="aadharcardnumber"
										name="aadharCardNumber" value="${user.aadharCardNumber}"
										onchange="validateAadharCardNumber()" /> <span
										id="erroraadharcardnumber" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="birthdate" class="form-label"><i
										class="fa-solid fa-cake-candles"></i>Birth Date:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="birthdate"
										name="dateOfBirth" value="${user.dateOfBirth}"
										onblur="validateBirthdate()" /> <span id="errorbirthdate"
										style="color: red;"></span>

								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="contactNumber" class="form-label"><i
										class="fa-solid fa-phone"></i>Contact Number:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="contactNumber"
										name="contactNumber" value="${user.contactNumber}"
										onblur="validateContactNumber()" /> <span
										id="errorContactNumber" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="altContactNumber" class="form-label"><i
										class="fa-solid fa-phone"></i>Alternative Contact Number:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="altContactNumber"
										name="altContactNumber" value="${user.altContactNumber}"
										onblur="validateAltContactNumber()" /> <span
										id="erroraltContactNumber" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="email" class="form-label"><i
										class="fa-regular fa-envelope"></i>Email:</label>
								</div>
								<div class="col-md-7">
									<input type="email" class="form-control" id="email"
										name="email" value="${user.email}" readonly="readonly" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="working" class="form-label">Are you
										working?</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="working"
										name="working" value="${user.working}" required="required" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="country" class="form-label"><i
										class="fa-solid fa-globe"></i>Country:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="country"
										name="country" value="${user.country}" readonly="readonly" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="states" class="form-label"><i
										class="fa-solid fa-city"></i>State:</label>
								</div>
								<div class="col-md-7">
									<select class="form-select" id="states" name="state" >
										<option value="">${user.state}</option>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="presentPlace" class="form-label"><i
										class="fa-regular fa-building"></i>Present Place:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="presentPlace"
										name="presentPlace" value="${user.presentPlace}"
										onblur="validatePresentPlace()" required /> <span
										id="errorPresentPlace" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="permanentPlace" class="form-label"><i
										class="fa-solid fa-house"></i>Permanent Place:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="permanentPlace"
										name="permanentPlace" value="${user.permanentPlace}"
										onblur="validatePermanentPlace()" required /> <span
										id="errorPermanentPlace" style="color: red;"></span>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-5">
									<label for="pincode" class="form-label"><i
										class="fa-solid fa-location-dot"></i>Pin Code:</label>
								</div>
								<div class="col-md-7">
									<input type="text" class="form-control" id="pincode"
										name="pincode" value="${user.pincode}"
										onblur="validatePincode()" /> <span id="errorpincode"
										style="color: red;"></span>
								</div>
							</div>
							<input type="hidden" name="action" value="update" />
							<!-- Submit button for the form -->
							<div class="row">
								<div class="col text-center">
									<button type="submit" id="button" class="btn btn-primary">Update
										Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>
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

function validateAadharCardNumber(){
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
