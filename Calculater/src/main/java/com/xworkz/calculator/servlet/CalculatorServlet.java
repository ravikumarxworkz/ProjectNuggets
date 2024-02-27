package com.xworkz.calculator.servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/submit")
public class CalculatorServlet extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8391860792427780844L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
		String operator = req.getParameter("operator");
		double result = 0;

		switch (operator) {
		case "+":
			result = num1 + num2;
			break;
		case "-":
			result = num1 - num2;
			break;
		case "*":
			result = num1 * num2;
			break;
		case "/":
			if (num2 != 0) {
				result = num1 / num2;
			} else {
				return;
			}
			break;
		default:
			return;
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");

		req.setAttribute("result", result);

		dispatcher.forward(req, res);
	}

}
