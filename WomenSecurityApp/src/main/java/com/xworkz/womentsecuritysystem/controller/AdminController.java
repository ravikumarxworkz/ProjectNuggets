package com.xworkz.womentsecuritysystem.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.service.AdminService;
import com.xworkz.womentsecuritysystem.service.WomenSecurityService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private WomenSecurityService service;

	@GetMapping("/adminLoginPage")
	public String adminPage() {
		return "adminlogin";

	}

	@GetMapping("/reemail")
	public ResponseEntity<String> checkEmailInDatabase(@RequestParam String email) {
		boolean emailExistsInDatabase = adminService.generateAndSendOTP(email);
		if (emailExistsInDatabase) {
			return ResponseEntity.ok("exists");
		} else {
			return ResponseEntity.ok("not exists");
		}
	}

	@PostMapping("/validateOTP")
	public ResponseEntity<String> validateOTP(@RequestParam String email, @RequestParam String otp) {
		boolean validate = adminService.validateOpt(email, otp);
		if (validate) {
			return ResponseEntity.ok("valid");
		} else {
			return ResponseEntity.ok("not valid");
		}
	}

	@PostMapping("/Login")
	public String adminLogin(@RequestParam String email, String password, Model model, HttpServletRequest request,
			HttpSession session) {
		boolean login = adminService.adminLogin(email, password);
		if (login) {
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("email", email);
			return "adminpage";
		}
		model.addAttribute("error", "Incorrect password");
		return "redirect:/adminLoginPage";
	}

	@GetMapping("/display")
	public void displayUserImageByEmail(HttpServletResponse response, @RequestParam String email) throws IOException {
		String imagePath = service.findImagePathByEmail(email);
		if (imagePath != null) {
			File file = new File("D:\\WomenSecuirtyAappUserImages\\" + imagePath);
			InputStream in = new BufferedInputStream(new FileInputStream(file));
			ServletOutputStream out = response.getOutputStream();
			IOUtils.copy(in, out);
			response.flushBuffer();
		}
	}

	@GetMapping("/getUserData")
	@ResponseBody
	public List<WomenSecurityDto> getData() {
		List<WomenSecurityDto> data = service.readAll();
		return data;
	}

	@GetMapping("/getComplaintData")
	@ResponseBody
	public List<ComplaintsDTO> getComplaintDetails() {
		List<ComplaintsDTO> complaintData = service.readAllComplaints();
		System.err.println(complaintData);
		return complaintData;
	}

	@GetMapping("/getUserDataByEmail")
	@ResponseBody
	public WomenSecurityDto getUserByEmail(@RequestParam String email) {

		WomenSecurityDto filteredData = service.readByEmail(email);
		return filteredData;
	}

	@GetMapping("/adminLogout")
	public String logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession httpSession = request.getSession(false);

		if (httpSession != null) {
			httpSession.setAttribute("username", null);
			httpSession.invalidate();
		}

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		return "redirect:/homePage";
	}

	@PostMapping("/update")
	public ResponseEntity<Object> update(@ModelAttribute WomenSecurityDto dto) {
		try {
			Set<ConstraintViolation<WomenSecurityDto>> violations = service.validateAndUpdateProfile(dto.getEmail(),
					dto);

			if (!violations.isEmpty()) {
				List<Object> errors = new ArrayList<>();
				for (ConstraintViolation<WomenSecurityDto> violation : violations) {
					String errorMessage = violation.getMessage();
					System.err.println("errorMessage=============" + errorMessage);
					if (errorMessage.equals("Contact number already exists")) {
						return ResponseEntity.ok().body("Contact number already exists");
					} else if (errorMessage.equals("Aadhar card number already exists")) {
						return ResponseEntity.ok().body("DAadhar card number already exists");
					} else {
						errors.add(errorMessage);
					}
				}
				return ResponseEntity.badRequest().body(errors);
			} else {
				return ResponseEntity.ok().body("Data updated successfully");
			}
		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Failed to update data: " + e.getMessage());
		}
	}

	@PostMapping("updateComplaint")
	@ResponseBody
	public String updateComplaint(@RequestParam String id, String status) {

		int compalintID = Integer.parseInt(id);
		boolean update = service.updateComplaintStatus(compalintID, status);
		System.out.println("Received complaint ID: " + id);
		System.out.println("Received status: " + status);
		if (!update) {
			return "Complaint not updated successfully";
		}

		return "Complaint updated successfully";
	}

}
