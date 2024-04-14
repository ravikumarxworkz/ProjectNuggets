<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.email}">
	<c:redirect url="homePage" />
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
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

.form-control, .form-select {
	border-radius: 5px;
	border-color: #ccc;
}

.user-display {
	color: white;
}

.row {
	margin-bottom: 20px;
}

img {
	max-width: 100%;
	height: auto;
}

.round-image {
	width: 150px; /* Adjust as needed */
	height: 160px; /* Adjust as needed */
	border-radius: 50%; /* Makes the image round */
	overflow: hidden; /* Ensures the image stays within the circle */
	display: inline-block;
	border: 2px solid #ccc; /* Border color */
}

/* CSS to center the image within the circle */
.round-image img {
	width: 100%;
	height: 100%;
	object-fit: cover; 
}

.profile-photo {
	width: 50px; 
	height: 50px; 
	border-radius: 50%; 
	margin-right: 5px; 
}

.custom-width-modal .modal-dialog {
	width: 90%; 
	max-width: none; 
}
.table-bordered {
    border: 2px solid #000; 
    border-radius: 10px;
}

.table-bordered thead th {
    background-color: #333; 
    color: #fff; 
}
</style>
<body>
	<header>
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Admin</a>
				<!-- Admin profile picture and email -->
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarNavDropdown">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <span
								class="user-display"> <img class="profile-photo"
									src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
									alt="User Photo"> ${email}
							</span>

						</a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="adminLogout">logout</a>

							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container mt-4" style="width: 80%; height: auto;">
    <h1 class="text-center">Welcome, Admin!</h1>
    <div class="row justify-content-between mb-1">
        <div class="col-auto">
            <button id="viewButton" class="btn btn-primary" style="width: 150px; height: 40px;">View Users</button>
        </div>
        <div class="col-auto">
            <form action="searchUser" id="searchForm" method="get" class="d-flex">
                <input type="text" name="searchQuery" class="form-control me-2" placeholder="Search...by emailId" style="width: 300px;">
                <button type="submit" class="btn btn-outline-primary" style="height: 40px;">Search</button>
            </form>
        </div>
        <div class="col-auto">
            <button id="complaintHistoryButton" class="btn btn-info" style="width: 200px; height: 40px;">Complaint History</button>
        </div>
    </div>
