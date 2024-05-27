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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<!-- <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script> -->
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Raleway', sans-serif;
}

body {
	background: linear-gradient(90deg, #e6e6fa, #b0c4de);
}

.navbar {
	background-color: black;
	min-height: 60px;
}

.navbar-brand img {
	border-radius: 50%;
}

#compnyName {
	color: white;
	font-style: italic;
	font-weight: bolder;
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
	background-color: blue;
	color: blue;
}

.dropdown-menu a.dropdown-item:focus, .dropdown-menu a.dropdown-item:hover
	{
	background-color: blue;
	color: #fff;
	border-color: #007bff;
}

.sidebar {
	background-color: black;
	color: #fff;
	padding: 10px;
	/* width: 170px; Remove fixed width */
	/* height: calc(100vh - 60px); Remove fixed height */
}

@media ( min-width : 768px) {
	.sidebar {
		/* Apply styles only for medium and larger screens */
		/* position: fixed; */
		top: 0px;
		left: 0;
		width: 200px; /* Adjust width for medium screens */
		height: calc(100vh - 60px);
		z-index: 900;
	}
}

.card-header, .card-body, .form-label {
	color: black;
}

.card-header {
	background-color: #007bff;
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

.custom-width-modal .modal-dialog {
	width: 50%;
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

#categoryFilter {
	color: white;
	background-color: #343a40;
	font-weight: bold;
	height: 40px;
}

#categoryFilter option {
	font-weight: bold;
}

.table-responsive {
	max-height: 87vh;
	overflow-y: auto;
}

.table-fixed thead {
	position: sticky;
	top: 0;
	z-index: 1;
	background-color: #343a40;
}

.table-fixed thead th {
	color: #fff;
}

.navbar-toggler {
	color: white;
	background-color: white;
}

