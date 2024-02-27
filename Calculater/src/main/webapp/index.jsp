<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Calculator</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
body{
background-color:skyblue;

}
.calculator {
	background-color: #f8f9fa;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
	padding: 20px;
	border-radius: 10px;
	margin-top: 50px;
}

input {
	padding: 5px;
	margin: 5px;
}
h4{
color:red;
font-style:italic;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6 calculator">
				<h4 class="text-center mb-4">Simple Calculator</h4>
				<form action="submit">
					<div class="form-row align-items-center">
						<div class="col">
							<input type="tel" class="form-control" name="num1"
								placeholder="Enter first number" required />
						</div>
						<div class="col">
							<select class="form-control" id="operator" name="operator">
								<option value="+">+</option>
								<option value="-">-</option>
								<option value="*">*</option>
								<option value="/">/</option>
							</select>
						</div>
						<div class="col">
							<input type="tel" class="form-control" name="num2"
								placeholder="Enter second number" required />
						</div>
						<div class="col">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</form>
				<div class="form-group mt-3">
					<label for="result">Result:</label> <input type="tel"
						class="form-control" id="result" placeholder="Result"
						value="${result}" readonly />
				</div>
			</div>
		</div>
	</div>
</body>

</html>
