<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

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

.navbar-brand span {
	color: black;
	font-style: italic;
	font-weight: bolder;
}

#compnyName {
	color: white;
	font-style: italic;
	font-weight: bolder;
}

#userName,#notificationIcon {
	color: blue
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
	color: #fff;
}

.dropdown-menu a.dropdown-item:focus, .dropdown-menu a.dropdown-item:hover
	{
	background-color: blue;
	color: #fff;
	border-color: #007bff;
}

.profile-photo {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 5px;
}

.sidebar {
	background-color: black;
	color: #fff;
	padding: 10px;
	/* width: 170px; Remove fixed width */
	/* height: calc(100vh - 60px); Remove fixed height */
}

.profile-photo {
	width: 30px;
	/* Reduce profile photo size for better fit on smaller screens */
	height: 30px;
	margin-right: 10px;
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

/* Additional Styles */
#productTableContainer {
	margin-top: 20px;
	padding: 10px;
	margin: 0;
}

.logo {
	height: 50px;
}

.profile-dropdown img {
	height: 30px;
	width: 30px;
	border-radius: 50%;
	margin-right: 10px;
}

.card {
	width: 100%;
	/* max-width: 400px; */
	margin: auto;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.card-body {
	padding: 20px;
}

#noOrders, #orderHead {
	color: red;
	text-align: center;
	display: block;
	margin: auto;
	width: fit-content;
}