#orderHistoryHead, #vendorTable, #productTable, #allOrderHistortyTable,
	#orderStatusTbale, #orderTableHead {
	color: black;
	font-weight: bolder;
	text-align: center;
	display: block;
	margin: auto;
	width: fit-content;
}
</style>
<body>
	<!-- Navbar navbar-light bg-light -->
	<nav class="navbar navbar-expand-lg ">
		<a class="navbar-brand" href="#"> <img
			src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png"
			alt="logo" width="70" height="40"
			class="d-inline-block align-text rounded-circle">
		</a> <span id="compnyName">VendorManagement</span>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="fas fa-bell"></i>
				</a></li>
				<li class="nav-item dropdown profile-dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-user fa-lg"
						style="color: white; background-color: black;"></i> <span
						id="userName"></span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a href="http://localhost:8080/vendorManagementSystem/homePage"
							class="dropdown-item"> <i class="fas fa-home"></i> Home
						</a> <a
							href="http://localhost:8080/vendorManagementSystem/admin/adminLoginPage"
							class="dropdown-item"> <i class="fas fa-sign-out-alt"></i>
							Logout
						</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<!-- Sidebar -->
	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<nav class="col-md-2  sidebar" style="background-color: black">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item">
							<!-- <form id="getproductDetails"> --> <input type="hidden"
							id="email" name="email" value="${email}"> <a
							class="nav-link" id="viewButton" role="button"><i
								class="fas fa-store"></i>view vendors</a> <!-- </form> -->
						</li>
						<li class="nav-item"><a class="nav-link"
							id="productDeatailsButton" role="button"> <i
								class="fas fa-cubes"></i>view Products
						</a></li>
						<li class="nav-item"><a class="nav-link"
							id="getOrderDetailsButton" role="button"><i
								class="fas fa-clipboard-list"></i>Orders</a></li>
						<li class="nav-item"><a class="nav-link"
							id="getOrdersStatusBtn" role="button"><i
								class="fas fa-check-circle"></i>Orders Status</a></li>
						<li class="nav-item"><a class="nav-link" id="getOrderHistory"
							role="button"><i class="fas fa-history"></i>Orders history</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							id="getOrderPaymentList" role="button"> <i
								class="fas fa-money-check-alt"></i>Payments
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							role="button" id="getAllAnnouncement"> <i
								class="fas fa-bullhorn"></i> Announcement
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							role="button" data-toggle="modal"
							data-target="#adminMessageModal"> <i class="fas fa-envelope"></i>Send
								Messages
						</a></li>
					</ul>
				</div>
			</nav>
			<main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
				<!------------------------------- User details table-------------------------------- -->
				<div class="table-responsive" id="userDetailsTableContainer"
					style="display: none;">
					<div class="row mb-3">
						<div class="col">
							<h3 id="vendorTable">Vendor Details</h3>
						</div>
						<div class="col-3">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search..."
									aria-label="Search" id="searchInput">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="searchButton">Search</button>
								</div>
							</div>
						</div>
					</div>
					<table id="userDetailsTable"
						class="table table-bordered table-hover table-fixed">
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
								<th>Image</th>
								<th>Name</th>
								<th>Email</th>
								<th>Contact Number</th>
								<th>AltContact Number</th>
								<th>vendorName</th>
								<th>GSTNumber</th>
								<th>StartDate</th>
								<th>WebSite</th>
								<th>Address</th>
								<th>PinCode</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<!-- Table body content goes here -->
						</tbody>
					</table>
				</div>

				<!------------------ productDetailsTableContainer details table---------- -->
				<div class="table-responsive" id="productDetailsTableContainer"
					style="display: none;">
					<div class="row mb-3">
						<div class="col">
							<h3 id="productTable">All Product Details</h3>
						</div>
						<div class="col-3">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search..."
									aria-label="Search" id="searchInput">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="searchButton">Search</button>
								</div>
							</div>
						</div>
					</div>
					<table id="productDetailsTable"
						class="table table-bordered table-hover table-fixed">
						<!-- Table headers -->
						<thead class="thead-dark top-fixed">
							<tr>
								<th>SlNo</th>
								<th>ProductID</th>
								<th>VendorName</th>
								<th><select id="categoryFilter">
										<option value="">All Categories</option>
										<option value="grocery">Grocery</option>
										<option value="electronics">Electronics</option>
										<option value="cloths">Cloth's</option>
										<option value="home_furnitures">Home and Furniture's</option>
										<option value="cosmetics">Cosmetics</option>
										<option value="appliances">Appliances</option>
								</select></th>
								<th>ProductName</th>
								<th>ProductPrice</th>
								<th>DeliveryCharge</th>
								<th>DescriptionAboutProduct</th>
								<th>Available</th>
								<!-- <th>orderStatus</th> -->
								<th>Action</th>
								<th>vendor</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<!-------------------------------- order table container ----------------------------------- -->
				<div class="table-responsive" id="orderTableContainer"
					style="display: none;">
					<div class="row mb-3">
						<div class="col">
							<h3 id="orderTableHead">Order Details</h3>
						</div>
						<div class="col-3">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search..."
									aria-label="Search" id="searchInput">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="searchButton">Search</button>
								</div>
							</div>
						</div>
					</div>
					<span id="noOrders" style="color: red; text-align: center;"></span>
					<table id="orderDetailsTable"
						class="table table-bordered table-hover table-fixed">
						<!-- Table headers -->
						<thead class="thead-dark">
							<tr>
								<th>SLno</th>
								<th>OrderID</th>
								<th>productName</th>
								<th>productPrice</th>
								<th>deliveryCharge</th>
								<th>descriptionAboutProduct</th>
								<th>orderDate</th>
								<th>orderQuantity</th>
								<th>deliveryAddress</th>
								<th>deliveryDate</th>
								<th>message</th>
								<th>orderStatus</th>
								<th>Edit</th>
								<th>Delete</th>
								<!-- New column for action buttons -->
							</tr>
						</thead>
						<tbody>
							<!-- Data will be displayed here -->
						</tbody>
					</table>
				</div>
				<!-------------------------------orderStatusTableContainer start here ------------------------------->
				<div class="table-responsive" id="orderStatusTableContainer"
					style="display: none;">
					<div class="row mb-3">
						<div class="col">
							<h3 id="orderStatusTbale">Order Status Details</h3>
						</div>
						<div class="col-3">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search..."
									aria-label="Search" id="searchInput">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="searchButton">Search</button>
								</div>
							</div>
						</div>
					</div>
					<span id="noOrders" style="color: red; text-align: center;"
						style="display: none;"></span>
					<table id="orderStatusTable"
						class="table table-bordered table-hover table-fixed">
						<!-- Table headers -->
						<thead class="thead-dark">
							<tr>
								<th>SLno</th>
								<th>OrderID</th>
								<th>productName</th>
								<th>productPrice</th>
								<th>deliveryCharge</th>
								<th>descriptionAboutProduct</th>
								<th>orderDate</th>
								<th>orderQuantity</th>
								<th>deliveryAddress</th>
								<th>deliveryDate</th>
								<th>message</th>
								<th>orderStatus</th>
								<th>paymentStatus</th>
								<th>action</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<!-------------------------------  order history table -------------------------->
				<div class="table-responsive" id="orderHistoryTableContainer"
					style="display: none;">
					<div class="row mb-3">
						<div class="col">
							<h3 id="allOrderHistortyTable">All Order History Details</h3>
						</div>
						<div class="col-3">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Search..."
									aria-label="Search" id="searchInput">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" type="button"
										id="searchButton">Search</button>
								</div>
							</div>
						</div>
					</div>
					<span id="noOrders" style="color: red; text-align: center;"
						style="display: none;"></span>
					<table id="orderHistoryTable"
						class="table table-bordered table-hover table-fixed">
						<!-- Table headers -->
						<thead class="thead-dark">
							<tr>
								<th>SLno</th>
								<th>OrderID</th>
								<th>productName</th>
								<th>productPrice</th>
								<th>deliveryCharge</th>
								<th>descriptionAboutProduct</th>
								<th>orderDate</th>
								<th>orderQuantity</th>
								<th>deliveryAddress</th>
								<th>deliveryDate</th>
								<th>message</th>
								<th>orderStatus</th>
								<th>PaymentStatus</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<!-------------------------  Payment Summary table -------------------------->
				<div id="paymentAndSummaryContainer" style="display: none;">
					<!-- Payment Summary -->

					<div class="row  mt-1">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title text-center mb-4">
										<i class="fas fa-money-bill-wave"></i> Payment Summary
									</h5>
									<div class="row">
										<div class="col-lg-4">
											<div class="form-group">
												<label><i class="fas fa-money-check-alt"></i> Total
													Amount to Pay:</label> <input type="text" class="form-control"
													id="totalAmountToPay" readonly>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label><i class="fas fa-money-check"></i> Amount
													Paid:</label> <input type="text" class="form-control"
													id="amountPaid" readonly>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label><i class="fas fa-coins"></i> Remaining
													Balance:</label> <input type="text" class="form-control"
													id="remainingBalance" readonly>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<h4 id="orderHistoryHead">All Orders Payment Details</h4>
						<!-- Payment Table -->
						<div class="col-lg-12 mt-3">
							<div class="table-responsive">
								<table id="paymentDetailsTable"
									class="table table-bordered table-hover table-fixed">
									<!-- Table headers -->
									<thead class="thead-dark">
										<tr>
											<th>orderID</th>
											<th>productName</th>
											<th>productPrice</th>
											<th>deliveryCharge</th>
											<th>Quantity</th>
											<th>orderStatus</th>
											<th>orderAmount</th>
											<th>paymentStatus</th>
											<!-- New column for action buttons -->
										</tr>
									</thead>
									<tbody>
										<!-- Data will be displayed here -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div id="announcementContainer" style="display: none;">
					<h1 class="mb-4">Announcements</h1>
					<button id="addAnnouncementBtn" class="btn btn-primary mb-4"
						data-toggle="modal" data-target="#announcementModal">
						<i class="fas fa-plus"></i> Add Announcement
					</button>
					<div class="col-lg-12 mt-3">
						<div class="table-responsive">
							<table id="AnnouncementDetailsTable"
								class="table table-bordered table-hover table-fixed">
								<!-- Table headers -->
								<thead class="thead-dark">
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Title</th>
										<th scope="col">message</th>
										<th scope="col">Actions</th>
										<!-- New column for action buttons -->
									</tr>
								</thead>
								<tbody>
									<!-- Data will be displayed here -->
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>
		</div>
	</div>
	<!-- ----------------------Modal for editing user details custom-width-modal------------ -->
	<div class="modal fade custom-width-modal " id="editUserModal"
		tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="editUserModalLabel">
						vendor Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h3 class="text-center">Personal Details</h3>
					<div class="row">
						<!-- Personal Details -->
						<div class="col-md-8">
							<p>
								<strong>Vendor ID:</strong> <span id="vendorId"></span>
							</p>
							<p>
								<strong><i class="fa-solid fa-user"></i>Owner Name:</strong> <span
									id="ownerName"></span>
							</p>
							<p>
								<strong><i class="fa-solid fa-envelope"></i>Email:</strong> <span
									id="email"></span>
							</p>
							<p>
								<strong><i class="fa-solid fa-phone"></i>Contact
									Number:</strong> <span id="contactNumber"></span>
							</p>
							<p>
								<strong><i class="fa-solid fa-phone"></i>Alternate
									Contact Number:</strong> <span id="altContactNumber"></span>
							</p>
						</div>

						<!-- User Photo -->
						<div class="col-md-4 text-center">
							<div class="round-image mb-3"
								style="height: 100px; width: 100px; overflow: hidden; border-radius: 50%;">
								<img id="userPhoto"
									src="http://localhost:8080/vendorManagementSystem/admin/display?email="
									alt="User Photo" style="width: 100%; height: auto;">
							</div>
						</div>
					</div>
					<h3 class="text-center">Business Details</h3>
					<div class="row justify-content-center">
						<div class="col-md-6">
							<p>
								<strong><i class="fa-solid fa-user"></i>Vendor Name:</strong> <span
									id="vendorName"></span>
							</p>
							<p>
								<strong><i class="fa-solid fa-pencil"></i>GST Number:</strong> <span
									id="GSTNumber"></span>
							</p>
							<p>
								<strong><i class="fa-solid fa-date"></i>Start Date:</strong> <span
									id="startDate"></span>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<strong><i class="fa-solid fa-globe"></i>WebSite:</strong> <span
									id="website"></span>
							</p>
							<p>
								<strong><i class="fa-regular fa-building"></i>Address:</strong>
								<span id="address"></span>
							</p>
							<p>
								<strong><i class="fa-regular fa-building"></i>Pin Code:</strong>
								<span id="pincode"></span>
							</p>
						</div>
					</div>

					<p>
						<strong>vendor status:</strong> <input type="hidden" id="vendorId">
						<select class="form-control" id="VendorStatus" name="status"
							required>
							<option value="">Select Availability</option>
							<option value="pending">Pending</option>
							<option value="approved">Approved</option>
						</select>
					</p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="saveChangesBtn" type="button" class="btn btn-primary"
						onclick="saveVendorStatus()">Save Changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-----------------------------------------  -->
	<!-- Vendor Success Modal -->
	<div class="modal fade" id="vendorSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="vendorSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Vendor status updated successfully.</div>
			</div>
		</div>
	</div>

	<!-- Vendor Error Modal -->
	<div class="modal fade" id="vendorErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="vendorErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while updating
					vendor status.</div>
			</div>
		</div>
	</div>
	<!-- Ordered      ProductModal details -->
	<div class="modal fade" id="OrderProductModal" tabindex="-1"
		role="dialog" aria-labelledby="OrderProductModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="OrderProductModalLabel">
						<i class="fas fa-info-circle"></i> Product Details
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-user"></i> Vendor Name:</strong><span
								id="PvendorName"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-cube"></i> Product ID:</strong><span
								id="ProductId"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-list"></i> Category:</strong> <span
								id="category"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-shopping-bag"></i> Product
								Name:</strong> <span id="productName"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-dollar-sign"></i> Product
								Price:</strong> <span id="productPrice"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-truck"></i> Delivery Charge:</strong> <span
								id="deliveryCharge"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-check-circle"></i> Available:</strong> <span
								id="available"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-info-circle"></i> Description
								About Product:</strong> <span id="descriptionAboutProduct"></span>
						</div>
					</div>
					<fieldset>
						<legend>
							<i class="fas fa-tasks"></i> Fill Order Details
						</legend>
						<form id="OrderProductForm">
							<input type="hidden" id="orderProductId" name="productId">
							<input type="hidden" id="ordervendorId" name="vendorId">
							<div id="orderFields">
								<label for="orderStatus"><i class="fas fa-check-circle"></i>
									Order Status:</label> <input type="text" id="orderStatus"
									class="form-control" name="orderStatus" value="Order"
									readonly="readonly"> <label for="quantity"><i
									class="fas fa-sort-numeric-up"></i> Quantity:</label> <input
									type="text" id="quantity" name="orderQuantity"
									class="form-control"> <label for="deliveryDate"><i
									class="far fa-calendar-alt"></i> Delivery Date:</label> <input
									type="date" id="deliveryDate" name="deliveryDate"
									class="form-control"> <label for="deliveryAddress"><i
									class="fas fa-map-marker-alt"></i> Delivery Address:</label> <input
									type="text" id="deliveryAddress" name="deliveryAddress"
									class="form-control"> <label for="message"><i
									class="far fa-comment"></i> Message:</label> <input type="text"
									id="message" class="form-control" name="message">
							</div>
						</form>
					</fieldset>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="submitOrderBtn" type="button" class="btn btn-primary">
						<i class="fas fa-save"></i> Submit
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------------------------------------------- -->
	<!-- Order Success Modal -->
	<div class="modal fade" id="orderSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="orderSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Order placed successfully.</div>
			</div>
		</div>
	</div>

	<!-- Order Error Modal -->
	<div class="modal fade" id="orderErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="orderErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while placing the
					order.</div>
			</div>
		</div>
	</div>
	<!--------------------- Edit Ordered Product Modal details code---------------- -->
	<div class="modal fade" id="editOrderProductModal" tabindex="-1"
		role="dialog" aria-labelledby="OrderProductModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="OrderProductModalLabel">
						<i class="fas fa-edit"></i> Edit Order Details
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-tag"></i> Order ID:</strong><span
								id="editOrderId"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-cube"></i> Product ID:</strong><span
								id="ProductId"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-user"></i> Vendor Name:</strong><span
								id="PvendorName"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-shopping-bag"></i> Product
								Name:</strong> <span id="productName"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-dollar-sign"></i> Product
								Price:</strong> <span id="productPrice"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-truck"></i> Delivery Charge:</strong> <span
								id="deliveryCharge"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-check-circle"></i> Available:</strong> <span
								id="available"></span>
						</div>
						<div class="col-md-6">
							<strong><i class="fas fa-info-circle"></i> Description
								About Product:</strong> <span id="descriptionAboutProduct"></span>
						</div>
					</div>
					<fieldset>
						<legend>
							<i class="fas fa-tasks"></i> Fill Order Details
						</legend>
						<form id="UpdateOrderProductForm">
							<input type="hidden" id="editOrderId" name="orderId">
							<div id="orderFields">
								<label for="orderStatus"><i class="fas fa-check-circle"></i>
									Order Status:</label> <input type="text" id="orderStatus"
									class="form-control" name="orderStatus" value="Order"
									readonly="readonly"> <label for="quantity"><i
									class="fas fa-sort-numeric-up"></i> Quantity:</label> <input
									type="text" id="quantity" name="orderQuantity"
									class="form-control"> <label for="deliveryDate"><i
									class="far fa-calendar-alt"></i> Delivery Date:</label> <input
									type="date" id="deliveryDate" name="deliveryDate"
									class="form-control"> <label for="deliveryAddress"><i
									class="fas fa-map-marker-alt"></i> Delivery Address:</label> <input
									type="text" id="deliveryAddress" name="deliveryAddress"
									class="form-control"> <label for="message"><i
									class="far fa-comment"></i> Message:</label> <input type="text"
									id="message" class="form-control" name="message">
							</div>
						</form>
					</fieldset>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="UpdateSubmitOrderBtn" type="button"
						class="btn btn-primary">
						<i class="fas fa-save"></i> Submit
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- edit Order Success Modal -->
	<div class="modal fade" id="editOrderSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="editOrderSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Order updated successfully.</div>
			</div>
		</div>
	</div>

	<!-- edit Order Error Modal -->
	<div class="modal fade" id="editOrderErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="editOrderErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while updated the
					order.</div>
			</div>
		</div>
	</div>

	<!-------------------- ordered cancel  Modal code ------------>
	<div class="modal fade" id="cancelOrderModal" tabindex="-1"
		role="dialog" aria-labelledby="cancelOrderModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancelOrderModalLabel">Cancel
						Order</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to cancel this order?</p>
					<input type="hidden" id="cancelOrderId" name="cancelOrderId">
					<input type="hidden" id="cancelOrderStatus"
						name="cancelOrderStatus" value="order cancelled">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="confirmCancelOrderButton" type="button"
						class="btn btn-danger">Confirm Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-------------------- order success cancel Modal ------------->
	<div class="modal fade" id="ordersuccessCancelModal" tabindex="-1"
		role="dialog" aria-labelledby="ordersuccessCancelModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">order successfully cancelled!</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="orderCancelErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="orderCancelErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while placing the
					order.</div>
			</div>
		</div>
	</div>
	<!-------------------------------------------------------UPDATE  ORDERS STATUS OR AMOUNT PAY  MODAL------------>
	<div class="modal fade" id="editOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="editOrderModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editOrderModalLabel">
						<i class="fas fa-info-circle"></i> Order Details
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<strong><i class="fas fa-tag"></i> Order ID:</strong> <span
									id="orderId"></span>
							</div>
							<div class="col-md-6">
								<strong><i class="fas fa-cube"></i> Product Name:</strong> <span
									id="productName"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<strong><i class="fas fa-dollar-sign"></i> Product
									Price:</strong> <span id="productPrice"></span>
							</div>
							<div class="col-md-6">
								<strong><i class="fas fa-truck"></i> Delivery Charge:</strong> <span
									id="deliveryCharge"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<strong><i class="fas fa-info"></i> Description About
									Product:</strong> <span id="descriptionAboutProduct"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-7">
								<strong><i class="far fa-calendar-alt"></i> Order Date:</strong>
								<span id="orderDate"></span>
							</div>
							<div class="col-md-5">
								<strong><i class="fas fa-shopping-cart"></i> Order
									Quantity:</strong> <span id="orderQuantity"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<strong><i class="far fa-calendar-check"></i> Delivery
									Date:</strong> <span id="deliveryDate"></span>
							</div>
							<div class="col-md-6">
								<strong><i class="fas fa-map-marker-alt"></i> Delivery
									Address:</strong> <span id="deliveryAddress"></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<strong><i class="far fa-comment"></i> Message:</strong> <span
									id="message"></span>
							</div>
							<div class="col-md-6">
								<strong><i class="fas fa-info-circle"></i> Order
									Status:</strong> <span id="orderStatus"></span>
							</div>
						</div>
						<!-- Invoice form section -->
						<form id="invoiceForm" enctype="multipart/form-data">
							<input type="hidden" id="orderId" name="orderId">
							<div class="row">
								<div class="col-md-6">
									<strong><i class="fas fa-money-check"></i> Payment:</strong> <select
										id="paymentStatusSelect" class="form-control">
										<option value="">Select option</option>
										<option value="paid">Paid</option>
										<option value="unpaid">Not Paid</option>
									</select> <br>
									<div id="uploadInvoiceSection" style="display: none;">
										<strong><i class="far fa-receipt"></i> Bill Receipt:</strong>
										<input type="file" class="form-control" id="fileInput"
											name="file" accept=".pdf"><br>
									</div>
								</div>
								<div class="col-md-6">
									<strong><i class="fas fa-info-circle"></i> Order
										Status:</strong> <select id="orderStatusSelect" class="form-control">
										<option value="">Select option</option>
										<option value="received">Received</option>
										<option value="notReceived">Not Received</option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="submitUpdateOrderStatusBtn" type="button"
						class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- UPDATE  ORDERS STATUS OR AMOUNT PAY    Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Operation completed successfully.</div>
			</div>
		</div>
	</div>

	<!-- UPDATE  ORDERS STATUS OR AMOUNT PAY Error Modal -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="errorModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred.</div>
			</div>
		</div>
	</div>
	<!------------------------------------------------- Announcement Modal -->
	<div class="modal fade" id="announcementModal" tabindex="-1"
		role="dialog" aria-labelledby="announcementModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="announcementModalLabel">Add
						Announcement</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="announcementForm">
						<div class="form-group">
							<label for="title">Title</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-heading"></i>
									</span>
								</div>
								<input type="text" class="form-control" id="title" name="title"
									required>
							</div>
						</div>
						<div class="form-group">
							<label for="message">Description</label>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-align-left"></i>
									</span>
								</div>
								<textarea class="form-control" id="message" name="message"
									required></textarea>
							</div>
						</div>
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-save"></i> Save Announcement
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--  successAnnouncementModal -->
	<div class="modal fade" id="successAnnouncementModal" tabindex="-1"
		role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Announcement saved successfully.</div>
			</div>
		</div>
	</div>

	<!--   error Announcement Modal -->
	<div class="modal fade" id="errorAnnouncementModal" tabindex="-1"
		role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while saving
					Announcement.</div>
			</div>
		</div>
	</div>
	<!-- Delete  Announcement Confirmation Modal -->
	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1"
		role="dialog" aria-labelledby="deleteConfirmationModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteConfirmationModalLabel">Confirm
						Deletion</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure you want to delete this
					announcement?</div>
				<input type="hidden" id="announcementID">
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button id="confirmDeleteBtn" type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<!--  deleteAnnouncementModal -->
	<div class="modal fade" id="successDeleteAnnouncementModal"
		tabindex="-1" role="dialog" aria-labelledby="successModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Announcement deleted successfully.</div>
			</div>
		</div>
	</div>

	<!--   error Announcement Modal -->
	<div class="modal fade" id="errorDeleteAnnouncementModal" tabindex="-1"
		role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while deleting
					Announcement.</div>
			</div>
		</div>
	</div>


	<!-- --------------------------------------------Send  Message Modal---------------------- -->
	<div class="modal fade" id="adminMessageModal" tabindex="-1"
		role="dialog" aria-labelledby="adminMessageModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="adminMessageModalLabel">Send
						Message</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="subject">Subject:</label> <input type="text"
							class="form-control" id="subject" name="subject"
							placeholder="enter subject">
					</div>
					<div class="form-group">
						<label for="message">Message:</label>
						<textarea class="form-control" id="sendMessages" rows="3"></textarea>
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="sendToAll"
							onchange="toggleEmailInput()"> <label
							class="form-check-label" for="sendToAll">Send to everyone</label>
					</div>
					<div id="emailInputGroup">
						<div class="form-group">
							<label for="recipientEmail">Recipient Email:</label> <input
								type="email" class="form-control" id="recipientEmail"
								placeholder="Enter recipient email">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="sendMessage()">
						<i class="fas fa-paper-plane"></i> Send
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Message Success Modal   Success Modal -->
	<div class="modal fade" id="MessageSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="MessageSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">message sent successfully.</div>
			</div>
		</div>
	</div>

	<!-- Message Error Modal -->
	<div class="modal fade" id="MessageErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="MessageErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred.</div>
			</div>
		</div>
	</div>

	<!-------------------------------- this API is getting all vendor List and save vendor status------------------>
	<script>
    // Define a function to fetch vendors data
    function getVendors() {
        $("#productDetailsTableContainer").hide();
        $("#orderTableContainer").hide();
        $("#orderHistoryTableContainer").hide();
        $("#orderStatusTableContainer").hide();
        $("#paymentAndSummaryContainer").hide();
        $("#announcementContainer").hide();
        $("#userDetailsTableContainer").toggle();
        if ($("#userDetailsTableContainer").is(":visible")) {
            $
                    .ajax({
                        url : "getUserData",
                        type : "GET",
                        dataType : "json",
                        success : function(data) {
                            console.log(data);
                            $("#userDetailsTable tbody").empty();
                            $
                                    .each(
                                            data,
                                            function(index, item) {
                                                var row = "<tr>" + "<td>"
                                                        + item.id
                                                        + "</td>"
                                                        + "<td><img src='display?imagePath="
                                                        + item.imagePath
                                                        + "' alt='Profile Picture' width='50' height='50'></td>"
                                                        + "<td>"
                                                        + item.ownerName
                                                        + "</td>"
                                                        + "<td class='edit-email'>"
                                                        + item.emailId
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.contactNumber
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.altContactNumber
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.vendorName
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.gstnumber
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.startDate
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.website
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.address
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.pincode
                                                        + "</td>"
                                                        + "<td>"
                                                        + item.status
                                                        + "</td>"
                                                        + "<td><button class='btn btn-primary btn-sm' onclick='editVendor("
                                                        + JSON
                                                                .stringify(item)
                                                        + ")'><i class='fas fa-eye'></i>view</button></td>"
                                                        + "</tr>";
                                                $("#userDetailsTable tbody")
                                                        .append(row);
                                            });
                        },
                        error : function(xhr, status, error) {
                            alert("Failed to fetch user data from server.");
                            console.error(error);
                        }
                    });
        }
    }

    // Click event handler for #viewButton
    $("#viewButton").click(function() {
        getVendors();
    });

    function editVendor(vendor) {
        console.log(vendor);
        $('#editUserModal').modal('show');
        $('#vendorId').val(vendor.id);
        $('#vendorId').text(vendor.id);
        $('#ownerName').text(vendor.ownerName);
        $('#editUserModal #email').text(vendor.emailId);
        var userEmail = vendor.emailId;
        $('#userPhoto').attr(
                'src',
                'http://localhost:8080/vendorManagementSystem/admin/display?imagePath='
                        + vendor.imagePath);
        $('#contactNumber').text(vendor.contactNumber);
        $('#altContactNumber').text(vendor.altContactNumber);
        $('#vendorName').text(vendor.vendorName);
        $('#GSTNumber').text(vendor.gstnumber);
        $('#startDate').text(vendor.startDate);
        $('#website').text(vendor.website);
        $('#address').text(vendor.address);
        $('#pincode').text(vendor.pincode);
        $('#VendorStatus').val(vendor.status);
    }

    function saveVendorStatus() {
        var vendorId = $('#vendorId').val();
        var status = $('#VendorStatus').val();
        console.log('saveVendorStatus');

        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/vendorManagementSystem/admin/updateVendorStatus',
            data: {
                id: vendorId,
                status: status
            },
            success: function(response) {
                if (response.includes("updateVendorStatusSuccessfully")) {
                    console.log('Vendor status updated successfully');
                    $('#editUserModal').modal('hide');
                    getVendors(); // Refresh vendors details
                    // Show success modal
                    $('#vendorSuccessModal').modal('show');
                    // Hide success modal after 3 seconds
                    setTimeout(function() {
                        $('#vendorSuccessModal').modal('hide');
                    }, 3000);
                   // getVendors();
                } else {
                    console.log('Vendor status update failed');
                    $('#editUserModal').modal('hide');
                    // Show error modal
                    $('#vendorErrorModal').modal('show');
                    // Hide error modal after 3 seconds
                    setTimeout(function() {
                        $('#vendorErrorModal').modal('hide');
                    }, 3000);
                }
            },
            error: function(xhr, status, error) {
                const errorMessage = "An error occurred while updating vendor status: " + error;
                $('#vendorErrorMessage').text(errorMessage);
                $('#editUserModal').modal('hide');
                // Show error modal
                $('#vendorErrorModal').modal('show');
                // Hide error modal after 3 seconds
                setTimeout(function() {
                    $('#vendorErrorModal').modal('hide');
                }, 3000);
            }
        });
    }

