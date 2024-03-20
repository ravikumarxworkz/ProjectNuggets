
package com.xworkz.loginpage.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xworkz.loginpage.dao.User;
import com.xworkz.loginpage.dao.UserDao;
import com.xworkz.loginpage.dao.UserDaoImpl;

/**
 * Servlet implementation class RegisterPageServlet
 */
@WebServlet("/RegisterPageServlet")
public class RegisterPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserDao dao = new UserDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterPageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String passwords = request.getParameter("passwords");
		String email = request.getParameter("email");

		User user = new User();
		user.setUsername(username);
		user.setPasswords(passwords);
		user.setEmail(email);
		

		if (dao.addUser(user)) {
			response.sendRedirect("loginpage.jsp?registration=success");
		} else {
			response.sendRedirect("registerpage.jsp?error=1");
		}
	}

}
