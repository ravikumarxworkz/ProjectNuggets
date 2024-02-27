<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Voters' Services Portal</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
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
  .container {
    background-image: url('govt.png');
    background-repeat: no-repeat;
    background-size: cover;
    background-color: rgba(18, 17, 17, 0.5); /* Adjust the last value (0.5) for the desired opacity */
    box-sizing: border-box;
    border-radius: 20px;
    border-style: double black;
    box-shadow: 10px 10px 15px yellowgreen;
    min-height: 100vh;
}

 h2{
    color:orange;
    font-weight: bolder;
    display: flex;
    justify-content: center;
    text-align: center;
 }
 label{
color:blue;
font-weight: bolder;
 }
</style>
<body>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div>
        <h2>VoterID Application Form</h2>
        <form action="controller">
            <div class="row">
                <!-- First row of inputs -->
                <div class="col-md-2 mb-3">
                    <label for="username" class="form-label">UserName</label>
                    <input type="text" id="userName"  class="form-control" name="userName" value="${userName}" readonly="readonly"/>
                </div>
                 <div class="col-md-2 mb-3">
                    <label for="aadharcardnumber" class="form-label">AadharCardNumber</label>
                    <input type="text" id="aadharcardnumber"  class="form-control" name="aadharcardnumber" value="${aadharcardnumber}" readonly="readonly"/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="birthdate" class="form-label">BirthDate</label>
                    <input type="date" id="birthdate"  class="form-control"  name="birthdate" value="${birthdate}" readonly="readonly"/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="contactNumber" class="form-label">Contact Number</label>
                    <input type="text" id="Contact Number" class="form-control" name="contactNumber" value="${contactNumber}" readonly="readonly"/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="altContactNumber" class="form-label">AlternativeContactNumber</label>
                    <input type="text" id="altContactNumber"  class="form-control" name="altContactNumber" value="${altContactNumber}" readonly="readonly"/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input class="form-control" type="email" id="email" name="email" value="${email}" readonly="readonly"/>
                </div>
            </div>
            <div class="row">
                <!-- Second row of inputs -->
                <div class="col-md-2 mb-3">
                    <label for="country" class="form-label">Country</label>
                    <input type="text" class="form-control" id="country" name="country" value="India" readonly/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="states" class="form-label">State</label>
                    <input type="text" class="form-control" id="states" name="states" value="${states}" readonly/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="presentPlace" class="form-label">Present Place</label>
                    <input type="text" class="form-control" id="presentPlace" name="presentPlace" value="${presentPlace}" readonly="readonly"/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="permanentPlace" class="form-label">Permanent Place</label>
                    <input type="text" class="form-control" id="permanentPlace" name="permanentPlace" value="${permanentPlace}"/>
                </div>
                <div class="col-md-2 mb-3">
                    <label for="pincode" class="form-label">Pin Code</label>
                    <input type="text" class="form-control" id="pincode" name="pincode" value="${pincode}"/>
                </div>
            </div>
            <div class="row">
            <h5 style="color:red; font-weight:bolder">Note: Before submitting your application, please review your details carefully. If everything is correct, click the submit button. If you need to make any changes, click the edit button.</h5>
                <div class="col-md-6 mb-3">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                <div class="col-md-6 mb-3">
                    <a href="voteridapplication.jsp" class="btn btn-warning">Edit</a>
                </div>
            </div>
        </form>
    </div>
</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>