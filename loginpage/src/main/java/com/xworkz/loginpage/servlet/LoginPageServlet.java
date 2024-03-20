package com.xworkz.loginpage.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xworkz.loginpage.dao.UserDao;
import com.xworkz.loginpage.dao.UserDaoImpl;

/**
 * Servlet implementation class LoginPageServlet
 */
@WebServlet("/LoginPageServlet")
public class LoginPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDao dao = new UserDaoImpl();
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginPageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String passwords = request.getParameter("passwords");

		if (dao.isValiderUser(username, passwords)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("welcomepage.jsp");
		} else {
			response.sendRedirect("loginpage.jsp?error=1");
			System.out.println("error");
		}

	}
}