</script>
	
	<!-------------------------- this API is getting all product List ------------------------------->
	<script>
		$(document)
				.ready(
						function() {
							$("#productDeatailsButton")
									.click(
											function() {
												$("#announcementContainer").hide();
												$("#userDetailsTableContainer")
														.hide();
												$("#orderTableContainer")
														.hide();
												$("#orderStatusTableContainer")
														.hide();
												$("#orderHistoryTableContainer")
														.hide();
												$("#paymentAndSummaryContainer")
												.hide();
												$(
														"#productDetailsTableContainer")
														.toggle();
												if ($(
														"#productDetailsTableContainer")
														.is(":visible")) {
													$
															.ajax({
																url : "getAllProducts",
																type : "GET",
																dataType : "json",
																success : function(
																		ProductData) {
																	$(
																			"#productDetailsTable tbody")
																			.empty();
																	$
																			.each(
																					ProductData,
																					function(
																							index,
																							item) {
																						var slno = index + 1;
																						var row = "<tr>"
																								+ "<td>"
																								+ slno
																								+ "</td>"
																								+ "<td>"
																								+ item.id
																								+ "</td>"
																								+ "<td>"
																								+ item.vendor.vendorName
																								+ "</td>"
																								+ "<td>"
																								+ item.category
																								+ "</td>"
																								+ "<td>"
																								+ item.productName
																								+ "</td>"
																								+ "<td>"
																								+ item.productPrice
																								+ "</td>"
																								+ "<td>"
																								+ item.deliveryCharge
																								+ "</td>"
																								+ "<td>"
																								+ item.descriptionAboutProduct
																								+ "</td>"
																								+ "<td>"
																								+ item.available
																								+ "</td>"
																								+ "<td><button class='btn btn-warning btn-sm' onclick='orderProduct("
																								+ JSON.stringify(item)
																								+ ")'><i class='fas fa-shopping-cart'></i> Order</button></td>"
																								+ "<td><button class='btn btn-primary btn-sm' onclick='editVendor("
																								+ JSON.stringify(item.vendor)
																								+ ")'><i class='fas fa-eye'></i>Vendor</button></td>"
																								+ "</tr>";
																						$(
																								"#productDetailsTable tbody")
																								.append(
																										row);
																					});
																},
																error : function(
																		xhr,
																		status,
																		error) {
																	alert("Failed to fetch complaint data from server.");
																	console
																			.error(error);
																}
															});
												}
											});
						});

		function orderProduct(product) {
			console.log(product);
			$('#OrderProductModal').modal('show');
			$('#orderProductId').val(product.id);
			$('#ordervendorId').val(product.vendor.id);
			$('#ProductId').text(product.id);
			$('#PvendorName').text(product.vendor.vendorName);
			$('#category').text(product.category);
			$('#productName').text(product.productName);
			$('#productPrice').text(product.productPrice);
			$('#deliveryCharge').text(product.deliveryCharge);
			$('#descriptionAboutProduct').text(product.descriptionAboutProduct);
			$('#editProductModal #available').text(product.available);
		}
		// Define    save  OrderProduct function
