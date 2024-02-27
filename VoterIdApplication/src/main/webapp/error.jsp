<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body>
  <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div>
            <h2 style="color:black;font-weight: bolder;">Your Application Is  Not Submit </h2>
            <h3 style="color:red;font-weight: bolder;">error:${errorMessage}</h3>
            <form action="index.jsp">
                <button type="submit" class="btn btn-primary">Back to home</button>
            </form>
        </div>
    </div>
</body>
</html>