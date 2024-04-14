<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>profile update page</title>
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

.dropdown-item:hover,
.dropdown-item:focus {
    background-color: deeppink;
    color: #fff;
}

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
	width: 150px;
	height: 160px; 
	border-radius: 50%; 
	overflow: hidden; 
	display: inline-block;
	border: 2px solid #ccc; 
}
.round-image img {
	width: 100%;
	height: 100%;
	object-fit: cover; 
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
<div class="container">
    <form action="update" id="userProfileForm" enctype="multipart/form-data" method="post">
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
                                <input type="text" class="form-control" id="userName" name="name" value="${user.name}" onblur="onName()" required readonly /> <span id="errorUserName" style="color: red;"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <label for="email" class="form-label"><i class="fa-solid fa-envelope"></i>Email:</label>
                            </div>
                            <div class="col-md-9">
                                <input type="email" class="form-control" id="email" name="email" value="${user.email}" readonly="readonly" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <label for="contactNumber" class="form-label"><i class="fa-solid fa-phone"></i>Contact Number:</label>
                            </div>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="contactNumber" name="contactNumber" value="${user.contactNumber}" onblur="validateContactNumber()" required readonly /> <span id="errorContactNumber" style="color: red;"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- User Image -->
            <div class="col-md-4">
                <div class="card mt-5" style="height: fit-content;">
                    <div class="card-header text-center">
                        <h3>User Photo</h3>
                    </div>
                    <div class="card-body text-center">
                        <div class="round-image" style="height: 100px; width: 100px">
                            <!-- Initially display the user's current photo -->
                            <img id="userPhoto" src="http://localhost:8080/WomenSecurityApps/display?email=${user.email}" alt="User Photo">
                        </div>
                        <div class="mt-3"  id="uploadButtonWrapper" style="display: none;">
                            <!-- Input field for uploading a new photo -->
                            <label for="newPhoto" class="btn btn-warning"> <span id="uploadLabel">Upload New photo</span> <input type="file" id="newPhoto" name="imageFile" accept="image/*" readonly style="display: none;" onchange="previewNewPhoto(event)">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Additional Details -->
            <div class="col-md-11 mt-3">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Additional Details</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <!-- First Column -->
                            <div class="col-md-6">
                                <!-- Aadhar Card Number -->
                                <div class="row mb-3">
                                    <div class="col-md-5">
                                        <label for="aadharcardnumber" class="form-label"><i class="fa-solid fa-pencil"></i>Aadhar Card Number:</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" id="aadharcardnumber" name="aadharCardNumber" value="${user.aadharCardNumber}" onchange="validateAadharCardNumber()" required readonly />
                                        <span id="errorAadharCardNumber" style="color: red;"></span>
                                    </div>
                                </div>
                                <!-- Country -->
                                <div class="row mb-3">
                                    <div class="col-md-5">
                                        <label for="country" class="form-label"><i class="fa-solid fa-globe"></i>Country:</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" id="country" name="country" value="${user.country}" required readonly readonly="readonly" />
                                    </div>
                                </div>
                            </div>
                            <!-- Second Column -->
                            <div class="col-md-6">
                                <!-- Alternative Contact Number -->
                                <div class="row mb-3">
                                    <div class="col-md-5">
                                        <label for="altContactNumber" class="form-label"><i class="fa-solid fa-phone"></i>Alt Contact Number:</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" id="altContactNumber" name="altContactNumber" value="${user.altContactNumber}" onblur="validateAltContactNumber()" required readonly /> <span id="errorAltContactNumber" style="color: red;"></span>
                                    </div>
                                </div>
                                <!-- State -->
                                <div class="row mb-3">
                                    <div class="col-md-5">
                                        <label for="states" class="form-label"><i class="fa-solid fa-city"></i>State:</label>
                                    </div>
                                    <div class="col-md-7">
                                        <select class="form-select" id="states" name="state" disabled >
                                            <option value="${user.state}">${user.state}</option>
                                        </select>
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
                                        <input type="text" class="form-control" id="presentPlace" name="presentPlace" value="${user.presentPlace}" onblur="validatePresentPlace()" required /> <span id="errorPresentPlace" style="color: red;"></span>
                                    </div>
                                </div>
                            </div>
                            <!-- Pincode Place -->
                            <div class="col-md-6">
                                <div class="row mb-3">
                                    <div class="col-md-5">
                                        <label for="pincode" class="form-label"><i class="fa-solid fa-location-dot"></i>Pin Code:</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text" class="form-control" id="pincode" name="pincode" value="${user.pincode}" onblur="validatePincode()" required />
                                        <span id="errorpincode" style="color: red;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <c:forEach items="${errors}" var="e">
                    <div class="text-center">
                        <span style="color: red;">${e.message}</span>
                    </div>
                </c:forEach>
                <div class="text-center">
                    <span style="color: green;">${message}</span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 text-center">
                <div class="text-center">
                    <!-- Wrapping buttons in a div with text-center class -->
                    <button type="button" class="btn btn-primary" id="editButton">Edit</button>
                    <button id="button" type="submit" class="btn btn-success" disabled="disabled">Submit</button>
                </div>
            </div>
        </div>
    </form>
</div>


	<script>
	   document.getElementById('editButton').addEventListener('click', function() {
		   var inputs = document.querySelectorAll('#userProfileForm input:not([name="email"])');
	        for (var i = 0; i < inputs.length; i++) {
	            inputs[i].readOnly = false;
	        }
	        document.getElementById('editButton').disabled = true; 
	        document.getElementById('button').disabled = false;
	        document.getElementById("states").removeAttribute("disabled");
	        document.getElementById('uploadButtonWrapper').style.display = 'block'; 
	    });
	
	
	
	
    const newPhotoInput = document.getElementById('newPhoto');
    const uploadLabel = document.getElementById('uploadLabel');

    newPhotoInput.addEventListener('change', function() {
        if (newPhotoInput.files.length > 0) {
            const fileName = newPhotoInput.files[0].name;
            uploadLabel.textContent = fileName;
        } else {
            uploadLabel.textContent = 'Upload New Photo';
        }
    });
</script>
	<script>
    function previewNewPhoto(event) {
        var file = event.target.files[0];
        
        var reader = new FileReader();
        
        reader.onload = function(e) {
            document.getElementById('userPhoto').src = e.target.result;
        };
        
        reader.readAsDataURL(file);
    }
</script>

	<script>
    function onName() {
        var userName = document.getElementById("name").value.trim();

        var isValidUserName = /^[A-Za-z]{3,25}$/.test(userName);

        if (isValidUserName) {
            document.getElementById("errorUserName").innerHTML = "";
            document.getElementById("button").disabled = false; 
        } else {
            document.getElementById("errorUserName").innerHTML = "Username must be between 3 and 25 alphabetic characters";
            document.getElementById("button").disabled = true; 
        }
    }
function validateContactNumber() {
	var contactNumber = document.getElementById("contactNumber").value;
	if (/^\d{10}$/.test(contactNumber)) {
		const xhttp = new XMLHttpRequest();
		console.log('Running in AJAX');

		xhttp.open("GET",
				"http://localhost:8080/WomenSecurityApps/contactNumber/"
						+ encodeURIComponent(contactNumber));
		xhttp.send();

		xhttp.onload = function() {
			var exists = this.responseText === "contactNumberexists";
			if (exists) {
				document.getElementById("errorContactNumber").innerHTML = "Contact number already exists";
				document.getElementById("button").disabled = true;
			} else {
				document.getElementById("errorContactNumber").innerHTML = "";
				document.getElementById("button").disabled = false;
			}
		};
	} else {
		document.getElementById("errorContactNumber").innerText = "Contact number should be a valid 10-digit number";
		document.getElementById("button").disabled = true;
	}
}

function validateAltContactNumber() {
	var number = document.getElementById("contactNumber").value;
    var altNumber = document.getElementById("altContactNumber").value;
    var numberRegex = /^[0-9]{10}$/;
    if (numberRegex.test(altNumber) && number !== altNumber) {
        document.getElementById("errorAltContactNumber").innerHTML = "";
        document.getElementById("button").disabled = false;
    } else {
        document.getElementById("errorAltContactNumber").innerHTML = number === altNumber ? "Contact and alternate number cannot be same" : "Enter 10 digits number";
        document.getElementById("button").disabled = true;
    }
}

function validateAadharCardNumber(){
	var aadharInput = document.getElementById('aadharcardnumber');
	var aadharValue = aadharInput.value.trim();
	var aadharRegex = /^\d{12}$/;

	if (aadharRegex.test(aadharValue)) {
		const xhttp = new XMLHttpRequest();
		console.log('Running in AJAX');

		xhttp.open("GET",
				"http://localhost:8080/WomenSecurityApps/aadharNumber/"
						+ encodeURIComponent(aadharValue));
		xhttp.send();

		xhttp.onload = function() {
			var exists = this.responseText === "aadharNumberexists";
			if (exists) {
				document.getElementById("errorAadharCardNumber").innerText = "Aadhar card number already exists";
				document.getElementById("button").disabled = true;
			} else {
				document.getElementById("errorAadharCardNumber").innerText = "";
				document.getElementById("button").disabled = false;

			}
		};
	} else {
		document.getElementById("errorAadharCardNumber").innerText = "Aadhar card number should be a valid 12-digit number";
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