.custom-dropdown {
	right: auto;
	left: 1000px; /* Adjust this value according to your layout */
	top: 50px; /* Adjust this value according to your layout */
}
</style>
</head>
<body>
	<!-- Navbar -->
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light">
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
				<li class="nav-item"><a class="nav-link" href="#"
					id="notificationIcon"> <i class="fas fa-bell"></i> <span
						class="badge badge-pill badge-primary" id="notificationBadge">0</span>
				</a></li>
				<!-- Dropdown Menu -->
				<li id="notificationDropdown" style="display: none;"
					class="dropdown-menu dropdown-menu-right custom-dropdown">
					<ul id="notificationList" class="list-group"></ul>
				</li>
				<!-- End Dropdown Menu -->
				<li class="nav-item dropdown profile-dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img src="display?email=${email}"
						alt="User Avatar"> <span id="userName"></span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<div class="dropdown-item" style="text-align: right;"></div>
						<a href="actionServlet?action=profile" class="dropdown-item"><i
							class="fas fa-home"></i> Profile Home</a> <a
							href="actionServlet?action=edit" class="dropdown-item"><i
							class="fas fa-user-edit"></i> Edit Profile</a> <a
							href="actionServlet?action=logout" class="dropdown-item"><i
							class="fas fa-sign-out-alt"></i> Logout</a>
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
						<li class="nav-item"><input type="hidden" id="email"
							name="email" value="${email}"> <a class="nav-link"
							id="addProductBtn" data-toggle="modal"
							data-target="#addProductModal" role="button"> <i
								class="fas fa-plus-circle"></i>Add Product
						</a></li>
						<li class="nav-item"><a class="nav-link"
							id="getProductDetailsBtn" role="button"><i
								class="fas fa-cubes"></i>Products</a></li>
						<li class="nav-item"><a class="nav-link"
							id="getOrderDetailsByEmail" role="button"><i
								class="fas fa-clipboard-list"></i>Orders</a></li>
						<!-- <li class="nav-item"><a class="nav-link"
							id="getOrderStatusByEmail" role="button"><i
								class="fas fa-clipboard-list"></i>Orders Status</a></li> -->
						<li class="nav-item"><a class="nav-link"
							id="getOrderHistoryByEmail" role="button"><i
								class="fas fa-clipboard-list"></i>Orders history</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							id="getOrderPaymentListByEmail" role="button"> <i
								class="fas fa-money-check-alt"></i>Payments
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							role="button" data-toggle="modal" data-target="#sendMessageModal">
								<i class="fas fa-envelope"></i>Messages
						</a></li>
					</ul>
				</div>
			</nav>

			<!-- Main content -->
			<main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
				<!-- Product display content --------->
				<div class="table-responsive" id="productTableContainer"
					style="display: none;">
					<table id="productDetailsTable"
						class="table table-bordered table-hover">
						<!-- Table headers -->
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
								<th>category</th>
								<th>productName</th>
								<th>productPrice</th>
								<th>deliveryCharge</th>
								<th>descriptionAboutProduct</th>
								<th>available</th>
								<th>Action</th>
								<!-- New column for action buttons -->
							</tr>
						</thead>
						<tbody>
							<!-- Data will be displayed here -->
						</tbody>
					</table>
					<div id="paginationButtons" class="text-center">
						<button class="btn btn-primary" id="prevPageBtn" disabled>Previous</button>
						<button class="btn btn-primary" id="nextPageBtn">Next</button>
					</div>
				</div>
				<!--  order table  -->
				<div class="table-responsive" id="orderTableContainer"
					style="display: none;">
					<span id="noOrders" style="color: red; text-align: center;"
						style="display: none;"></span>
					<table id="orderDetailsTable"
						class="table table-bordered table-hover">
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
								<th>action</th>
								<!-- New column for action buttons -->
							</tr>
						</thead>
						<tbody>
							<!-- Data will be displayed here -->
						</tbody>
					</table>
					<div id="paginationButtons" class="text-center">
						<button class="btn btn-primary" id="prevPageBtn" disabled>Previous</button>
						<button class="btn btn-primary" id="nextPageBtn">Next</button>
					</div>
				</div>
				<!-------------------------  order history table -------------------------->
				<div class="table-responsive" id="orderHistoryTableContainer"
					style="display: none;">
					<span id="noOrders" style="color: red; text-align: center;"
						style="display: none;"></span>
					<table id="orderHistoryTable"
						class="table table-bordered table-hover">
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
					<div id="paginationButtons" class="text-center">
						<button class="btn btn-primary" id="prevPageBtn" disabled>Previous</button>
						<button class="btn btn-primary" id="nextPageBtn">Next</button>
					</div>
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
						<h4 id="orderHead" style="text-align: center;">All Orders
							Payment Details</h4>
						<!-- Payment Table -->
						<div class="col-lg-12 mt-3">
							<div class="table-responsive">
								<table id="paymentDetailsTable"
									class="table table-bordered table-hover">
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
							<div id="paginationButtons" class="text-center">
								<button class="btn btn-primary mr-2" id="prevPageBtn" disabled>Previous</button>
								<button class="btn btn-primary" id="nextPageBtn">Next</button>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-------------------------------------------- Add Product Modal ------------------------------->
	<div class="modal fade" id="addProductModal" tabindex="-1"
		aria-labelledby="addProductModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addProductModalLabel">
						<i class="fas fa-plus"></i> Add Product
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="addProductForm">
						<input type="hidden" id="email" name="email" value="${email}">
						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label for="category" class="form-label"><i
										class="fas fa-tags"></i> Category</label> <select class="form-control"
										id="category" name="category" required>
										<option value="">Select Category</option>
										<option value="grocery">Grocery</option>
										<option value="electronics">Electronics</option>
										<option value="cloths">Cloth's</option>
										<option value="home_furnitures">Home and Furniture's</option>
										<option value="cosmetics">Cosmetics</option>
										<option value="appliances">Appliances</option>
									</select>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label for="productName" class="form-label"><i
										class="fas fa-cube"></i> Product Name</label> <input type="text"
										class="form-control" id="productName" name="productName"
										placeholder="Enter Product Name" required>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label for="productPrice" class="form-label"><i
										class="fas fa-dollar-sign"></i> Product Price (per item)</label>
									<div class="input-group">
										<input type="number" class="form-control" id="productPrice"
											name="productPrice" required> <span
											class="input-group-text">₹</span>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label for="deliveryCharge" class="form-label"><i
										class="fas fa-truck"></i> Delivery Charge</label>
									<div class="input-group">
										<input type="number" class="form-control" id="deliveryCharge"
											name="deliveryCharge" required> <span
											class="input-group-text">₹</span>
									</div>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<label for="available" class="form-label"><i
								class="fas fa-check-circle"></i> Available</label> <select
								class="form-control" id="available" name="available" required>
								<option value="">Select Availability</option>
								<option value="StockIn">Stock In</option>
								<option value="OutofStock">Out of Stock</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="descriptionAboutProduct" class="form-label"><i
								class="fas fa-info-circle"></i> Description About Product</label>
							<textarea class="form-control" id="descriptionAboutProduct"
								name="descriptionAboutProduct" rows="3" required></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="submitProductBtn">
						<i class="fas fa-check"></i> Submit
					</button>
				</div>
			</div>
		</div>
	</div>

	<!--------------------------------------------------------- add product Success Modal ---------------------->
	<!-- add Product Success Modal  -->
	<div class="modal fade" id="addProductSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="addProductSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">product added successfully.</div>
			</div>
		</div>
	</div>

	<!-- add Product Error Modal -->
	<div class="modal fade" id="addProductErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="addProductErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while adding
					Product.</div>
			</div>
		</div>
	</div>

	<!--------------------------------------------- Edit Product Modal --------------------->
	<div class="modal fade" id="editProductDetailsModal" tabindex="-1"
		aria-labelledby="editProductDetailsModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editProductDetailsModalLabel">
						<i class="fas fa-edit"></i> Edit Product Details
					</h5>
					<button type="button" class="close" onclick="closeModals()"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="editProductForm">
						<input type="hidden" id="id" name="id"> <input
							type="hidden" id="email" name="email" value="${email}">
						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label for="category" class="form-label"><i
										class="fas fa-tags"></i> Category</label> <select class="form-control"
										id="category" name="category" required>
										<option value="">Select Category</option>
										<option value="grocery">Grocery</option>
										<option value="electronics">Electronics</option>
										<option value="cloths">Cloth's</option>
										<option value="home_furnitures">Home and Furniture's</option>
										<option value="cosmetics">Cosmetics</option>
										<option value="appliances">Appliances</option>
									</select>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label for="productName" class="form-label"><i
										class="fas fa-cube"></i> Product Name</label> <input type="text"
										class="form-control" id="productName" name="productName"
										placeholder="Enter Product Name" required>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label for="productPrice" class="form-label"><i
										class="fas fa-dollar-sign"></i> Product Price (per item)</label>
									<div class="input-group">
										<input type="number" class="form-control" id="productPrice"
											name="productPrice" required> <span
											class="input-group-text">₹</span>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label for="deliveryCharge" class="form-label"><i
										class="fas fa-truck"></i> Delivery Charge</label>
									<div class="input-group">
										<input type="number" class="form-control" id="deliveryCharge"
											name="deliveryCharge" required> <span
											class="input-group-text">₹</span>
									</div>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<label for="available" class="form-label"><i
								class="fas fa-check-circle"></i> Available</label> <select
								class="form-control" id="available" name="available" required>
								<option value="">Select Availability</option>
								<option value="StockIn">Stock In</option>
								<option value="OutofStock">Out of Stock</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="descriptionAboutProduct" class="form-label"><i
								class="fas fa-info-circle"></i> Description About Product</label>
							<textarea class="form-control" id="descriptionAboutProduct"
								name="descriptionAboutProduct" rows="3" required></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						onclick="closeModals()">
						<i class="fas fa-times"></i> Close
					</button>
					<button type="button" class="btn btn-primary"
						id="submitEditProductBtn">
						<i class="fas fa-check"></i> Submit
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- edit Product success Modal-->
	<div class="modal fade" id="editProductSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="editProductSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">product updated successfully.</div>
			</div>
		</div>
	</div>

	<!-- edit Product Error Modal-->
	<div class="modal fade" id="editProductErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="editProductErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while Product
					updated.</div>
			</div>
		</div>
	</div>
	<!-------------------------------------------------------EDIT ORDERS MODAL------------>
	<div class="modal fade" id="editOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="editOrderModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editOrderModalLabel">
						<i class="fas fa-info-circle"></i> Order Details
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						onclick="closeModals()" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<strong><i class="fas fa-tag"></i> Order ID:</strong><span
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
								Price:</strong><span id="productPrice"></span>
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
								Quantity:</strong> <span style="" id="orderQuantity"></span>
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
							<strong><i class="fas fa-info-circle"></i> Order Status:</strong>
							<span id="orderStatus"></span>
						</div>
					</div>
					<div class="row">
						<form id="invoiceForm" enctype="multipart/form-data">
							<input type="hidden" id="orderId" name="orderId"> <select
								id="statusSelect" class="form-control">
								<option value="can't_delivered">can't Delivered</option>
								<option value="delivered">Delivered</option>
							</select><br>
							<div id="uploadInvoiceSection" style="display: none;">
								<input type="file" id="fileInput" name="file" accept=".pdf"><br>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button id="downloadPDFBtn" type="button" class="btn btn-success"
						onclick="downloadPDF()">Download PDF</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="closeModals()">Close</button>
					<button id="submitOrderBtn" type="button" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<!--update Order Success Modal  -->
	<div class="modal fade" id="updateOrderSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="updateOrderSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">order Status updated successfully.</div>
			</div>
		</div>
	</div>

	<!-- update  Order Error Modal-->
	<div class="modal fade" id="updateOrderErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="updateOrderErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while updating Order
					status.</div>
			</div>
		</div>
	</div>

	<!-----------------------------------------message Modal----------------------------------->
	<div class="modal fade" id="sendMessageModal" tabindex="-1"
		role="dialog" aria-labelledby="sendMessageModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="sendMessageModalLabel">Send
						Message</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Message input field -->
					<div class="form-group">
						<input type="hidden" id="email" name="email" value="${email}">
						<label for="message"><i class="fas fa-envelope"></i>Message:</label>
						<textarea class="form-control" id="sendMessage" rows="4"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<!-- Button to send message -->
					<button type="button" id="sendMessageBtn" class="btn btn-primary">
						<i class="fas fa-paper-plane"></i> Send
					</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!--send Message Success Modal  -->
	<div class="modal fade" id="sendMessageSuccessModal" tabindex="-1"
		role="dialog" aria-labelledby="sendMessageSuccessModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-success text-white">
				<div class="modal-body">Message Sent successfully.</div>
			</div>
		</div>
	</div>

	<!-- send  Message Error Modal-->
	<div class="modal fade" id="sendMessageErrorModal" tabindex="-1"
		role="dialog" aria-labelledby="sendMessageErrorModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content bg-danger text-white">
				<div class="modal-body">An error occurred while Sending
					Message.</div>
			</div>
		</div>
	</div>

	<script>
		function closeModals() {
			$('#editProductDetailsModal').modal('hide');
			$('#editOrderModal').modal('hide');
		}

		/* function dismissModals() {
			$('#successModal').modal('hide');
			$('#addProductModal').modal('hide');
			$('#EditSuccessModal').modal('hide');
			$('#editProductDetailsModal').modal('hide');
			$('#editOrderModal').modal('hide');
		}
		$('#successModal').on('hidden.bs.modal', function() {
			$('#addProductModal').modal('hide');
		});

		// Function to dismiss all modals
		function dismissModals() {
			$('.modal').modal('hide');
		} */
	</script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var form = document.getElementById('addProductForm');
			var submitButton = document.getElementById('submitProductBtn');

			// Function to check if all required fields are filled
			function checkFormValidity() {
				var isValid = form.checkValidity();
				submitButton.disabled = !isValid;
			}

			// Listen for changes in form fields
			form.addEventListener('input', checkFormValidity);

			// Initially, check form validity
			checkFormValidity();
		});
	</script>
	<!---------------------------------------------------ADD PRODUCT DETAILS ---------------->
	<script>
		$('#submitProductBtn')
				.click(
						function(event) {
							var formData = new FormData($('#addProductForm')[0]); // Create FormData object from form
							console.log(formData);
							$
									.ajax({
										url : 'http://localhost:8080/vendorManagementSystem/addProduct',
										method : 'POST',
										data : formData, // Send FormData object directly
										processData : false, // Prevent jQuery from processing FormData
										contentType : false, // Prevent jQuery from setting contentType
										success : function(response) {
											if (response === "addProduct saved successfully") {
												$('#addProductModal').modal(
														'hide');
												$('#addProductSuccessModal')
														.modal('show');
												setTimeout(
														function() {
															$(
																	'#addProductSuccessModal')
																	.modal(
																			'hide');
														}, 3000);
											}
										},
										error : function(xhr, status, error) {
											$('#addProductModal').modal('hide');
											$('#addProductErrorModal').modal(
													'show');
											setTimeout(function() {
												$('#addProductErrorModal')
														.modal('hide');
											}, 3000);
											console.error(error);
										}
									});
						});
	</script>
	<!---------------------------------------------------EDIT PRODUCT DETAILS ---------------->
	<script>
		$('#submitEditProductBtn')
				.click(
						function(event) {
							var formData = new FormData(
									$('#editProductForm')[0]); // Create FormData object from form
							console.log(formData);
							$
									.ajax({
										url : 'http://localhost:8080/vendorManagementSystem/productUpdate',
										method : 'POST',
										data : formData, // Send FormData object directly
										processData : false, // Prevent jQuery from processing FormData
										contentType : false, // Prevent jQuery from setting contentType
										success : function(response) {
											if (response === "Product updated successfully") {
												$('#editProductDetailsModal')
														.modal('hide');
												$('#editProductSuccessModal')
														.modal('show');
												setTimeout(
														function() {
															$(
																	'#editProductSuccessModal')
																	.modal(
																			'hide');
														}, 3000);
											}
										},
										error : function(xhr, status, error) {
											$('#editProductDetailsModal')
													.modal('hide');
											$('#editProductErrorModal').modal(
													'show');
											setTimeout(function() {
												$('#editProductErrorModal')
														.modal('hide');
											}, 3000);
										}
									});
						});
	</script>
	<!--   JavaScript getproductDetails ID   ------------->
	<script>
		$(document).ready(function() {
			$("#getProductDetailsBtn").click(function(event) {
				event.preventDefault(); // Prevent default link behavior
				fetchProductDetails(1); // Fetch product details for the first page
			});
		});

		function fetchProductDetails(page) {
			var email = $("#email").val(); // Get email value from hidden input field
			var productsPerPage = 5; // Number of products to display per page
			$("#orderTableContainer").hide();
			$("#paymentAndSummaryContainer").hide();
			$("#orderHistoryTableContainer").hide();
			$
					.ajax({
						url : "getProductDetailsByEmail",
						type : "GET",
						data : {
							email : email
						},
						dataType : "json",
						success : function(productDetails) {
							if (productDetails && productDetails.length > 0) {
								$("#productTableContainer").show();
								$("#productDetailsTable tbody").empty();

								// Calculate total number of pages
								var totalPages = Math
										.ceil(productDetails.length
												/ productsPerPage);

								// Calculate start and end indices for the current page
								var startIndex = (page - 1) * productsPerPage;
								var endIndex = Math.min(startIndex
										+ productsPerPage,
										productDetails.length);

								// Iterate through product details for the current page
								for (var i = startIndex; i < endIndex; i++) {
									var item = productDetails[i];
									var row = "<tr>" + "<td>"
											+ item.id
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
											+ "<td><button class='btn btn-primary btn-sm' onclick='editProductDetails("
											+ JSON.stringify(item)
											+ ")'>Edit</button></td>" + "</tr>";
									$("#productDetailsTable tbody").append(row);
								}

								// Enable/disable pagination buttons based on current page
								$("#prevPageBtn").prop("disabled", page === 1);
								$("#nextPageBtn").prop("disabled",
										page === totalPages);

								// Event listener for next page button
								$("#nextPageBtn").off("click").click(
										function() {
											fetchProductDetails(page + 1); // Fetch product details for the next page
										});

								// Event listener for previous page button
								$("#prevPageBtn").off("click").click(
										function() {
											fetchProductDetails(page - 1); // Fetch product details for the previous page
										});
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

		function editProductDetails(product) {
			console.log('Editing product:');
			console.log(product);

			// Check if product object is valid
			if (!product || typeof product !== 'object') {
				console.error('Invalid product object.');
				return;
			}
			$('#editProductForm #id').val(product.id);
			$('#editProductForm #category').val(product.category);
			$('#editProductForm #productName').val(product.productName);
			$('#editProductForm #productPrice').val(product.productPrice);
			$('#editProductForm #deliveryCharge').val(product.deliveryCharge);
			$('#editProductForm #descriptionAboutProduct').val(
					product.descriptionAboutProduct);
			$('#editProductForm #available').val(product.available);
			$('#editProductForm #status').text(product.status);

			// Show the modal
			$('#editProductDetailsModal').modal('show');
		}
	</script>
	<script>
		$(document).ready(function() {
			$("#getOrderDetailsByEmail").click(function(event) {
				event.preventDefault(); // Prevent default link behavior
				fetchOrderDetails(1); // Fetch product details for the first page
			});
		});

		function fetchOrderDetails(page) {
			var email = $("#email").val(); // Get email value from hidden input field
			var ordersPerPage = 5; // Number of products to display per page
			$("#productTableContainer").hide();
			$("#paymentAndSummaryContainer").hide();
			$("#orderHistoryTableContainer").hide();
			$
					.ajax({
						url : "getOrderDetailsByEmail",
						type : "GET",
						data : {
							email : email
						},
						dataType : "json",
						success : function(OrderDetails) {
							console.log(OrderDetails);
							if (OrderDetails && OrderDetails.length > 0) {
								$("#orderTableContainer").show();
								$("#orderDetailsTable tbody").empty();

								// Calculate total number of pages
								var totalPages = Math.ceil(OrderDetails.length
										/ ordersPerPage);

								// Calculate start and end indices for the current page
								var startIndex = (page - 1) * ordersPerPage;
								var endIndex = Math.min(startIndex
										+ ordersPerPage, OrderDetails.length);

								// Iterate through product details for the current page
								for (var i = startIndex; i < endIndex; i++) {
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
											+ ")'>view</button></td>" + "</tr>";
									$("#orderDetailsTable tbody").append(row);
								}

								// Enable/disable pagination buttons based on current page
								$("#prevPageBtn").prop("disabled", page === 1);
								$("#nextPageBtn").prop("disabled",
										page === totalPages);

								// Event listener for next page button
								$("#nextPageBtn").off("click").click(
										function() {
											fetchOrderDetails(page + 1); // Fetch product details for the next page
										});

								// Event listener for previous page button
								$("#prevPageBtn").off("click").click(
										function() {
											fetchOrderDetails(page - 1); // Fetch product details for the previous page
										});
							} else {
								$("#orderTableContainer").show();
								$("#noOrders").show();
								var noorders = 'No Orders found';
								$('#noOrders').text(noorders);
								/* alert("order not found."); */
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

			// Show the modal
			$('#editOrderModal').modal('show');
		}
	</script>
	<script>
		$(document).ready(function() {
			$('#statusSelect').change(function() {
				console.log("Change event triggered"); // Add this line to check if the event is triggered
				var selectedValue = $(this).val();
				if (selectedValue === "delivered") {
					$('#uploadInvoiceSection').show();
				} else {
					$('#uploadInvoiceSection').hide();
				}
			});
		});

		function submitForm() {
			// Get the orderId and statusSelect values
			var orderId = $('#orderId').val();
			var status = $('#statusSelect').val();

			// Prepare FormData object with orderId and status
			var formData = new FormData();
			formData.append('orderId', orderId);
			formData.append('status', status);

			// Check if the status is "delivered" and file is selected
			if (status === "delivered" && $('#fileInput')[0].files.length > 0) {
				// If delivered, also append the file to FormData
				formData.append('file', $('#fileInput')[0].files[0]);
			}

			// Send AJAX request to the controller
			$.ajax({
				url : 'upload',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					console.log(response);
					if (response.includes("updateOrderStatusSuccessfully")) {
						console.log('Update order status successfully');
						$('#editOrderModal').modal('hide');
						$('#updateOrderSuccessModal').modal('show');
						setTimeout(function() {
							$('#editProductErrorModal').modal('hide');
						}, 3000);
					} else {
						console.log('Update order status failed');
						$('#editOrderModal').modal('hide');
						$('#updateOrderErrorModal').modal('show');
						setTimeout(function() {
							$('#updateOrderErrorModal').modal('hide');
						}, 3000);
					}
				},
				error : function(xhr, status, error) {
					// Handle error response
					console.error(xhr.responseText);
					$('#editOrderModal').modal('hide');
					$('#updateOrderErrorModal').modal('show');
					setTimeout(function() {
						$('#updateOrderErrorModal').modal('hide');
					}, 3000);
				}
			});
		}

		$('#submitOrderBtn').click(function() {
			submitForm();
		});
	</script>
	<script>
		$(document).ready(function() {
			// Click event for fetching order history
			$("#getOrderHistoryByEmail").click(function(event) {
				event.preventDefault();
				fetchOrderHistory(1); // Fetch order history for the first page
			});

			// Click events for pagination buttons
			$("#prevPageBtn").click(function() {
				var currentPage = parseInt($("#currentPage").text());
				fetchOrderHistory(currentPage - 1); // Fetch order history for the previous page
			});

			$("#nextPageBtn").click(function() {
				var currentPage = parseInt($("#currentPage").text());
				fetchOrderHistory(currentPage + 1); // Fetch order history for the next page
			});
		});

		function fetchOrderHistory(page) {
			var email = $("#email").val();
			var ordersPerPage = 5;
			var startIndex = (page - 1) * ordersPerPage;
			var endIndex = startIndex + ordersPerPage;

			$("#productTableContainer").hide();
			$("#paymentAndSummaryContainer").hide();
			$("#orderTableContainer").hide();

			$.ajax({
				url : "getOrderHistoryByEmail",
				type : "GET",
				data : {
					email : email
				},
				dataType : "json",
				success : function(OrderDetails) {
					console.log(OrderDetails);
					if (OrderDetails && OrderDetails.length > 0) {
						$("#orderHistoryTableContainer").show();
						$("#orderHistoryTable tbody").empty();

						// Display orders for the current page
						for (var i = startIndex; i < endIndex
								&& i < OrderDetails.length; i++) {
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
									+ item.orderStatus + "</td>" + "</tr>";
							$("#orderHistoryTable tbody").append(row);
						}

						// Enable/disable pagination buttons based on current page
						$("#prevPageBtn").prop("disabled", page === 1);
						$("#nextPageBtn").prop("disabled",
								endIndex >= OrderDetails.length);

						// Update the current page number
						$("#currentPage").text(page);
					} else {
						alert("No orders found.");
					}
				},
				error : function(xhr, status, error) {
					alert("Failed to fetch order data from server.");
					console.error(error);
				}
			});
		}
	</script>
	<!--------------------------------------payment history table----------------------->
	<script>
		$(document).ready(function() {
			$("#getOrderPaymentListByEmail").click(function(event) {
				event.preventDefault(); // Prevent default link behavior
				fetchOrderPaymentHistory(1); // Fetch product details for the first page
			});
		});

		function fetchOrderPaymentHistory(page) {
			var email = $("#email").val(); // Get email value from hidden input field
			var ordersPerPage = 5; // Number of products to display per page
			$("#productTableContainer").hide();
			$("#orderTableContainer").hide();
			$("#orderHistoryTableContainer").hide();
			$
					.ajax({
						url : "getOrderPaymentListByEmail",
						type : "GET",
						data : {
							email : email
						},
						dataType : "json",
						success : function(OrderDetails) {
							console.log(OrderDetails);
							if (OrderDetails && OrderDetails.length > 0) {
								$("#paymentAndSummaryContainer").show();
								$("#paymentDetailsTable tbody").empty();

								// Calculate total number of pages
								var totalPages = Math.ceil(OrderDetails.length
										/ ordersPerPage);

								// Calculate start and end indices for the current page
								var startIndex = (page - 1) * ordersPerPage;
								var endIndex = Math.min(startIndex
										+ ordersPerPage, OrderDetails.length);

								var totalAmountToPay = 0;
								var totalAmountPaid = 0;

								// Iterate through product details for the current page
								for (var i = startIndex; i < endIndex; i++) {
									var item = OrderDetails[i];
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
								}

								// Display calculated values in the Payment Summary
								$("#totalAmountToPay").val(
										totalAmountToPay.toFixed(2));
								$("#amountPaid")
										.val(totalAmountPaid.toFixed(2));
								$("#remainingBalance").val(
										(totalAmountToPay - totalAmountPaid)
												.toFixed(2));

								// Enable/disable pagination buttons based on current page
								$("#prevPageBtn").prop("disabled", page === 1);
								$("#nextPageBtn").prop("disabled",
										page === totalPages);

								// Event listener for next page button
								$("#nextPageBtn").off("click").click(
										function() {
											fetchOrderPaymentHistory(page + 1); // Fetch product details for the next page
										});

								// Event listener for previous page button
								$("#prevPageBtn").off("click").click(
										function() {
											fetchOrderPaymentHistory(page - 1); // Fetch product details for the previous page
										});
							} else {
								alert("Order PaymentHistory not found.");
							}
						},
						error : function(xhr, status, error) {
							alert("Failed to fetch order data from server.");
							console.error(error);
						}
					});
		}
	</script>
	<!-----------------------Function to handle sending message and showing success modal  -->
	<script>
		function showSuccessModal() {
			$('#sendmessagesuccessmodal').modal('show');
			setTimeout(function() {
				$('#sendmessagesuccessmodal').modal('hide');
				$('#sendMessageModal').modal('hide');
			}, 3000);
		}

		$('#sendMessageBtn').click(function(event) {
			event.preventDefault();

			var email = $("#email").val();
			var message = document.getElementById('sendMessage').value;

			$.ajax({
				url : 'sendMessage',
				method : 'GET',
				data : {
					email : email,
					message : message
				},
				success : function(response) {
					if (response === "message sent successfully") {
						$('#sendMessageModal').modal('hide');
						$('#sendMessageSuccessModal').modal('show');
						setTimeout(function() {
							$('#sendMessageSuccessModal').modal('hide');
						}, 3000);
					}
				},
				error : function(xhr, status, error) {
					console.error(error);
					$('#sendMessageModal').modal('hide');
					$('#sendMessageErrorModal').modal('show');
					setTimeout(function() {
						$('#sendMessageErrorModal').modal('hide');
					}, 3000);
				}
			});
		});
	</script>
	<!----------------------get user notification ------------------------ -->
	<!-- 	<script>
		// Function to fetch notifications for the logged-in user by email
		function fetchUserNotificationsByEmail(email) {
			$
					.ajax({
						url : 'http://localhost:8080/VendorManagement/notification/fetchUserNotifications', // Update with the correct endpoint
						type : 'GET',
						data : {
							email : email
						},
						success : function(notifications) {
							console.log('message', notifications)
							displayNotifications(notifications);
						},
						error : function(xhr, status, error) {
							console.error('Error fetching user notifications:',
									error);
						}
					});
		}

		// Function to display notifications
		function displayNotifications(notifications) {
			var notificationList = $('#notificationList');
			notificationList.empty(); // Clear previous notifications

			if (notifications.length === 0) {
				notificationList
						.append('<li class="list-group-item">No notifications</li>');
				updateNotificationBadge(0); // Update badge count to 0
			} else {
				notifications.forEach(function(notification) {
					var messageContent = notification.message.content; // Access message content
					var listItem = $('<li class="list-group-item"></li>').text(
							messageContent);
					notificationList.append(listItem);
					console.log('notification======', notification.id)
					// Mark notification as viewed
					markNotificationAsViewed(notification.id);
				});

				updateNotificationBadge(notifications.length); // Update badge count
			}

			// Show the notification dropdown
			$('#notificationDropdown').addClass('show');
		}

		// Function to mark notification as viewed
		function markNotificationAsViewed(notificationId) {
			var userEmail = $('#email').val().trim();
			// Call your backend to mark the notification as viewed
			$
					.ajax({
						url : 'http://localhost:8080/VendorManagement/notification/markNotificationAsViewed', // Update with the correct endpoint
						type : 'GET',
						data : {
							id : notificationId,
							userEmail : userEmail
						},
						success : function(response) {
							console.log('Notification marked as viewed:',
									notificationId);
						},
						error : function(xhr, status, error) {
							console.error(
									'Error marking notification as viewed:',
									error);
						}
					});
		}

		// Function to update the notification badge with the number of unread notifications
		function updateNotificationBadge(count) {
			$('#notificationBadge').text(count);
		}

		// Event listener for clicking the notification icon
		$('#notificationIcon').click(function(event) {
			event.preventDefault();
			var userEmail = $('#email').val().trim();
			fetchUserNotificationsByEmail(userEmail);
			$('#notificationDropdown').toggle();
		});

		// Call fetchUserNotificationsByEmail when the page loads to fetch initial notifications
		$(document).ready(function() {
			var userEmail = $('#email').val().trim();
			fetchUserNotificationsByEmail(userEmail);
		});
	</script> -->
	<!-- new message code -->
	<script>
		// Event listener for clicking the notification icon
		$('#notificationIcon').click(function(event) {
			event.preventDefault();
			var userEmail = $('#email').val().trim();

			// Toggle the visibility of notification dropdown
			$('#notificationDropdown').toggle();

			// If the dropdown is shown, fetch notifications and update badge
			if ($('#notificationDropdown').is(':visible')) {
				fetchUserNotificationsByEmail(userEmail);
			}

			// Periodically fetch notifications every 30 seconds
			setInterval(function() {
				if ($('#notificationDropdown').is(':visible')) {
					fetchUserNotificationsByEmail(userEmail);
				}
			}, 30000); // 30 seconds
		});

		// Function to fetch notifications for the logged-in user by email
		function fetchUserNotificationsByEmail(email) {
			$
					.ajax({
						url : 'http://localhost:8080/vendorManagementSystem/notification/fetchUserNotifications',
						type : 'GET',
						data : {
							email : email
						},
						success : function(notifications) {
							console.log('message', notifications)
							displayNotifications(notifications);
							updateNotificationBadge(notifications.length); // Update badge count
						},
						error : function(xhr, status, error) {
							console.error('Error fetching user notifications:',
									error);
						}
					});
		}

		// Function to display notifications
		function displayNotifications(notifications) {
			var notificationList = $('#notificationList');
			notificationList.empty(); // Clear previous notifications

			if (notifications.length === 0) {
				notificationList
						.append('<li class="list-group-item">No notifications</li>');
				updateNotificationBadge(0); // Update badge count to 0
			} else {
				notifications.forEach(function(notification) {
					var messageContent = notification.message.content; // Access message content
					var listItem = $('<li class="list-group-item"></li>').text(
							messageContent);
					notificationList.append(listItem);
					console.log('notification======', notification.id)
					// Mark notification as viewed
					markNotificationAsViewed(notification.id);
				});

				updateNotificationBadge(notifications.length); // Update badge count
			}
		}

		// Function to mark notification as viewed
		function markNotificationAsViewed(notificationId) {
			var userEmail = $('#email').val().trim();
			// Call your backend to mark the notification as viewed
			$
					.ajax({
						url : 'http://localhost:8080/vendorManagementSystem/notification/markNotificationAsViewed',
						type : 'GET',
						data : {
							id : notificationId,
							userEmail : userEmail
						},
						success : function(response) {
							console.log('Notification marked as viewed:',
									notificationId);
						},
						error : function(xhr, status, error) {
							console.error(
									'Error marking notification as viewed:',
									error);
						}
					});
		}

		// Function to update the notification badge with the number of unread notifications
		function updateNotificationBadge(count) {
			$('#notificationBadge').text(count);
		}
	</script>
	<!-------------------------DOWNLOAD ORDER PDF FILE ------------------>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function downloadPDF() {
			const orderId = $("#orderId").text().trim();
			if (!orderId) {
				console.error("Order ID is missing.");
				return;
			}

			const doc = new jsPDF();
			doc.setFont("Arial");

			// Add page border
			doc.rect(5, 5, 200, 280); // Border with (x, y, width, height)

			// Add header
			doc.setFontSize(20);
			doc.setFont("bold");
			doc.text("xworkz vendor management ", 70, 18, {
				align : "center"
			});

			// Add download time and date
			const currentDate = new Date().toLocaleDateString();
			const currentTime = new Date().toLocaleTimeString();
			doc.setFontSize(10);
			doc.text("Downloaded on: " + currentDate + " " + currentTime, 135,
					24);

			// Add complaint details
			doc.setFontSize(14);
			doc.text("Order Details", 70, 35, {
				align : "center"
			});
			doc.setFontSize(10);
			doc.text("Order ID: " + orderId, 10, 50);
			doc.text("Product Name: "
					+ $("#editOrderModal #productName").text().trim(), 10, 60);
			doc.text("Product Price: "
					+ $("#editOrderModal #productPrice").text().trim(), 10, 70);
			doc.text("Delivery Charge: "
					+ $("#editOrderModal #deliveryCharge").text().trim(), 10,
					80);
			doc.text("Description About Product: "
					+ $("#editOrderModal #descriptionAboutProduct").text()
							.trim(), 10, 90);
			doc.text("Order Date: " + $("#orderDate").text().trim(), 10, 100);
			doc.text("Order Quantity: " + $("#orderQuantity").text().trim(),
					10, 110);
			doc.text("Delivery Date: " + $("#deliveryDate").text().trim(), 10,
					120);
			doc.text(
					"Delivery Address: " + $("#deliveryAddress").text().trim(),
					10, 130);
			doc.text("Message: " + $("#message").text().trim(), 10, 140);
			doc.text("Order Status: " + $("#orderStatus").text().trim(), 10,
					150);

			// Add signature at the bottom
			doc.text("Signature", 170, 240, {
				align : "center"
			});

			// Add footer
			doc.setFontSize(10);
			doc.text("Website: http://localhost:8080/vendorManagementSystem",
					15, 265);
			doc.text("Email: xworkzvendormanagement@gmail.com", 15, 272);
			doc.text("Phone: +919834567890", 15, 279);
			doc.text("Address: 123 Main Street, Bengaluru, Karnataka, India",
					15, 284);

			// Save the PDF
			doc.save("order_details_" + orderId + ".pdf");
		}
	</script>




	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var email = "${email}";
			var userName = email.substring(0, email.indexOf('@'));
			document.getElementById("userName").textContent = userName;
		});
	</script>
	<script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js">
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
</body>
</html>