// Define the OrderProduct function
function OrderProduct(formData) {
    $.ajax({
        url: 'http://localhost:8080/vendorManagementSystem/admin/orderProduct',
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            if (response === "Order Product successfully") {
            	 $('#OrderProductModal').modal('hide');
            	 fetchOrderDetails();
                $('#orderSuccessModal').modal('show'); // Show success modal
                setTimeout(function() {
                    $('#orderSuccessModal').modal('hide'); // Automatically hide success modal after 3 seconds
                }, 3000);
            } else {
            	$('#OrderProductModal').modal('hide');
                $('#orderErrorModal').modal('show'); // Show error modal if response is not successful
                setTimeout(function() {
                    $('#orderErrorModal').modal('hide'); // Automatically hide error modal after 3 seconds
                }, 3000);
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
            $('#OrderProductModal').modal('hide');
            $('#orderErrorModal').modal('show'); // Show error modal on AJAX error
            setTimeout(function() {
                $('#orderErrorModal').modal('hide'); // Automatically hide error modal after 3 seconds
            }, 3000);
        }
    });
}

// Click event handler for the submit button
$('#submitOrderBtn').click(function(event) {
    var formData = new FormData($('#OrderProductForm')[0]);
    OrderProduct(formData); // Call OrderProduct function with formData
});

		<!-- product table Function to filter by category----------------------------------->
			function filterByCategory() {
				var selectedCategory = document.getElementById("categoryFilter").value;
				var tableRows = document.getElementById("productDetailsTable")
						.getElementsByTagName("tbody")[0]
						.getElementsByTagName("tr");
				for (var i = 0; i < tableRows.length; i++) {
					var row = tableRows[i];
					var cell = row.getElementsByTagName("td")[3];
					if (cell) {
						if (selectedCategory === ""
								|| cell.textContent.trim() === selectedCategory) {
							row.style.display = "";
						} else {
							row.style.display = "none";
						}
					}
				}
			}

			// Add event listener to the dropdown menu
			document.getElementById("categoryFilter").addEventListener("change",
					filterByCategory);
	</script>
	<!--------------------------------------display  Admin order product Detail------------->
	<script>
		$(document).ready(function() {
			$("#getOrderDetailsButton").click(function(event) {
				event.preventDefault();
				fetchOrderDetails();
			});
		});

		function fetchOrderDetails() {
			$("#announcementContainer").hide();
			$("#productDetailsTableContainer").hide();
			$("#userDetailsTableContainer").hide();
			$("#orderHistoryTableContainer").hide();
			$("#orderStatusTableContainer").hide();
			$("#paymentAndSummaryContainer").hide();
			$
					.ajax({
						url : "getOrderDetailsByAdmin",
						type : "GET",
						dataType : "json",
						success : function(OrderDetails) {
							console.log(OrderDetails);
							if (OrderDetails && OrderDetails.length > 0) {
								$("#orderTableContainer").show();
								$("#orderDetailsTable tbody").empty();
								for (var i = 0; i < OrderDetails.length; i++) {
									var item = OrderDetails[i];
									var slno = i + 1;
									var row = "<tr>" + "<td>"
											+ slno
											+ "</td>"
											+ "<td>"
											+ item.orderId
											+ "</td>"
											+ "<td>"
											+ item.productName
											+ "</td>"
											+ "<td>"
											+ item.productPrice
											+ "</td>"
											+ "<td>"
											+ item.deliveryCharge
											+ "</td>"
											+ "<td>"
											+ item.descriptionAboutProduct
											+ "</td>"
											+ "<td>"
											+ item.orderDate
											+ "</td>"
											+ "<td>"
											+ item.orderQuantity
											+ "</td>"
											+ "<td>"
											+ item.deliveryAddress
											+ "</td>"
											+ "<td>"
											+ item.deliveryDate
											+ "</td>"
											+ "<td>"
											+ item.message
											+ "</td>"
											+ "<td>"
											+ item.orderStatus
											+ "</td>"
											+ "<td><button class='btn btn-primary btn-sm' onclick='editOrderDetails("
											+ JSON.stringify(item)
											+ ")'><i class='fas fa-edit'></i> Edit</button></td>"
											+ "<td><button class='btn btn-danger btn-sm' onclick='showCancelOrderModal("
											+ item.orderId
											+ ")'><i class='fas fa-times'></i> Cancel Order</button></td>"

											+ "</tr>";
									$("#orderDetailsTable tbody").append(row);
								}
							} else {
								$("#orderTableContainer").show();
								var noorders = 'No Orders found';
								$('#noOrders').text(noorders);
							}
						},
						error : function(xhr, status, error) {
							alert("Failed to fetch order data from server.");
							console.error(error);
						}
					});
		}

		function editOrderDetails(order) {
			console.log('Editing order:');
			console.log(order);

			// Check if product object is valid
			if (!order || typeof order !== 'object') {
				console.error('Invalid orders object.');
				return;
			}
			$('#editOrderProductModal').modal('show');
			$('#editOrderProductModal #editOrderId').val(order.orderId);
			$('#editOrderProductModal #editOrderId').text(order.orderId);
			$('#editOrderProductModal #ProductId').text(order.product.id);
			$('#editOrderProductModal #PvendorName').text(
					order.vendor.vendorName);
			$('#editOrderProductModal  #category').text(order.product.category);
			$('#editOrderProductModal #productName').text(order.productName);
			$('#editOrderProductModal #productPrice').text(order.productPrice);
			$('#editOrderProductModal #deliveryCharge').text(
					order.deliveryCharge);
			$('#editOrderProductModal #descriptionAboutProduct').text(
					order.descriptionAboutProduct);
			$('#editOrderProductModal #available')
					.text(order.product.available);
			$('#editOrderProductModal #quantity').val(order.orderQuantity);
			$('#editOrderProductModal #deliveryAddress').val(
					order.deliveryAddress);
			$('#editOrderProductModal #deliveryDate').val(order.deliveryDate);
			$('#editOrderProductModal #message').val(order.message);

		}
		/*--------------------------- edit admin order details Api -------------------------- */

		
		function updateOrderProduct(formData) {
    $.ajax({
        url: 'http://localhost:8080/vendorManagementSystem/admin/updateOrderProduct',
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            if (response === "update Order Product successfully") {
            	 $('#editOrderProductModal').modal('hide');
            	 fetchOrderDetails();
                $('#editOrderSuccessModal').modal('show'); // Show success modal
                setTimeout(function() {
                    $('#editOrderSuccessModal').modal('hide'); // Automatically hide success modal after 3 seconds
                }, 3000);
            } else {
            	$('#editOrderProductModal').modal('hide');
            	fetchOrderDetails();
                $('#editOrderErrorModal').modal('show'); 
                setTimeout(function() {
                    $('#editOrderErrorModal').modal('hide'); 
                }, 3000);
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
            $('#editOrderProductModal').modal('hide');
            $('#editOrderErrorModal').modal('show'); 
            setTimeout(function() {
                $('#editOrderErrorModal').modal('hide'); 
            }, 3000);
        }
    });
}

