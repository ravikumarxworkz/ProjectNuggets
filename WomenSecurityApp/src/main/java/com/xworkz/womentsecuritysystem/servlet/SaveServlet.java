package com.xworkz.womentsecuritysystem.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.enums.AccountStatus;
import com.xworkz.womentsecuritysystem.service.WomenSecurityService;
import com.xworkz.womentsecuritysystem.service.WomenSecurityServiceImpl;

@WebServlet(urlPatterns = "/save")
public class SaveServlet extends HttpServlet {

	private static final long serialVersionUID = 6273823197891419169L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		WomenSecurityService service = new WomenSecurityServiceImpl();
		WomenSecurityDto dto = new WomenSecurityDto();
		dto.setName(req.getParameter("userName"));
		dto.setAadharCardNumber(Long.parseLong(req.getParameter("aadharcardnumber")));
		dto.setDateOfBirth(req.getParameter("birthdate"));
		dto.setContactNumber(Long.parseLong(req.getParameter("contactNumber")));
		dto.setAltContactNumber(Long.parseLong(req.getParameter("altContactNumber")));
		dto.setEmail(req.getParameter("email"));
		dto.setCountry(req.getParameter("country"));
		dto.setWorking(req.getParameter("working"));
		dto.setState(req.getParameter("state"));
		dto.setPresentPlace(req.getParameter("presentPlace"));
		dto.setPermanentPlace(req.getParameter("permanentPlace"));
		dto.setPincode(Integer.parseInt(req.getParameter("pincode")));
		dto.setAccountstatus(AccountStatus.ACTIVE.toString());
		;
		System.out.println(dto);
		boolean validate = service.save(dto);
		if (validate) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/signin.jsp");

			req.setAttribute("accountCreateMessage ", "you account careate  successfully login Here!!");

			dispatcher.forward(req, res);
		} else {
			req.setAttribute("errorMessage",
					"Failed to submit your women  details because your email id is already exited.");
			req.getRequestDispatcher("/signup.jsp").forward(req, res);
		}
	}
}
