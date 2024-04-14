<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>complaint historty page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.17/jspdf.plugin.autotable.min.js"></script>
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

/* Adjust focus styles */
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

.table-bordered {
	border: 2px solid #000;
	border-radius: 10px;
}

.table-bordered thead th {
	background-color: #333;
	color: #fff;
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
	<div class="container mt-5">
		<div class="d-flex justify-content-center">
			<button id="downloadPDF" class="btn btn-primary">Download
				All Complaints</button>
		</div>
		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Incident Timing</th>
					<th>Place</th>
					<th>About Incident</th>
					<th>Complaint Number</th>
					<th>Status</th>
					<th>DownloadPDF</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${complaints}" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.email}</td>
						<td>${item.phoneNumber}</td>
						<td>${item.incidentTiming}</td>
						<td>${item.place}</td>
						<td>${item.aboutIncident}</td>
						<td>${item.complaintNumber}</td>
						<td>${item.status}</td>
						<td>
							<button type="button" class="btn btn-success"
								onclick="downloadPDF('${item.id}', '${item.name}'
								, '${item.email}','${item.phoneNumber}','${item.incidentTiming}',
								'${item.place}','${item.aboutIncident}','${item.complaintNumber}',
								'${item.status}')">Download
								PDF</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		document.getElementById("downloadPDF").addEventListener("click",
				function() {
					var doc = new jsPDF();
					doc.autoTable({
						html : 'table',
						theme : 'grid'
					});
					doc.save('complaints.pdf');
				});
	</script>
	<!-------------------------DOWNLOAD COMPALINT PDF FILE ------------------>
     <script>
     function downloadPDF(id, name, email, phoneNumber, incidentTiming, place, aboutIncident, complaintNumber, status) {
    	    // Now you can access the complaint details correctly
    	
    	    // Initialize jsPDF
    	    var doc = new jsPDF();

    	    // Add page border
    	    doc.rect(5, 5, 200, 280); // Border with (x, y, width, height)

    	    // Add header
    	    doc.setFontSize(20);
    	    doc.setFont("bold");
    	    doc.text("Women Security App", 70, 18, {
    	        align: "center"
    	    });

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
    	    doc.text("Registered Complaint Details", 70, 35, {
    	        align: "center"
    	    });
    	    doc.setFontSize(10);
    	    doc.text("Complaint number: " + complaintNumber, 70, 40, {
    	        align: "center"
    	    });
    	    doc.text("Complaint ID: " + id, 10, 50);
    	    doc.text("Name: " + name, 10, 60);
    	    doc.text("Incident Timing: " + incidentTiming, 10, 70);
    	    doc.text("Place: " + place, 10, 80);
    	    doc.text("About Incident: " + aboutIncident, 10, 90);
    	    doc.text("Phone Number: " + phoneNumber, 10, 100);
    	    doc.text("Email: " + email, 10, 110);
    	    doc.text("Complaint Number: " + complaintNumber, 10, 120);
    	    doc.text("Complaint status: " + status, 10, 130);

    	    // Add signature at the bottom
    	    doc.text("Signature", 170, 240, {
    	        align: "center"
    	    });

    	    // Set font size and color for the footer
    	    doc.setFontSize(10);
    	    doc.setTextColor(0, 0, 0);

    	    // Define the content for the footer
    	    var websiteLink = "http://localhost:8080/WomenSecurityApps";
    	    var emailFooter = "womensecurityapp@gmail.com";
    	    var phoneNumberFooter = "+919834567890";
    	    var officeAddress = "123 Main Street, bengaluru, karntaka, india";

    	    // Calculate the position for the footer
    	    var footerX = 15;
    	    var footerY = doc.internal.pageSize.height - 10; // Position it 10 mm from the bottom

    	    // Add the content to the footer within the border
    	    doc.text(footerX + 60, footerY - 5, "Website: " + websiteLink);
    	    doc.text(footerX, footerY - 10, "Email: " + emailFooter);
    	    doc.text(footerX + 60, footerY - 10, "Phone: " + phoneNumberFooter);
    	    doc.text(footerX + 110, footerY - 10, "Address: " + officeAddress);

    	    // Save the PDF with a name
    	    doc.save("complaint_details_" + complaintNumber + ".pdf");
    	}

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