</div>
	

		<!-- User details table -->
		<div class="table-responsive" id="userDetailsTableContainer"
			style="display: none;">
			<table id="userDetailsTable" class="table table-bordered table-hover">
				<!-- Table headers -->
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>Image</th>
						<th>Name</th>
						<th>Email</th>
						<th>Aadhar Card Number</th>
						<th>Contact Number</th>
						<th>Alt Contact Number</th>
						<th>country</th>
						<th>State</th>
						<th>Present Place</th>
						<th>PinCode</th>
						<th>Action</th>
						<!-- New column for action buttons -->
					</tr>
				</thead>
				<tbody>
					<!-- Data will be displayed here -->
				</tbody>
			</table>
		</div>

		<!-- Complaint details table -->
		<div class="table-responsive" id="complaintDetailsTableContainer"
			style="display: none;">
			<table id="complaintDetailsTable"
				class="table table-bordered table-hover">
				<!-- Table headers -->
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>Email</th>
						<th>Name</th>
						<th>Incident Timing</th>
						<th>Phone Number</th>
						<th>Place</th>
						<th>About Incident</th>
						<th>Complaint Number</th>
						<th>Status</th>
						<th>Action</th>
						<!-- New column for action buttons -->
					</tr>
				</thead>
				<tbody>
					<!-- Data will be displayed here -->
				</tbody>
			</table>
		</div>
		<!-- Modal for editing user details -->
		<div class="modal fade custom-width-modal" id="editUserModal"
			tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" style="text-align: center;"
							id="editUserModalLabel">Edit User Details</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="update" id="userProfileForm"
							enctype="multipart/form-data" method="post">
							<div class="container">
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
														<label for="userName" class="form-label"><i
															class="fa-solid fa-user"></i>User Name:</label>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" id="userName"
															name="name" onblur="onName()" required readonly /> <span
															id="errorUserName" style="color: red;"></span>
													</div>
												</div>
												<div class="row mb-3">
													<div class="col-md-3">
														<label for="email" class="form-label"><i
															class="fa-solid fa-envelope"></i>Email:</label>
													</div>
													<div class="col-md-9">
														<input type="email" class="form-control" id="email"
															name="email" readonly="readonly" />
													</div>
												</div>
												<div class="row mb-3">
													<div class="col-md-3">
														<label for="contactNumber" class="form-label"><i
															class="fa-solid fa-phone"></i>Contact Number:</label>
													</div>
													<div class="col-md-9">
														<input type="text" class="form-control" id="contactNumber"
															name="contactNumber" onblur="validateContactNumber()"
															required readonly /> <span id="errorContactNumber"
															style="color: red;"></span>
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
													<img id="userPhoto"
														src="http://localhost:8080/WomenSecurityApps/admin/display?email="
														alt="User Photo">
												</div>

												<div class="mt-3" id="uploadButtonWrapper"
													style="display: none;">
													<!-- Input field for uploading a new photo -->
													<label for="newPhoto" class="btn btn-warning"> <span
														id="uploadLabel">Upload New photo</span> <input
														type="file" id="newPhoto" name="imageFile"
														accept="image/*" readonly style="display: none;"
														onchange="previewNewPhoto(event)">
													</label>
												</div>
											</div>
										</div>
									</div>
									<!--  image end -->
								</div>
								<div class="row justify-content-center mt-3">
									<div class="col-md-11">
										<!-- Increased width of the column containing the card -->
										<div class="card">
											<div class="card-header text-center">
												<h3>Additional Details</h3>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-md-6">
														<!-- Aadhar Card Number -->
														<div class="row mb-3">
															<div class="col-md-5">
																<label for="aadharCardNumber" class="form-label"><i
																	class="fa-solid fa-pencil"></i>Aadhar Number:</label>
															</div>
															<div class="col-md-7">
																<input type="text" class="form-control"
																	id="aadharCardNumber" name="aadharCardNumber"
																	onchange="validateAadharCardNumber()" required readonly />
																<span id="errorAadharCardNumber" style="color: red;"></span>
															</div>
														</div>
														<!-- Country -->
														<div class="row mb-3">
															<div class="col-md-5">
																<label for="country" class="form-label"><i
																	class="fa-solid fa-globe"></i>Country:</label>
															</div>
															<div class="col-md-7">
																<input type="text" class="form-control" id="country"
																	name="country" required readonly readonly="readonly" />
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<!-- Alternative Contact Number -->
														<div class="row mb-3">
															<div class="col-md-5">
																<label for="altContactNumber" class="form-label"><i
																	class="fa-solid fa-phone"></i>Alt Contact Number:</label>
															</div>
															<div class="col-md-7">
																<input type="text" class="form-control"
																	id="altContactNumber" name="altContactNumber"
																	onblur="validateAltContactNumber()" required readonly />
																<span id="errorAltContactNumber" style="color: red;"></span>
															</div>
														</div>
														<!-- State -->
														<div class="row mb-3">
															<div class="col-md-5">
																<label for="state" class="form-label"><i
																	class="fa-solid fa-city"></i>State:</label>
															</div>
															<div class="col-md-7">
																<select class="form-control" id="state" name="state"
																	disabled>
																	<option value="${state}" selected>${state}</option>
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
																<label for="presentPlace" class="form-label"><i
																	class="fa-regular fa-building"></i>Present Place:</label>
															</div>
															<div class="col-md-7">
																<input type="text" class="form-control"
																	id="presentPlace" name="presentPlace"
																	onblur="validatePresentPlace()" required readonly /> <span
																	id="errorPresentPlace" style="color: red;"></span>
															</div>
														</div>
													</div>
													<!-- Pincode Place -->
													<div class="col-md-6">
														<div class="row mb-3">
															<div class="col-md-5">
																<label for="pincode" class="form-label"><i
																	class="fa-solid fa-location-dot"></i>Pin Code:</label>
															</div>
															<div class="col-md-7">
																<input type="text" class="form-control" id="pincode"
																	name="pincode" onblur="validatePincode()" readonly
																	required="required" /> <span id="errorpincode"
																	style="color: red;"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12 text-center">
										<div class="text-center">
											<button type="button" class="btn btn-primary" id="editButton">Edit</button>
											<button id="saveChangesBtn" type="button"
												class="btn btn-primary" disabled="disabled"
												onclick="saveChanges()">Save Changes</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="dismissModals()">Close</button>
					<!-- <button id="saveChangesBtn" type="button" class="btn btn-primary" disabled="disabled" onclick="saveChanges()">Save Changes</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Modal -->
	<div class="modal fade" id="errorModal" tabindex="-1"
		aria-labelledby="errorModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorModalLabel">Error</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<span id="errorMessage"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="dismissModals()">OK</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Success</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Data updated successfully.</div>
				<div class="modal-footer">
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="dismissModals()">OK</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal for editing complaint details -->
	<div class="modal fade" id="editComplaintModal" tabindex="-1"
		role="dialog" aria-labelledby="editComplaintModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editComplaintModalLabel">Edit
						Complaint Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						<strong>Complaint ID:</strong><span id="id"></span>
					</p>
					<p>
						<strong>Name:</strong> <span id="complaintName"></span>
					</p>
					<p>
						<strong>Incident Timing:</strong> <span
							id="complaintIncidentTiming"></span>
					</p>
					<p>
						<strong>Place:</strong> <span id="complaintPlace"></span>
					</p>
					<p>
						<strong>About Incident:</strong> <span id="complaintAbout"></span>
					</p>
					<p>
						<strong>Phone Number:</strong> <span id="complaintPhoneNumber"></span>
					</p>
					<p>
						<strong>Email:</strong> <span id="complaintEmail"></span>
					</p>
					<p>
						<strong>Complaint Number:</strong> <span id="complaintNumber"></span>
					</p>
					<p>
						<strong>Complaint status:</strong>
						 <input type="text" id="status" class="form-control">
						 <input type="hidden" id="id" >
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="saveChangesBtn" type="button" class="btn btn-primary"
						onclick="saveChangesComplaint()">Save Changes</button>
					<button id="downloadPDFBtn" type="button" class="btn btn-success"
						onclick="downloadPDF()">Download PDF</button>
					<button id="sendPDFEmailBtn" type="button" class="btn btn-info"
						data-toggle="modal" data-target="#sendPDFEmailModal">Send
						PDF to Email</button>
				</div>
			</div>
		</div>
	</div>

	<script>
    function dismissModals() {
    	 $('#errorModal').modal('hide');
        $('#successModal').modal('hide');
        $('#editUserModal').modal('hide');
        document.getElementById('editButton').disabled = false; 
        document.getElementById('saveChangesBtn').disabled = true;
    }
