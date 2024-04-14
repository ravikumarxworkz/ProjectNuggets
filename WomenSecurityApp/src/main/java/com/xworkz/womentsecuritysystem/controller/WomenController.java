package com.xworkz.womentsecuritysystem.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Random;
import java.util.Set;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.enums.IndianStates;
import com.xworkz.womentsecuritysystem.exception.PasswordMismatchException;
import com.xworkz.womentsecuritysystem.exception.UserNotFoundException;
import com.xworkz.womentsecuritysystem.service.WomenSecurityService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class WomenController {
	@Autowired
	private WomenSecurityService service;

	@GetMapping("/homePage")
	public String homePage() {
		return "index";
	}

	@GetMapping("/signupPage")
	public String signupPage(Model model) {
		model.addAttribute("allStates", IndianStates.values());
		return "signup";
	}

	@GetMapping("/signinPage")
	public String signinPage() {
		return "signin";
	}

	@GetMapping("/forgotPassword")
	public String forgotPassword() {
		return "forgotPassword";
	}

	@PostMapping("/saveSignUpValues")
	public String signUp(@ModelAttribute WomenSecurityDto dto, Model model, HttpSession session) {

		Set<ConstraintViolation<WomenSecurityDto>> constraintViolations = service.validateAndSaveDTO(dto);
		if (constraintViolations.isEmpty()) {
			session.setAttribute("accountCreateMessage", "Account created successfully. Please sign in.");
			return "signin";
		} else {
			model.addAttribute("errors", constraintViolations);
			model.addAttribute("dto", dto);
			return "redirect:/signupPage";
		}
	}

	@PostMapping("/login")
	public String signin(@RequestParam String email, String password, Model model, HttpServletRequest request,
			HttpSession session) {
		try {
			boolean signInResult = service.SignIn(email, password);
			if (signInResult) {
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("email", email);
				return "profile";
			} else {
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("errorMessage", "Login failed. Please check your credentials.");
				return "redirect:/signinPage";
			}
		} catch (UserNotFoundException | PasswordMismatchException e) {
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("errorMessage", e.getMessage());
			return "redirect:/signinPage";
		}
	}

	@PostMapping("/forgotPassword")
	public String forgotPassword(@RequestParam String email, String newPassword, String confirmPassword, Model model) {
		try {
			boolean updatePassword = service.forgotPassword(email, newPassword, confirmPassword);
			if (updatePassword) {
				model.addAttribute("sucess", "Your password has been updated successfully. Please log in again.");
				return "signin";
			}
			model.addAttribute("message", "Failed to update password. Please try again.");
			return "forgotPassword";
		} catch (UserNotFoundException e) {
			model.addAttribute("message", "Email is not registered.");
			return "forgotPassword";
		} catch (PasswordMismatchException e) {
			model.addAttribute("message", e.getMessage());
			return "forgotPassword";
		}
	}

	@GetMapping("/display")
	public void displayUserImageByEmail(HttpServletResponse response, @RequestParam String email) throws IOException {
		String imagePath = service.findImagePathByEmail(email);

		File file = new File("D:\\WomenSecuirtyAappUserImages\\" + imagePath);
		InputStream in = new BufferedInputStream(new FileInputStream(file));
		ServletOutputStream out = response.getOutputStream();
		IOUtils.copy(in, out);
		response.flushBuffer();

	}

	// profile page actions start///
	@PostMapping("actionServlet")
	public String handleAction(@RequestParam String action, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession(false); 
		if (session == null || session.getAttribute("email") == null) {
			return "index";
		}

		String emailID = (String) session.getAttribute("email");
		switch (action) {
		case "view":
		case "edit":
			if (emailID != null) {
				WomenSecurityDto userProfile = service.readByEmail(emailID);
				session.setAttribute("userProfile", userProfile);
				return action.equals("view") ? "view" : "update";
			}
			return "redirect:/homePage";

		case "logout":
			session.setAttribute("email", null);
			session.setAttribute("userProfile", null);
			session.invalidate(); // Invalidate the session
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			return "redirect:/homePage";

		case "delete":
		case "profile":
		case "safety":
		case "complaint":
		case "changePassword":
			return action;

		case "complaintHistory":
			if (emailID != null) {
				ArrayList<ComplaintsDTO> complaints = service.complaintHistoryByEmail(emailID);
				model.addAttribute("complaints", complaints);
				return "complaintHistory";
			}
			return "redirect:/homePage";

		default:
			return "redirect:/homePage";
		}
	}

	@GetMapping("/updatePage")
	public String updatePage() {
		return "update";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute WomenSecurityDto dto, Model model) {
		try {
			Set<ConstraintViolation<WomenSecurityDto>> violations = service.validateAndUpdateProfile(dto.getEmail(),
					dto);

			if (!violations.isEmpty()) {
				WomenSecurityDto oldDTO = service.readByEmail(dto.getEmail());
				model.addAttribute("errors", violations);
				model.addAttribute("userProfile", oldDTO);
				return "redirect:/updatePage";
			} else {
				WomenSecurityDto updatedDTO = service.readByEmail(dto.getEmail());
				model.addAttribute("userProfile", updatedDTO);
				model.addAttribute("message", "Your data has been updated successfully!!!");
				return "update";
			}
		} catch (IOException e) {
			WomenSecurityDto oldDTO = service.readByEmail(dto.getEmail());
			model.addAttribute("errors", e.getMessage());
			model.addAttribute("userProfile", oldDTO);
			return "redirect:/updatePage";
		}
	}

	@GetMapping("/deletePage")
	public String deletePage() {
		return "delete";

	}

	@PostMapping("/deleteAccount")
	public String deleteAccount(@RequestParam String enterEmail, String password, Model model, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) {
		String email = (String) session.getAttribute("email");

		if (!enterEmail.equals(email)) {
			session.setAttribute("message", "Please enter the registered email ID.");
			return "redirect:/deletePage";
		}

		try {
			boolean delete = service.deleteByEmailAndPassword(enterEmail, password);

			if (delete) {
				session.setAttribute("email", null);

				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("email")) {
							cookie.setValue("");
							cookie.setMaxAge(0);
							response.addCookie(cookie);
						}
					}
				}
				response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				response.setHeader("Expires", "0");
				session.setAttribute("message", "Your account has been deleted successfully.");
				session.invalidate();
				return "redirect:/homePage"; // Redirect to home page
			} else {
				session.setAttribute("message", "Failed to delete account. Please try again.");
				return "redirect:/homePage";
			}
		} catch (UserNotFoundException e) {
			session.setAttribute("message", "User not found. Please enter a registered email ID.");
			return "delete";
		} catch (PasswordMismatchException e) {
			session.setAttribute("message", "Password is incorrect.");
			return "delete";
		}
	}

	@PostMapping("/changePassword")
	public String changePassword(@RequestParam String email, String oldPassword, String newPassword,
			String confirmPassword, Model model) {
		try {
			boolean updatePassword = service.updatedPasswordByEmailandOldPassword(email, oldPassword, newPassword,
					confirmPassword);
			if (updatePassword) {
				model.addAttribute("sucess", "Your password has been updated successfully. Please log in again.");
				return "signin";
			}
			model.addAttribute("email", email);
			model.addAttribute("message", "Failed to update password. Please try again.");
			return "changePassword";
		} catch (UserNotFoundException e) {
			model.addAttribute("message", "Email is not registered.");
			return "changePassword";
		} catch (PasswordMismatchException e) {
			model.addAttribute("message", e.getMessage());
			return "changePassword";
		}
	}

	@PostMapping("/complaintSave")
	public String complaintSave(@ModelAttribute ComplaintsDTO dto, Model model) {
		log.info("ComplaintsDTO = " + dto);

		Random random = new Random();
		int complaintNumber = random.nextInt(900000) + 100000;
		dto.setComplaintNumber(complaintNumber);
		dto.setStatus("Registered");

		boolean save = service.complaintSave(dto);

		if (save) {
			model.addAttribute("complaintNumber", complaintNumber);
			model.addAttribute("message", "Complaint registered successfully");
			return "profile";
		} else {
			model.addAttribute("message", "Failed to register complaint");
			return "complaint";
		}
	}

}