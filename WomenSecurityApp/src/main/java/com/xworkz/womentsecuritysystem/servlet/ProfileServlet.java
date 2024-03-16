package com.xworkz.womentsecuritysystem.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;
import com.xworkz.womentsecuritysystem.service.WomenSecurityService;
import com.xworkz.womentsecuritysystem.service.WomenSecurityServiceImpl;

@WebServlet("/actionServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	WomenSecurityService service = new WomenSecurityServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String email = request.getParameter("email");
		String contactNumberString = request.getParameter("contactNumber");
		long contactNumber = 0;
		if (contactNumberString != null && !contactNumberString.isEmpty()) {
			contactNumber = Long.parseLong(contactNumberString);
		}

		if (action != null) {
			switch (action) {
			case "view":
				WomenSecurityEntity dto1 = service.view(email, contactNumber);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view.jsp");
				request.setAttribute("userProfile", dto1);
				dispatcher.forward(request, response);

				break;
			case "edit":
				WomenSecurityEntity dto2 = service.view(email, contactNumber);
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("/update.jsp");
				request.setAttribute("userProfile", dto2);
				dispatcher1.forward(request, response);
				break;
			case "update":
				int id = Integer.parseInt(request.getParameter("id"));
				long updateNumber = Long.parseLong(request.getParameter("contactNumber"));
				WomenSecurityDto dto = new WomenSecurityDto();
				dto.setId(Integer.parseInt(request.getParameter("id")));
				dto.setName(request.getParameter("name"));
				dto.setAadharCardNumber(Long.parseLong(request.getParameter("aadharCardNumber")));
				dto.setDateOfBirth(request.getParameter("dateOfBirth"));
				dto.setContactNumber(Long.parseLong(request.getParameter("contactNumber")));
				dto.setAltContactNumber(Long.parseLong(request.getParameter("altContactNumber")));
				dto.setEmail(request.getParameter("email"));
				dto.setWorking(request.getParameter("working"));
				dto.setCountry(request.getParameter("country"));
				dto.setState(request.getParameter("state"));
				dto.setPresentPlace(request.getParameter("presentPlace"));
				dto.setPermanentPlace(request.getParameter("permanentPlace"));
				dto.setPincode(Integer.parseInt(request.getParameter("pincode")));
				boolean update = service.update(id, dto);
				if (update) {
					boolean updateLogin = service.logIn(email, updateNumber);
					if (updateLogin) {
						RequestDispatcher dispatcher9 = request.getRequestDispatcher("/profile.jsp");

						request.setAttribute("email", email);
						request.setAttribute("contactNumber", updateNumber);
						request.setAttribute("updateddata",
								"Your data has been updated successfully!!! Go to profile and click on view to see the updated data.");

						dispatcher9.forward(request, response);
					}
				}
				break;
			case "delete":
				boolean delete = service.delete(email);
				if (delete) {
					RequestDispatcher dispatcher3 = request.getRequestDispatcher("/index.jsp");
					request.setAttribute("delete", "your account is deleted successfully");
					dispatcher3.forward(request, response);
				}
				break;
			case "logout":
				RequestDispatcher dispatcher4 = request.getRequestDispatcher("/index.jsp");
				request.setAttribute("logout", "you logout successfully");
				dispatcher4.forward(request, response);

				break;
			case "home":
				boolean home = service.logIn(email, contactNumber);
				if (home) {
					RequestDispatcher dispatcher5 = request.getRequestDispatcher("/profile.jsp");

					request.setAttribute("email", email);
					request.setAttribute("contactNumber", contactNumber);

					dispatcher5.forward(request, response);
				}

				break;
			case "safety":
				boolean safety = service.logIn(email, contactNumber);
				if (safety) {
					RequestDispatcher dispatcher6 = request.getRequestDispatcher("/news.jsp");
					request.setAttribute("email", email);
					request.setAttribute("contactNumber", contactNumber);
					dispatcher6.forward(request, response);
				}

				break;
			case "complaint":
				boolean complaint = service.logIn(email, contactNumber);
				if (complaint) {
					RequestDispatcher dispatcher7 = request.getRequestDispatcher("/complaint.jsp");

					request.setAttribute("email", email);
					request.setAttribute("contactNumber", contactNumber);

					dispatcher7.forward(request, response);
				}

				break;
			case "complaintSave":
				String name = request.getParameter("name");
				String dateTimeString = request.getParameter("incidentTiming");
				LocalDateTime dateTime = LocalDateTime.parse(dateTimeString);
				String place = request.getParameter("place");
				String aboutIncident = request.getParameter("aboutIncident");
				String complaintPhoneNumberString = request.getParameter("number");
				long complaintContactNumber = 0;
				if (complaintPhoneNumberString != null && !complaintPhoneNumberString.isEmpty()) {
					complaintContactNumber = Long.parseLong(complaintPhoneNumberString);
				}
				Random random = new Random();
				int complaintNumber = random.nextInt(900000) + 100000;
				ComplaintsDTO complaintsDTO = new ComplaintsDTO();
				complaintsDTO.setName(name);
				complaintsDTO.setIncidentTiming(dateTime);
				complaintsDTO.setPlace(place);
				complaintsDTO.setAboutIncident(aboutIncident);
				complaintsDTO.setContactNumber(complaintContactNumber);
				complaintsDTO.setEmail(email);
				complaintsDTO.setComplaintNumber(complaintNumber);
				boolean complaints = service.complaintSave(complaintsDTO);

				if (complaints) {

					boolean complaintlog = service.logIn(email, contactNumber);
					if (complaintlog) {
						RequestDispatcher dispatcher8 = request.getRequestDispatcher("/profile.jsp");

						request.setAttribute("email", email);
						request.setAttribute("contactNumber", contactNumber);
						request.setAttribute("complaintNumber", complaintNumber);
						request.setAttribute("complaint", "compaint is register successfully");

						dispatcher8.forward(request, response);

					}
				}

				break;
			case "complaintHistory":
				boolean complaintHistory = service.logIn(email, contactNumber);
				if (complaintHistory) {
					ArrayList<ComplaintsEntity> read = service.complaintHistortyByemail(email);
					RequestDispatcher dispatcher9 = request.getRequestDispatcher("/complaintHistory.jsp");

					request.setAttribute("email", email);
					request.setAttribute("contactNumber", contactNumber);
					request.setAttribute("read", read);

					dispatcher9.forward(request, response);
				}

				break;

			default:
				break;
			}
		}
	}

}