</script>
	<script>
	function saveChanges() {
	    const formData = new FormData(document.getElementById('userProfileForm'));
	    $.ajax({
	        url: 'http://localhost:8080/WomenSecurityApps/admin/update',
	        type: 'POST',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(response) {
	            if (typeof response === 'string') {
	                // Check for specific error messages
	                if (response === "Contact number already exists") {
	                    $('#errorMessage').text("Contact number already exists");
	                    $('#errorModal').modal('show');
	                } else if (response === "Aadhar card number already exists") {
	                    $('#errorMessage').text("Aadhar card number already exists");
	                    $('#errorModal').modal('show');
	                } else {
	                    $('#errorMessage').text(response);
	                    $('#errorModal').modal('show');
	                }
	            } else {
	                $('#successModal').modal('show');
	            }
	        },
	        error: function(xhr, status, error) {
	            const errorMessage = "An error occurred while updating data: " + error;
	            $('#errorMessage').text(errorMessage);
	            $('#errorModal').modal('show');
	        }
	    });
	}
</script>
	<!-------------------------------- read all user Deatiles javascript code------------------>
	<script>
    $(document).ready(function() {
        $("#viewButton").click(function() {
            $("#complaintDetailsTableContainer").hide(); 
            $("#userDetailsTableContainer").toggle(); 
            if ($("#userDetailsTableContainer").is(":visible")) {
                $.ajax({
                    url: "getUserData",
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        $("#userDetailsTable tbody").empty();
                        $.each(data, function(index, item) {
                            var row = "<tr>"
                                + "<td>" + item.id + "</td>"
                                + "<td><img src='display?email=" + item.email + "' alt='Profile Picture' width='50' height='50'></td>"
                                + "<td>" + item.name + "</td>"
                                + "<td class='edit-email'>" + item.email + "</td>"
                                + "<td>" + item.aadharCardNumber + "</td>"
                                + "<td>" + item.contactNumber + "</td>"
                                + "<td>" + item.altContactNumber + "</td>"
                                + "<td>" + item.country + "</td>"
                                + "<td>" + item.state + "</td>"
                                + "<td>" + item.presentPlace + "</td>"
                                + "<td>" + item.pincode + "</td>"
                                + "<td><button class='btn btn-primary btn-sm edit-button' data-email='" + item.email + "'>Edit</button></td>"
                                + "</tr>";
                            $("#userDetailsTable tbody").append(row);
                        });

                        $(".edit-button").click(function() {
                            var email = $(this).data('email');
                            $.ajax({
                                url: "getUserDataByEmail",
                                type: "GET",
                                data: { email: email },
                                dataType: "json",
                                success: function(filteredData) { 
                                    console.log(filteredData);
                                    var item = filteredData;
                                    $('#userName').val(item.name);
                                    $('#email').val(item.email);
                                    var userEmail = item.email;
                                    $('#userPhoto').attr('src', 'http://localhost:8080/WomenSecurityApps/admin/display?email=' + userEmail);
                                    $('#aadharCardNumber').val(item.aadharCardNumber);
                                    $('#contactNumber').val(item.contactNumber);
                                    $('#altContactNumber').val(item.altContactNumber);
                                    $('#country').val(item.country);
                                    var stateValue = item.state;
                                 $('#state option:first').html(stateValue);
                                 $('#state').val(stateValue);
                                    $('#presentPlace').val(item.presentPlace);
                                    $('#pincode').val(item.pincode);
                                    
                                    $('#editUserModal').modal('show');
                                },
                                error: function(xhr, status, error) {
                                    console.error(error);
                                }
                            });
                        });

                    },
                    error: function(xhr, status, error) {
                        alert("Failed to fetch user data from server.");
                        console.error(error);
                    }
                });
            }
        });
    });
