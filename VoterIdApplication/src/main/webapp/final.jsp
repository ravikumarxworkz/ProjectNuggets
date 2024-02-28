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
<link rel="shortcut icon" href="voter.svg" type="image/x-icon" />
</head>
<body>
    <form id="pdfFormData" style="display: none;">
        <input type="hidden" id="userName" value="${userName}">
        <input type="hidden" id="aadharcardnumber" value="${aadharcardnumber}">
        <input type="hidden" id="birthdate" value="${birthdate}">
        <input type="hidden" id="contactNumber" value="${contactNumber}">
        <input type="hidden" id="altContactNumber" value="${altContactNumber}">
        <input type="hidden" id="email" value="${email}">
        <input type="hidden" id="country" value="${country}">
        <input type="hidden" id="states" value="${states}">
        <input type="hidden" id="presentPlace" value="${presentPlace}">
        <input type="hidden" id="permanentPlace" value="${permanentPlace}">
        <input type="hidden" id="pincode" value="${pincode}">
        <input type="hidden" id="voterid" value="${voterId}">
    </form>

    <div class="container d-flex justify-content-center align-items-center"
        style="min-height: 100vh;">
        <div>
            <h2 style="color: black; font-weight: bolder;">Your application
                has been submitted successfully</h2>
            <h3>Your voter ID number is: ${voterId}</h3>
            <button id="downloadPdfButton" class="btn btn-success">Download PDF</button> <br><br>
            <form action="index.jsp">
                <button type="submit" class="btn btn-primary">Back to Home</button>
            </form>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script>
        document.getElementById('downloadPdfButton').addEventListener('click', function() {
            // Populate data from hidden form fields
            const userName = document.getElementById('userName').value;
            const aadharcardnumber = document.getElementById('aadharcardnumber').value;
            const birthdate = document.getElementById('birthdate').value;
            const contactNumber = document.getElementById('contactNumber').value;
            const altContactNumber = document.getElementById('altContactNumber').value;
            const email = document.getElementById('email').value;
            const country = document.getElementById('country').value;
            const states = document.getElementById('states').value;
            const presentPlace = document.getElementById('presentPlace').value;
            const permanentPlace = document.getElementById('permanentPlace').value;
            const pincode = document.getElementById('pincode').value;
            const voterId = document.getElementById('voterid').value;

            // Create PDF content
            const content = `
                <h2 style="color: orangered;" >Your Voter ID Details</h2>
                <p><strong>Voter ID number:</strong> <b style="color: red;" >${voterId}</b> </p>
                <p><strong>Username:</strong> ${userName}</p>
                <p><strong>Aadhar Card Number:</strong> ${aadharcardnumber}</p>
                <p><strong>Birthdate:</strong> ${birthdate}</p>
                <p><strong>Contact Number:</strong> ${contactNumber}</p>
                <p><strong>Alt Contact Number:</strong> ${altContactNumber}</p>
                <p><strong>Email:</strong> ${email}</p>
                <p><strong>Country:</strong> ${country}</p>
                <p><strong>State:</strong> ${states}</p>
                <p><strong>Present Place:</strong> ${presentPlace}</p>
                <p><strong>Permanent Place:</strong> ${permanentPlace}</p>
                <p><strong>Pincode:</strong> ${pincode}</p>
            `;

            // Options for PDF generation
            const opt = {
                margin: 1,
                filename: 'voter_id_details.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
            };

            // Generate PDF
            html2pdf().set(opt).from(content).save();
        });
    </script>
</body>
</html>



