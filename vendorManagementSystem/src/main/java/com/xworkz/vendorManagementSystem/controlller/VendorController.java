package com.xworkz.vendorManagementSystem.controlller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xworkz.vendorManagementSystem.DTO.AnnouncementDTO;
import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.DTO.VendorDTO;
import com.xworkz.vendorManagementSystem.Excetion.AccountUnderVerificationException;
import com.xworkz.vendorManagementSystem.Excetion.InValidateOTPException;
import com.xworkz.vendorManagementSystem.Excetion.OTPExpiredException;
import com.xworkz.vendorManagementSystem.service.AnnouncementService;
import com.xworkz.vendorManagementSystem.service.VendorService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class VendorController {

	@Autowired
	private VendorService vendorService;
	
	@Autowired
	private AnnouncementService announcementService;

	@GetMapping("homePage")
	public String homePage() {
		return "index";

	}

	@GetMapping("logInPage")
	public String logInPage() {
		return "logIn";

	}

	@GetMapping("registerPage")
	public String registerPage() {
		return "register";

	}

	@PostMapping("saveVendorDTO")
	public String saveVendorDTO(VendorDTO dto, Model model, HttpSession session) {
		Set<ConstraintViolation<VendorDTO>> constraintViolations = vendorService.validateAndSaveVendorDTO(dto);
		if (constraintViolations.isEmpty()) {
			session.setAttribute("accountCreateMessage", "Account created successfully. Please sign in.");
			return "logIn";
		} else {
			model.addAttribute("errors", constraintViolations);
			return "redirect:/registerPage";
		}

	}

	@PostMapping("/logInProfile")
	public String logIn(@RequestParam String email, String OTP, Model model, HttpSession session,
			HttpServletRequest request) {
		try {
			boolean login = vendorService.validateOTPAndLogin(email, OTP);

			if (login) {
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("email", email);

				return "profile";
			} else {
				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("errorMessage", "Login failed. Please check your credentials.");
				return "redirect:/logInPage";
			}
		} catch (InValidateOTPException | AccountUnderVerificationException | OTPExpiredException e) {
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("errorMessage", e.getMessage());
			return "redirect:/logInPage";
		}
	}

	// profile page actions start///
	@GetMapping("actionServlet")
	public String handleAction(@RequestParam String action, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("email") == null) {
			return "index";
		}
		String emailID = (String) session.getAttribute("email");
		switch (action) {
		case "edit":
			if (emailID != null) {
				VendorDTO userProfile = vendorService.getVendorDetailsByEmail(emailID);
				session.setAttribute("userProfile", userProfile);
				return "update";
			}
			return "redirect:/homePage";

		case "profile":
			return "profile";
		case "logout":
			session.setAttribute("email", null);
			session.setAttribute("userProfile", null);
			session.invalidate(); // Invalidate the session
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
			return "redirect:/homePage";

		default:
			return "redirect:/homePage";
		}
	}

	@GetMapping("/display")
	public void displayUserImageByEmail(HttpServletResponse response, @RequestParam String email) throws IOException {
		String imagePath = vendorService.findImagePathByEmail(email);
		System.err.println("imagePath======================" + imagePath);
		File file = new File("D:\\vendorManageMentUserProfileImage\\" + imagePath);
		/*
		 * File file = new File("‪D:\\vendorManageMentUserProfileImage\\" + imagePath);
		 */
		InputStream in = new BufferedInputStream(new FileInputStream(file));
		ServletOutputStream out = response.getOutputStream();
		IOUtils.copy(in, out);
		response.flushBuffer();

	}

	@GetMapping("/updatePage")
	public String updatePage() {
		return "update";
	}

	@PostMapping("/updateVendorProfile")
	public String updateVendorProfile(@ModelAttribute VendorDTO dto, Model model) {
		System.err.println("updateVendorProfile===========" + dto);
		try {
			Set<ConstraintViolation<VendorDTO>> violations = vendorService
					.validateAndVendorUpdateProfile(dto.getEmailId(), dto);

			if (!violations.isEmpty()) {
				VendorDTO oldDTO = vendorService.getVendorDetailsByEmail(dto.getEmailId());
				model.addAttribute("errors", violations);
				model.addAttribute("userProfile", oldDTO);
				return "redirect:/updatePage";
			} else {
				VendorDTO updatedDTO = vendorService.getVendorDetailsByEmail(dto.getEmailId());
				model.addAttribute("userProfile", updatedDTO);
				model.addAttribute("message", "Your data has been updated successfully!!!");
				return "update";
			}
		} catch (IOException e) {
			VendorDTO oldDTO = vendorService.getVendorDetailsByEmail(dto.getEmailId());
			model.addAttribute("errors", e.getMessage());
			model.addAttribute("userProfile", oldDTO);
			return "redirect:/updatePage";
		}
	}

	@GetMapping("/sendMessage")
	@ResponseBody
	public ResponseEntity<String> sendMessage(@RequestParam String email, @RequestParam String message) {
		System.err.println("email=========controller==" + email);
		System.err.println("message=========controller==" + message);
		boolean sendMessage = vendorService.Sendmessage(email, message);
		if (sendMessage) {
			return ResponseEntity.ok().body("message sent successfully");
		}
		return ResponseEntity.ok().body("!message sent successfully");
	}
	
	@GetMapping("/getVendorAnnouncements")
	@ResponseBody
	public List<AnnouncementDTO> getAnnouncements() {
		System.out.println("this is  getAnnouncements");
		List<AnnouncementDTO> announcements = this.announcementService.getAllAnnouncements();
		return announcements;
	}

}