</script>
	<!--   JavaScript code  FOR SERACH BY EMAIL ID   ------------->
	<script>
        $(document).ready(function() {
            $("#searchForm").submit(function(event) {
                event.preventDefault(); // Prevent default form submission
                var email = $("input[name='searchQuery']").val(); // Get the email from the input field
                
                $.ajax({
                    url: "getUserDataByEmail",
                    type: "GET",
                    data: { email: email },
                    dataType: "json",
                    success: function(filteredData) {
                        if (filteredData) {
                            $("#userDetailsTableContainer").show();
                            $("#userDetailsTable tbody").empty();
                            
                            var item = filteredData;
                            var row = "<tr>"
                                + "<td>" + item.id + "</td>"
                                + "<td><img src='display?email=" + item.email + "' alt='Profile Picture' width='50' height='50'></td>"
                                + "<td>" + item.name + "</td>"
                                + "<td>" + item.email + "</td>"
                                + "<td>" + item.aadharCardNumber + "</td>"
                                + "<td>" + item.contactNumber + "</td>"
                                + "<td>" + item.altContactNumber + "</td>"
                                + "<td>" + item.country + "</td>"
                                + "<td>" + item.state + "</td>"
                                + "<td>" + item.presentPlace + "</td>"
                                + "<td>" + item.pincode + "</td>"
                                + "<td><button class='btn btn-primary btn-sm edit-button' onclick='editUser(" + item.id + ", \"" + item.name + "\", \"" + item.email + "\", \"" + item.aadharCardNumber + "\", \"" + item.contactNumber + "\", \"" + item.altContactNumber + "\", \"" + item.country + "\", \"" + item.state + "\", \"" + item.presentPlace + "\", \"" + item.pincode + "\")'>Edit</button></td>"
                                + "</tr>";
                            $("#userDetailsTable tbody").append(row);
                        } else {
                            alert("User not found.");
                        }
                    },
                    error: function(xhr, status, error) {
                        alert("Failed to fetch user data from server.");
                        console.error(error);
                    }
                });
            });
        });

        function editUser(id, name, email, aadharCardNumber, contactNumber, altContactNumber, country, state, presentPlace, pincode) {
      	  $('#userName').val(name);
            $('#email').val(email);
            var userEmail =email;
            $('#userPhoto').attr('src', 'http://localhost:8080/WomenSecurityApps/admin/display?email=' + userEmail);
            $('#aadharCardNumber').val(aadharCardNumber);
            $('#contactNumber').val(contactNumber);
            $('#altContactNumber').val(altContactNumber);
            $('#country').val(country);
            var stateValue = state;
            $('#state option:first').html(stateValue);
           $('#state').val(stateValue);
            $('#presentPlace').val(presentPlace);
            $('#pincode').val(pincode);
            $('#editUserModal').modal('show');
        }
    </script>
	<!--------------------------------complaintHistory CODE------------------>
	<script>
    $(document).ready(function() {
        $("#complaintHistoryButton").click(function() {
            $("#userDetailsTableContainer").hide(); 
            $("#complaintDetailsTableContainer").toggle(); 
            if ($("#complaintDetailsTableContainer").is(":visible")) {
                $.ajax({
                    url: "getComplaintData",
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        $("#complaintDetailsTable tbody").empty();
                        $.each(data, function(index, item) {
                            var row = "<tr>"
                                + "<td>" + item.id + "</td>"
                                + "<td>" + item.email + "</td>"
                                + "<td>" + item.name + "</td>"
                                + "<td>" + item.incidentTiming + "</td>"
                                + "<td>" + item.phoneNumber + "</td>"
                                + "<td>" + item.place + "</td>"
                                + "<td>" + item.aboutIncident + "</td>"
                                + "<td>" + item.complaintNumber + "</td>"
                                + "<td>" + item.status + "</td>"
                                + "<td><button class='btn btn-primary btn-sm' onclick='editComplaint(" + JSON.stringify(item) + ")'>Edit</button></td>"
                                + "</tr>";
                            $("#complaintDetailsTable tbody").append(row);
                        });
                    },
                    error: function(xhr, status, error) {
                        alert("Failed to fetch complaint data from server.");
                        console.error(error);
                    }
                });
            }
        });
    });

    function editComplaint(complaint) {
        console.log(complaint); 
        $('#editComplaintModal').modal('show');
        
        
        $('#id').val(complaint.id);
        $('#id').text(complaint.id);
        $('#complaintName').text(complaint.name);
        $('#complaintIncidentTiming').text(complaint.incidentTiming);
        $('#complaintPlace').text(complaint.place);
        $('#complaintAbout').text(complaint.aboutIncident);
        $('#complaintPhoneNumber').text(complaint.phoneNumber);
        $('#complaintEmail').text(complaint.email);
        $('#complaintNumber').text(complaint.complaintNumber);
        $('#status').val(complaint.status);
    }
