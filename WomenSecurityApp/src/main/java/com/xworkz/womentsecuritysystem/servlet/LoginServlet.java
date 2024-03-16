package com.xworkz.womentsecuritysystem.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xworkz.womentsecuritysystem.service.WomenSecurityService;
import com.xworkz.womentsecuritysystem.service.WomenSecurityServiceImpl;

@WebServlet(urlPatterns = "/signin")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 6273823197891419169L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String email = req.getParameter("email");

		long contactNumber = Long.parseLong(req.getParameter("password"));

		WomenSecurityService service = new WomenSecurityServiceImpl();

		boolean logIn = service.logIn(email, contactNumber);

		if (logIn) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/profile.jsp");

			req.setAttribute("email", email);
			req.setAttribute("contactNumber", contactNumber);

			dispatcher.forward(req, res);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/signin.jsp");

			req.setAttribute("errorMessage", "you enter wrong emailID and password or your nor create account");

			dispatcher.forward(req, res);
		}
	}
}