$('#UpdateSubmitOrderBtn').click(function(event) {
    var formData = new FormData($('#UpdateOrderProductForm')[0]);
    updateOrderProduct(formData); 
});

		/*--------------------------- edit admin cancel  order Api -------------------------- */
		 
		function showCancelOrderModal(orderId) {
			$('#cancelOrderModal').modal('show');
			$('#cancelOrderId').val(orderId);
			console.log("orderId", orderId);
		}

		function hideCancelOrderModal() {
			$('#cancelOrderModal').modal('hide');
		}

		$('#cancelOrderButton').click(function() {
			showCancelOrderModal();
		});

		$('#confirmCancelOrderButton')
				.click(
						function() {

							var orderId = document
									.getElementById('cancelOrderId').value;
							var orderStatus = document
									.getElementById('cancelOrderStatus').value;

							cancelOrder(orderId, orderStatus);
						});

		  function cancelOrder(orderId, orderStatus) {
		        console.log("cancelOrder Id", orderId);
		        console.log("cancel orderStatus", orderStatus);
		        $.ajax({
		            url: 'cancelOrder',
		            type: 'POST',
		            data: {
		                orderId: orderId,
		                orderStatus: orderStatus
		            },
		            success: function(response) {
		                if (response === "Order cancelled successfully") {
		                	fetchOrderDetails();
		                    $('#ordersuccessCancelModal').modal('show');
		                    console.log('Order cancellation successful');
		                    hideCancelOrderModal();
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error('Error occurred while cancelling order:', error);
		                fetchOrderDetails();
		                $('#orderCancelErrorModal').modal('show'); // Show error modal
		            }
		        });
		    }

		    function dismissModals() {
		        $('#ordersuccessCancelModal').modal('hide');
		        $('#orderCancelErrorModal').modal('hide'); // Hide both modals
		    }

		    $(document).ready(function() {
		        setTimeout(dismissModals, 3000); // Automatically close modals after 3 seconds
		    }); 
	</script>
	<script>
		$(document).ready(function() {
			$("#getOrderHistory").click(function(event) {
				event.preventDefault();
				fetchAllOrderHistory();
			});
		});

		function fetchAllOrderHistory() {
			$("#announcementContainer").hide();
			$("#userDetailsTableContainer").hide();
			$("#productDetailsTableContainer").hide();
			$("#orderTableContainer").hide();
			$("#orderStatusTableContainer").hide();
			$("#paymentAndSummaryContainer").hide();
			$.ajax({
				url : "getAllOrderHistory",
				type : "GET",
				dataType : "json",
				success : function(OrderDetails) {
					console.log(OrderDetails);
					if (OrderDetails && OrderDetails.length > 0) {
						$("#orderHistoryTableContainer").show();
						$("#orderHistoryTable tbody").empty();
						for (var i = 0; i < OrderDetails.length; i++) {
							var item = OrderDetails[i];
							var slno = i + 1;
							var row = "<tr>" + "<td>" + slno + "</td>" + "<td>"
									+ item.orderId + "</td>" + "<td>"
									+ item.productName + "</td>" + "<td>"
									+ item.productPrice + "</td>" + "<td>"
									+ item.deliveryCharge + "</td>" + "<td>"
									+ item.descriptionAboutProduct + "</td>"
									+ "<td>" + item.orderDate + "</td>"
									+ "<td>" + item.orderQuantity + "</td>"
									+ "<td>" + item.deliveryAddress + "</td>"
									+ "<td>" + item.deliveryDate + "</td>"
									+ "<td>" + item.message + "</td>" + "<td>"
									+ item.orderStatus + "</td>" + "<td>"
									+ item.paymentStatus + "</td>" + "</tr>";
							$("#orderHistoryTable tbody").append(row);
						}
					} else {
						alert("Order not found.");
					}
				},
				error : function(xhr, status, error) {
					alert("Failed to fetch order data from server.");
					console.error(error);
				}
			});
		}
	</script>


	<!---------------------------------------------------EDIT PRODUCT DETAILS ---------------->
	<script>
		$('#submitEditProductBtn').click(function(event) {
			var formData = new FormData($('#editProductForm')[0]); // Create FormData object from form
			console.log(formData);
			$.ajax({
				url : 'http://localhost:8080/vendorManagementSystem/productUpdate',
				method : 'POST',
				data : formData,
				processData : false, 
				contentType : false, 
				success : function(response) {
					if (response === "Product updated successfully") {
						$('#EditSuccessModal').modal('show');
					}
				},
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	</script>
	<!-- ----------------------- GET ALL ORDERS STARUS AND UPDATED ORDER STATUS------------------------------>
	<script>
		$(document).ready(function() {
			$("#getOrdersStatusBtn").click(function(event) {
				event.preventDefault(); // Prevent default link behavior
				fetchOrderStatusDetails();
			});
		});

		function fetchOrderStatusDetails() {
			$("#announcementContainer").hide();
			$("#orderTableContainer").hide();
			$("#productDetailsTableContainer").hide();
			$("#userDetailsTableContainer").hide();
			$("#orderHistoryTableContainer").hide();
			$("#paymentAndSummaryContainer").hide();
			$
					.ajax({
						url : "getOrderStatusDetails",
						type : "GET",
						dataType : "json",
						success : function(orderStatusDetails) {
							if (orderStatusDetails
									&& orderStatusDetails.length > 0) {
								$("#orderStatusTableContainer").show();
								$("#orderStatusTable tbody").empty();
								for (var i = 0; i < orderStatusDetails.length; i++) {
									var item = orderStatusDetails[i];
									var slno = i + 1;
									var row = "<tr>" + "<td>"
											+ slno
											+ "</td>"
											+ "<td>"
											+ item.orderId
											+ "</td>"
											+ "<td>"
											+ item.productName
											+ "</td>"
											+ "<td>"
											+ item.productPrice
											+ "</td>"
											+ "<td>"
											+ item.deliveryCharge
											+ "</td>"
											+ "<td>"
											+ item.descriptionAboutProduct
											+ "</td>"
											+ "<td>"
											+ item.orderDate
											+ "</td>"
											+ "<td>"
											+ item.orderQuantity
											+ "</td>"
											+ "<td>"
											+ item.deliveryAddress
											+ "</td>"
											+ "<td>"
											+ item.deliveryDate
											+ "</td>"
											+ "<td>"
											+ item.message
											+ "</td>"
											+ "<td>"
											+ item.orderStatus
											+ "</td>"
											+ "<td>"
											+ item.paymentStatus
											+ "</td>"
											+ "<td><button class='btn btn-primary btn-sm' onclick='editOrderStatusDetails("
											+ JSON.stringify(item)
											+ ")'><i class='fas fa-money-check'></i>pay</button></td>" + "</tr>";
									$("#orderStatusTable tbody").append(row);
								}
							} else {
								alert("Product not found.");
							}
						},
						error : function(xhr, status, error) {
							alert("Failed to fetch product data from server.");
							console.error(error);
						}
					});
		}

		function editOrderStatusDetails(order) {
			console.log('Editing order:');
			console.log(order);
			if (!order || typeof order !== 'object') {
				console.error('Invalid orders object.');
				return;
			}
			$('#editOrderModal #orderId').val(order.orderId);
			$('#editOrderModal #orderId').text(order.orderId);
			$('#editOrderModal #OrderProductId').val(order.product.id);
			$('#editOrderModal #productName').text(order.productName);
			$('#editOrderModal #descriptionAboutProduct').text(
					order.descriptionAboutProduct);
			$('#editOrderModal #productPrice').text(order.productPrice);
			$('#editOrderModal #deliveryCharge').text(order.deliveryCharge);
			$('#editOrderModal #orderDate').text(order.orderDate);
			$('#editOrderModal #orderQuantity').text(order.orderQuantity);
			$('#editOrderModal #deliveryAddress').text(order.deliveryAddress);
			$('#editOrderModal #deliveryDate').text(order.deliveryDate);
			$('#editOrderModal #message').text(order.message);
			$('#editOrderModal #orderStatus').text(order.orderStatus);

			$('#editOrderModal').modal('show');
		}
		
		/*=================submit UpdateOrder  Status  Api ======================= */
		function submitInvoiceForm() {
    console.log('AJAX IS Running submitInvoiceForm');

    var paymentStatus = $('#paymentStatusSelect').val();
    var formData = new FormData();
    formData.append("orderId", $('#orderId').val());
    formData.append("paymentStatus", $('#paymentStatusSelect').val());
    formData.append("orderStatus", $('#orderStatusSelect').val());

    // Check if payment status is "paid" and file is uploaded
    if (paymentStatus === "paid" && $('#fileInput')[0].files.length > 0) {
        formData.append('file', $('#fileInput')[0].files[0]);
    }

    $.ajax({
        url: 'updateOrderStatusByAdmin',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            console.log(response);
            if (response.includes("updateOrderStatusSuccessfully")) {
                console.log('Update order status successfully');
                // Hide editOrderModal
                $('#editOrderModal').modal('hide');
                // Show success modal
                $('#successModal').modal('show');
                // Hide success modal after 3 seconds
                setTimeout(function() {
                    $('#successModal').modal('hide');
                }, 3000);
            } else {
                console.log('Update order status failed');
                // Hide editOrderModal
                $('#editOrderModal').modal('hide');
                // Show error modal
                $('#errorModal').modal('show');
                // Hide error modal after 3 seconds
                setTimeout(function() {
                    $('#errorModal').modal('hide');
                }, 3000);
            }
        },
        error: function(xhr, status, error) {
            // Hide editOrderModal
            $('#editOrderModal').modal('hide');
            // Show error modal
            $('#errorModal').modal('show');
            // Hide error modal after 3 seconds
            setTimeout(function() {
                $('#errorModal').modal('hide');
            }, 3000);
            console.error(error);
        }
    });
}

$(document).ready(function() {
    $('#submitUpdateOrderStatusBtn').click(function(event) {
        event.preventDefault();
        submitInvoiceForm();
    });
});

		$(document).ready(function() {
			$('#paymentStatusSelect').change(function() {
				console.log("Change event triggered"); 
				var selectedValue = $(this).val();
				if (selectedValue === "paid") {
					$('#uploadInvoiceSection').show();
			          if ($('#fileInput').get(0).files.length > 0) {
			                $('#submitUpdateOrderStatusBtn').prop('disabled', false);
			            } else {
			                $('#submitUpdateOrderStatusBtn').prop('disabled', true);
			            }
					
				} else {
					$('#uploadInvoiceSection').hide();
					
				}
			});
		});
	    $('#fileInput').change(function() {
	        if ($('#paymentStatusSelect').val() === 'paid') {
	            if ($(this).get(0).files.length > 0) {
	                $('#submitUpdateOrderStatusBtn').prop('disabled', false);
	            } else {
	                $('#submitUpdateOrderStatusBtn').prop('disabled', true);
	            }
	        }
	    });
	</script>
	<!--------------------------------THIS API IS FOR PAYMENT BALANCES AND PAYMENT HISTORY ----------------------->
	<script>
    $(document).ready(function() {
        $("#getOrderPaymentList").click(function(event) {
            event.preventDefault(); // Prevent default link behavior
            fetchOrderPaymentHistory(); // Fetch product details without pagination
        });
    });

    function fetchOrderPaymentHistory() {
    	$("#orderTableContainer").hide();
		$("#productDetailsTableContainer").hide();
		$("#userDetailsTableContainer").hide();
		$("#orderHistoryTableContainer").hide();
		$("#orderStatusTableContainer").hide();
		$("#announcementContainer").hide();
        $
            .ajax({
                url : "getOrderPaymentHistory",
                type : "GET",
                dataType : "json",
                success : function(OrderDetails) {
                    console.log(OrderDetails);
                    if (OrderDetails && OrderDetails.length > 0) {
                        $("#paymentAndSummaryContainer").show();
                        $("#paymentDetailsTable tbody").empty();

                        var totalAmountToPay = 0;
                        var totalAmountPaid = 0;

                        // Iterate through product details
                        OrderDetails.forEach(function(item) {
                            var row = "<tr>" + "<td>" + item.orderId
                                + "</td>" + "<td>"
                                + item.productName + "</td>"
                                + "<td>" + item.productPrice
                                + "</td>" + "<td>"
                                + item.deliveryCharge + "</td>"
                                + "<td>" + item.orderQuantity
                                + "</td>" + "<td>"
                                + item.orderStatus + "</td>"
                                + "<td>" + item.orderAmount
                                + "</td>" + "<td>"
                                + item.paymentStatus + "</td>"
                                + "</tr>";
                            $("#paymentDetailsTable tbody").append(row);

                            totalAmountToPay += parseFloat(item.orderAmount);
                            totalAmountPaid += parseFloat(item.amountPaid);
                        });

                        // Display calculated values in the Payment Summary
                        $("#totalAmountToPay").val(
                            totalAmountToPay.toFixed(2));
                        $("#amountPaid")
                            .val(totalAmountPaid.toFixed(2));
                        $("#remainingBalance").val(
                            (totalAmountToPay - totalAmountPaid)
                                .toFixed(2));
                    } else {
                        alert("Order Payment History not found.");
                    }
                },
                error : function(xhr, status, error) {
                    alert("Failed to fetch order data from server.");
                    console.error(error);
                }
            });
    } 
</script>

	<!--------------------------When the "Get All Announcements" button is clicked  -->
<script>
    $(document).ready(function() {
        // Handle form submission
        $("#announcementForm").submit(function(event) {
            event.preventDefault();

            $.ajax({
                type: "POST",
                url: "saveAnnouncement", // Replace with your server endpoint
                data: $(this).serialize(),
                success: function(response) {
                    if (response.includes("Announcement saved successfully")) {
                        $('#announcementModal').modal('hide');
                        $('#successAnnouncementModal').modal('show');
                        setTimeout(function() {
                            $('#successAnnouncementModal').modal('hide');
                        }, 3000); // Hide after 3 seconds
                        loadAnnouncements(); // Refresh announcements
                    } else {
                        $('#announcementModal').modal('hide');
                        $('#errorAnnouncementModal').modal('show');
                        setTimeout(function() {
                            $('#errorAnnouncementModal').modal('hide');
                        }, 3000); // Hide after 3 seconds
                    }
                },
                error: function() {
                    $('#announcementModal').modal('hide');
                    $('#errorAnnouncementModal').modal('show');
                    setTimeout(function() {
                        $('#errorAnnouncementModal').modal('hide');
                    }, 3000); // Hide after 3 seconds
                }
            });
        });

        // When the "Get All Announcements" button is clicked
        $("#getAllAnnouncement").click(function() {
            loadAnnouncements(); // Load announcements dynamically
            // Show the announcement container
            $("#announcementContainer").show();
            // Hide other containers if needed
            $("#orderTableContainer").hide();
            $("#productDetailsTableContainer").hide();
            $("#userDetailsTableContainer").hide();
            $("#orderHistoryTableContainer").hide();
            $("#orderStatusTableContainer").hide();
        });

        // Event delegation for delete button
        $(document).on("click", ".delete-btn", function() {
            var announcementID = $(this).closest("tr").find(".announcement-id").text();
            $('#announcementID').val(announcementID);
            $('#deleteConfirmationModal').modal('show');
        });

        // Delete announcement
        $("#confirmDeleteBtn").click(function() {
            var id = $('#announcementID').val();
            deleteAnnouncement(id);
            $('#deleteConfirmationModal').modal('hide');
        });

        function loadAnnouncements() {
            $.ajax({
                type: "GET",
                url: "getAnnouncements",
                dataType: "json",
                success: function(announcements) {
                    console.log(announcements);
                    if (announcements && announcements.length > 0) {
                        $("#announcementContainer").show();
                        $("#AnnouncementDetailsTable tbody").empty(); // Clear previous rows
                        for (var i = 0; i < announcements.length; i++) {
                            var announcement = announcements[i];
                            var row = "<tr>" +
                                "<td class='announcement-id'>" + announcement.id + "</td>" +
                                "<td>" + announcement.title + "</td>" +
                                "<td>" + announcement.message + "</td>" +
                                "<td><button class='btn btn-danger delete-btn'><i class='fas fa-times'></i> Delete</button></td>" +
                                "</tr>";
                            $("#AnnouncementDetailsTable tbody").append(row);
                        }
                    } else {
                        alert("Announcements not found.");
                    }
                },
                error: function() {
                    alert("Failed to fetch announcements.");
                }
            });
        }

        function deleteAnnouncement(id) {
            console.log('id------------' + id);
            $.ajax({
                type: "POST",
                url: "deleteAnnouncement",
                data: { id: id },
                success: function(response) {
                    if (response.includes("Announcement deleted successfully")) {
                        $('#successDeleteAnnouncementModal').modal('show');
                        setTimeout(function() {
                            $('#successDeleteAnnouncementModal').modal('hide');
                        }, 3000);
                        loadAnnouncements(); // Refresh announcements
                    } else {
                        $('#errorDeleteAnnouncementModal').modal('show');
                        setTimeout(function() {
                            $('#errorDeleteAnnouncementModal').modal('hide');
                        }, 3000);
                    }
                },
                error: function() {
                    $('#errorDeleteAnnouncementModal').modal('show');
                    setTimeout(function() {
                        $('#errorDeleteAnnouncementModal').modal('hide');
                    }, 3000);
                }
            });
        }
    });
</script>





	<!--------------------------------this API IS FOR SEND MESSAGE TO  EVERY VENDORS AND SINGL------------------------------->
	<script>
    function toggleEmailInput() {
        var emailInputGroup = document.getElementById('emailInputGroup');
        var sendToAllCheckbox = document.getElementById('sendToAll');

        if (sendToAllCheckbox.checked) {
            emailInputGroup.style.display = 'none';
            document.getElementById('recipientEmail').value = ''; // Clear input value when hiding
        } else {
            emailInputGroup.style.display = 'block';
        }
    }

		function sendMessage() {
			var message = document.getElementById('sendMessages').value;
			var subject = document.getElementById('subject').value;
			var sendToAll = document.getElementById('sendToAll').checked;
			var recipientEmail = sendToAll ? null : document
					.getElementById('recipientEmail').value;
			console.log('message', message);
			console.log('sendToAll', sendToAll);

			$.ajax({
				url : 'http://localhost:8080/vendorManagementSystem/messages/sendMessage',
				type : 'POST',
				data : {
					message : message,
					subject : subject,
					sendToAll : sendToAll,
					recipientEmail : recipientEmail
				},
				success : function(response) {
					$('#adminMessageModal').modal('hide');
					$('#MessageSuccessModal').modal('show');
					setTimeout(function() {
						$('#MessageSuccessModal').modal('hide');
					}, 3000);
				},
				error : function(xhr, status, error) {
					$('#adminMessageModal').modal('show');
					$('#MessageErrorModal').modal('show');
					setTimeout(function() {
						$('#MessageErrorModal').modal('hide');
					}, 3000);
				}
			});
		}
	</script>
	<!------------------------------------------------THIS FUNCTION IS DISPLY USER NAME  -->
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var email = "${email}";
			var userName = email.substring(0, email.indexOf('@')); 
			document.getElementById("userName").textContent = userName; 
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