</script>
	<!-------------------------DOWNLOAD COMPALINT PDF FILE ------------------>
	<script>
	function downloadPDF() {
	    const doc = new jsPDF();
	    const complaintNumber = $("#complaintNumber").text();
	  
	    // Add page border
	    doc.rect(5, 5, 200, 280); // Border with (x, y, width, height)
	    
	    // Add header
	    doc.setFontSize(20);
	    doc.setFont("bold");
	    doc.text("Women Security App", 70, 18, { align: "center" });

	    doc.setDrawColor(0);
	    doc.setLineWidth(0.5);
	    doc.line(10, 25, 200, 25);
	    doc.line(10, 265, 200, 265);

	    // Add download time and date
	    const currentDate = new Date().toLocaleDateString();
	    const currentTime = new Date().toLocaleTimeString();
	    doc.setFontSize(10);
	    doc.text("Downloaded on: " + currentDate + " " + currentTime, 135, 24);

	    // Add complaint details
	    doc.setFontSize(14);
	    doc.text("Registered Complaint Details", 70, 35, { align: "center" }); 
	    doc.setFontSize(10);
	    doc.text("Complaint number: " + complaintNumber, 70, 40, { align: "center" }); 
	    doc.text("Complaint ID: " + $("#id").text(), 10, 50);
	    doc.text("Name: " + $("#complaintName").text(), 10, 60);
	    doc.text("Incident Timing: " + $("#complaintIncidentTiming").text(), 10, 70);
	    doc.text("Place: " + $("#complaintPlace").text(), 10, 80);
	    doc.text("About Incident: " + $("#complaintAbout").text(), 10, 90);
	    doc.text("Phone Number: " + $("#complaintPhoneNumber").text(), 10, 100);
	    doc.text("Email: " + $("#complaintEmail").text(), 10, 110);
	    doc.text("Complaint Number: " + $("#complaintNumber").text(), 10, 120);
	    doc.text("Complaint status: " + $("#status").val(), 10, 130);

	    // Add signature at the bottom
	    doc.text("Signature", 170, 240, { align: "center" });
	   
 
	    // Set font size and color for the footer
	    doc.setFontSize(10);
	    doc.setTextColor(0, 0, 0);
	    
	    // Define the content for the footer
	    var websiteLink = "http://localhost:8080/WomenSecurityApps";
	    var email = "womensecurityapp@gmail.com";
	    var phoneNumber = "+919834567890";
	    var officeAddress = "123 Main Street, bengaluru, karntaka, india";

	    // Calculate the position for the footer
	   var footerX = 15;
var footerY = doc.internal.pageSize.height - 10; // Position it 10 mm from the bottom

// Add the content to the footer within the border
doc.text(footerX+60, footerY - 5, "Website: " + websiteLink);
doc.text(footerX, footerY - 10, "Email: " + email);
doc.text(footerX + 60, footerY - 10, "Phone: " + phoneNumber);
doc.text(footerX + 110, footerY - 10, "Address: " + officeAddress);



	    // Save the PDF with a name
	    doc.save("complaint_details_" + complaintNumber + ".pdf");
	}
