package com.xworkz.voteriapplication.servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/VoterIdApplicationServlet")
public class VoterIdApplicationServlet extends GenericServlet {

	private static final long serialVersionUID = -8269724911920992600L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/submit.jsp");

		String[] parameters = { "userName", "aadharcardnumber", "birthdate", "contactNumber", "altContactNumber",
				"email", "country", "states", "presentPlace", "permanentPlace", "pincode" };

		for (String parameter : parameters) {
			String value = req.getParameter(parameter);
			req.setAttribute(parameter, value);
		}

		dispatcher.forward(req, res);

	}

}
