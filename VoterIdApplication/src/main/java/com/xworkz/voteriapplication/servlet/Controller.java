package com.xworkz.voteriapplication.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import com.xworkz.voteriapplication.dto.VoterIdDto;
import com.xworkz.voteriapplication.service.VoterIdService;
import com.xworkz.voteriapplication.service.VoterIdServiceImpl;

@WebServlet(urlPatterns = "/controller")
public class Controller extends GenericServlet {

	private static final long serialVersionUID = 1L;

	public Controller() {
		super();
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("userName");
		long aadharCardNumber = Long.parseLong(req.getParameter("aadharcardnumber"));
		String dob = req.getParameter("birthdate");
		long contactNumber = Long.parseLong(req.getParameter("contactNumber"));
		long altContactNumber = Long.parseLong(req.getParameter("altContactNumber"));
		String email = req.getParameter("email");
		String country = req.getParameter("country");
		String state = req.getParameter("states");
		String presentPlace = req.getParameter("presentPlace");
		String permanentPlace = req.getParameter("permanentPlace");
		int pincode = Integer.parseInt(req.getParameter("pincode"));
		// Generating voter ID
		char s1 = state.charAt(0);
		char s2 = state.charAt(1);
		char n1 = name.charAt(0);
		Random random = new Random();
		int randomNumber = random.nextInt(900000) + 100000;
		String combinedValue = String.valueOf(s1) + String.valueOf(s2) + "I" + String.valueOf(n1) + randomNumber;
		final String voterID = combinedValue.toUpperCase();
		VoterIdService idService = new VoterIdServiceImpl();
		VoterIdDto dto = new VoterIdDto();
		dto.setName(name);
		dto.setAadharCardNumber(aadharCardNumber);
		dto.setDateOfBirth(dob);
		dto.setContactNumber(contactNumber);
		dto.setAltContactNumber(altContactNumber);
		dto.setEmail(email);
		dto.setCountry(country);
		dto.setState(state);
		dto.setPresentPlace(presentPlace);
		dto.setPermanentPlace(permanentPlace);
		dto.setPincode(pincode);
		dto.setVoterId(voterID);
		System.out.println(dto);
		boolean validate = idService.validateAndSave(dto);
		if (validate) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/final.jsp");

			req.setAttribute("userName", name);
			req.setAttribute("aadharcardnumber", aadharCardNumber);
			req.setAttribute("birthdate", dob);
			req.setAttribute("contactNumber", contactNumber);
			req.setAttribute("altContactNumber", altContactNumber);
			req.setAttribute("email", email);
			req.setAttribute("country", country);
			req.setAttribute("states", state);
			req.setAttribute("presentPlace", presentPlace);
			req.setAttribute("permanentPlace", permanentPlace);
			req.setAttribute("pincode", pincode);
			req.setAttribute("voterId", voterID);

			dispatcher.forward(req, res);
		} else {
			req.setAttribute("errorMessage",
					"Failed to submit your voter details because there is already a registered voter ID associated with your Aadhar card.");
			req.getRequestDispatcher("/error.jsp").forward(req, res);
		}
	}
}