</script>
<script>
function saveChangesComplaint() {
    var complaintId = $('#id').val(); // Parse the value to an integer
    var status = $('#status').val(); 

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/WomenSecurityApps/admin/updateComplaint',
        data: { id: complaintId, status: status },
        success: function(response) {
        	if(response=="Data saved successfully")
        	
            console.log('Data saved successfully');
            $('#successModal').modal('show');
        },
        error: function(xhr, status, error) {
        	 const errorMessage = "An error occurred while updating data: " + error;
	            $('#errorMessage').text(errorMessage);
	            $('#errorModal').modal('show');
        }
    });
}



</script>







	<!----------------------USER EDIT AND FILED VALIDARION CODE ------------------>
	<script>
	   document.getElementById('editButton').addEventListener('click', function() {
		   var inputs = document.querySelectorAll('#userProfileForm input:not([name="email"]):not([name="country"])');
	        for (var i = 0; i < inputs.length; i++) {
	            inputs[i].readOnly = false;
	        }
	        document.getElementById('editButton').disabled = true; 
	        document.getElementById('saveChangesBtn').disabled = false; 
	        document.getElementById("state").removeAttribute("disabled");
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
    function onName() {
        var userName = document.getElementById("name").value.trim();

        var isValidUserName = /^[A-Za-z]{3,25}$/.test(userName);

        if (isValidUserName) {
            document.getElementById("errorUserName").innerHTML = "";
            document.getElementById("saveChangesBtn").disabled = false; 
        } else {
            document.getElementById("errorUserName").innerHTML = "Username must be between 3 and 25 alphabetic characters";
            document.getElementById("saveChangesBtn").disabled = true; 
        }
    }
    function validateContactNumber() {
    	var contactNumber = document.getElementById("contactNumber").value;
    	if (/^\d{10}$/.test(contactNumber)) {
    		document.getElementById("errorContactNumber").innerHTML = "";
			document.getElementById("saveChangesBtn").disabled = false;
    	}else{
    		document.getElementById("errorContactNumber").innerText = "Contact number should be a valid 10-digit number";
    		document.getElementById("saveChangesBtn").disabled = true;
    		
    	}
    }

function validateAltContactNumber() {
	var number = document.getElementById("contactNumber").value;
    var altNumber = document.getElementById("altContactNumber").value;
    var numberRegex = /^[0-9]{10}$/;
    if (numberRegex.test(altNumber) && number !== altNumber) {
        document.getElementById("errorAltContactNumber").innerHTML = "";
        document.getElementById("saveChangesBtn").disabled = false;
    } else {
        document.getElementById("errorAltContactNumber").innerHTML = number === altNumber ? "Contact and alternate number cannot be same" : "Enter 10 digits number";
        document.getElementById("saveChangesBtn").disabled = true;
    }
}
function validateAadharCardNumber(){
	var aadharInput = document.getElementById('aadharcardnumber');
	var aadharValue = aadharInput.value.trim();
	var aadharRegex = /^\d{12}$/;

	if (aadharRegex.test(aadharValue)) {
		document.getElementById("errorAadharCardNumber").innerText = "";
		document.getElementById("saveChangesBtn").disabled = false;

		
	}else{
		document.getElementById("errorAadharCardNumber").innerText = "Aadhar card number should be a valid 12-digit number";
		document.getElementById("saveChangesBtn").disabled = true;
	   }
	}

function validatePincode() {
    var pincode = document.getElementById("pincode").value;
    var pincodeRegex = /^\d{6}$/;
    if (pincodeRegex.test(pincode)) {
        document.getElementById("errorpincode").innerHTML = "";
        document.getElementById("saveChangesBtn").disabled = false;
    } else {
        document.getElementById("errorpincode").innerHTML = "Pincode must be 6 digits";
        document.getElementById("saveChangesBtn").disabled = true;
    }
}

function validatePresentPlace() {
    var presentPlace = document.getElementById("presentPlace").value.trim();
    var isValidPresentPlace = /^[A-Za-z\s]{3,100}$/.test(presentPlace);
    document.getElementById("errorPresentPlace").innerHTML = isValidPresentPlace ? "" : "Present Place must be between 3 and 100 characters and can only contain letters and spaces.";
    document.getElementById("saveChangesBtn").disabled = !isValidPresentPlace;
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

  const selectElement = document.getElementById("state");

  indianStates.forEach(state => {
    const option = document.createElement("option");
    option.value = state.toLowerCase().replace(/\s+/g, ''); // Remove spaces and convert to lowercase
    option.textContent = state;
    selectElement.appendChild(option);
  });
  </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>

</body>
</html>
