<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	rel="stylesheet" />
	
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<title>Voters' Services Portal</title>
<link rel="shortcut icon" href="voter.svg" type="image/x-icon" />
</head>
<style>
.blue-bg {
	background-color: #007bff;
	color: #fff;
	padding: 20px;
}

.form-container {
	padding: 20px;
}
    .nav-link:hover {
    background-color:white;
    border-radius: 10px;
    }
</style>
<body>
	<header class="fixed-top">
		<nav class="navbar navbar-expand-lg bg-primary fixed-top">
			<a class="navbar-brand" href="#"> <img src="voter.svg" alt="Logo"
				width="30" height="24" class="d-inline-block align-text-top" />
				VOTERS’ SERVICE PORTAL
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
						href="index.jsp">Home<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="voteridapplication.jsp">Apply voterID</a></li>
					<li class="nav-item">
						<div id="google_translate_element"></div> <script
							type="text/javascript">
                    function googleTranslateElementInit() {
                      new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
                    }
                    </script> <script type="text/javascript"
							src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<br />
	<br />
	<br />
	<br />
	<main>
		<div class="container-fluid">
			<div class="row">
				<!-- Left Side: Blue Background with Logo and Text -->
				<div
					class="col-md-6 blue-bg justify-content-center align-items-center text-center">
					<div class="mt-10">
						<img src="voter.svg" alt="logo" width="100" height="50" />
						<h2>ಭಾರತ ಚುನಾವಣಾ ಆಯೋಗ"</h2>
						<h2>भारत निर्वाचन आयोग</h2>
						<p>Election Commission of India</p>
					</div>
				</div>
				<!-- Right Side: Application Form -->
				<div class="col-md-6 form-container">
					<h2>VoterID Application Form</h2>
					<form action="VoterIdApplicationServlet"
						onsubmit="return validateForm()">
						<div class="mb-3">
							<label for="username" class="form-label"><i class="fa-solid fa-user"></i>UserName</label> <input
								type="text" class="form-control" id="userName" name="userName"
								placeholder="Enter username" required /> <span
								id="erroruserName"></span>
						</div>
						<div class="mb-3">
							<label for="aadharcardnumber" class="form-label"><i class="fa-solid fa-pencil"></i>AadharCardNumber</label>
							<input type="text" class="form-control" id="aadharcardnumber"
								name="aadharcardnumber" placeholder="Enter aadharcardnumber"
								required /> <span id="erroraadharcardnumber"></span>
						</div>
						<div class="mb-3">
							<label for="birthdate" class="form-label"><i class="fa-solid fa-cake-candles"></i>BirthDate</label> <input
								type="date" id="birthdate" class="form-control" name="birthdate"
								max="2006-01-01" required /> <span id="errorbirthdate"></span>
						</div>
						<div class="mb-3">
							<label for="contactNumber" class="form-label"><i class="fa-solid fa-phone"></i>Contact
								Number</label> <input type="tel" class="form-control" id="contactNumber"
								name="contactNumber" required /> <span id="errorContactNumber"></span>
						</div>
						<div class="mb-3">
							<label for="altContactNumber" class="form-label"><i class="fa-solid fa-phone"></i>Alternative
								Contact Number</label> <input type="tel" class="form-control"
								id="altContactNumber" name="altContactNumber" required /> <span
								id="erroraltContactNumber"></span>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label"><i class="fa-regular fa-envelope"></i>Email</label> <input
								type="email" class="form-control" id="email" name="email"
								required /> <span id="erroremail"></span>
						</div>
						<div class="mb-3">
							<label for="country" class="form-label"><i class="fa-solid fa-globe"></i>Country</label> <input
								type="text" class="form-control" id="country" name="country"
								value="India" readonly />
						</div>
						<div class="mb-3">
							<label for="states" class="form-label"><i class="fa-solid fa-city"></i>State</label> <select
								class="form-select" id="states" name="states" required>
								<option value="">Select State</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="presentPlace" class="form-label"><i class="fa-regular fa-building"></i>Present
								Place</label> <input type="text" class="form-control" id="presentPlace"
								name="presentPlace" required />
						</div>
						<div class="mb-3">
							<label for="permanentPlace" class="form-label"><i class="fa-solid fa-house"></i>Permanent
								Place</label> <input type="text" class="form-control"
								id="permanentPlace" name="permanentPlace" required />
						</div>
						<div class="mb-3">
							<label for="pincode" class="form-label"><i class="fa-solid fa-location-dot"></i>Pin Code</label> <input
								type="text" class="form-control" id="pincode" name="pincode"
								placeholder="Enter pin code" required /> <span
								id="errorpincode"></span>
						</div>
						<button type="submit" class="btn btn-primary">Preview</button>
						<button type="reset" class="btn btn-secondary">Clear</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer -->
	<footer class="bg-light text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<h4>Contact Us</h4>
					<p>Phone: 1950 (Toll-free)</p>
					<p>Address: Election Commission Of India, NirvachanSadan,
						AshokaRoad, NewDelhi 110001</p>
					<p>
						Email: <a href="mailto:complaints@eci.gov.in">complaints@eci.gov.in</a>
					</p>
				</div>
				<div class="col-md-7">
					<h4>About ECI</h4>
					<p>The Election Commission of India is an autonomous
						constitutional authority responsible for administering Union and
						State election processes in India. The body administers elections
						to the LokSabha, RajyaSabha, State Legislative Assemblies, and
						offices of President and Vice President in the country.</p>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-md-4">
						<h4>Find us on</h4>

						<a class="btn btn-primary btn-floating m-1"
							style="background-color: #3b5998" href="#!" role="button"><i
							class="fab fa-facebook-f"></i></a>

						<!-- Twitter -->
						<a class="btn btn-primary btn-floating m-1"
							style="background-color: #55acee" href="#!" role="button"><i
							class="fab fa-twitter"></i></a>

						<!-- Google -->
						<a class="btn btn-primary btn-floating m-1"
							style="background-color: #dd4b39" href="#!" role="button"><i
							class="fab fa-google"></i></a>

						<!-- Instagram -->
						<a class="btn btn-primary btn-floating m-1"
							style="background-color: #ac2bac" href="#!" role="button"><i
							class="fab fa-instagram"></i></a>

						<!-- Linkedin -->
						<a class="btn btn-primary btn-floating m-1"
							style="background-color: #0082ca" href="#!" role="button"><i
							class="fab fa-linkedin-in"></i></a>
						<!-- Github -->
						<a class="btn btn-primary btn-floating m-1"
							style="background-color: #d40f0f" href="#!" role="button"><i
							class="fab fa-youtube"></i></a>
					</div>
					<p>
						<a href="#">Privacy Policy</a>
					</p>
				</div>
			</div>
		</div>
		<hr />
		<p>&copy; 2023 Election Commission of India. All Rights Reserved.</p>
	</footer>
	<script>
        function validateForm() {
          var userName = document.getElementById("userName").value;
          var contactNumber = document.getElementById("contactNumber").value;
          var age = document.getElementById("birthdate").value;
          var altContactNumber = document.getElementById("altContactNumber").value;
          var pincode = document.getElementById("pincode").value;
          const aadharCardNumber=document.getElementById("aadharcardnumber").value;
      
          // Clear previous error messages
          document.getElementById("errorpincode").innerHTML = "";
          document.getElementById("errorContactNumber").innerHTML = "";
          document.getElementById("erroraltContactNumber").innerHTML = "";
          document.getElementById("erroruserName").innerHTML = "";
          document.getElementById("erroraadharcardnumber").innerHTML = "";
      
          // Validation for username
          if (userName.length < 3 || userName.length > 30) {
            document.getElementById("erroruserName").innerHTML =
              "Username should be between 3 and 30 characters.";
            return false;
          }
          // validation for aadhar card number
          if (aadharCardNumber.trim() === "") {
              document.getElementById("erroraadharcardnumber").innerHTML =
                "Please enter a aadhar card number";
              return false;
            } else if ( aadharCardNumber.length !== 12) {
              document.getElementById("erroraadharcardnumber").innerHTML =
                "Aadhar Card Number should  contain 12 digits";
              return false;
            }
          
      
          // Validation for contact number
          if (contactNumber.trim() === "") {
            document.getElementById("errorContactNumber").innerHTML =
              "Please enter a contact number";
            return false;
          } else if (!contactNumber.startsWith("91") || contactNumber.length !== 12) {
            document.getElementById("errorContactNumber").innerHTML =
              "Contact number should start with 91 and contain 10 digits after 91";
            return false;
          }
      
          // Validation for alternative contact number
          if (altContactNumber.trim() === "") {
            document.getElementById("erroraltContactNumber").innerHTML =
              "Please enter an alternative contact number";
            return false;
          } else if (!altContactNumber.startsWith("91") || altContactNumber.length !== 12) {
            document.getElementById("erroraltContactNumber").innerHTML =
              "Alternative contact number should start with 91 and contain 10 digits after 91";
            return false;
          } else if (altContactNumber === contactNumber) {
            document.getElementById("erroraltContactNumber").innerHTML =
              "Alternative contact number should not be same as contact number";
            return false;
          }
      
          // Validation for pincode
          if (pincode.length !== 6) {
            document.getElementById("errorpincode").innerHTML =
              "Pincode should contain 6 digits";
            return false;
          }
      
          return true;
        }
      </script>
	<script>
  // Array of Indian states and union territories
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

