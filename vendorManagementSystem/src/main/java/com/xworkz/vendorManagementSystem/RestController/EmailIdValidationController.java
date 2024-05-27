package com.xworkz.vendorManagementSystem.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.xworkz.vendorManagementSystem.service.*;

@RestController
@RequestMapping("/")

@EnableWebMvc
public class EmailIdValidationController {

	@Autowired
	private EmailIdValidationService emailIdValidationService;

	@GetMapping("/genrateOTPAndSave")
	public ResponseEntity<String> genrateOTPAndSave(@RequestParam String email) {
		boolean emailExistsInDatabase = emailIdValidationService.saveOTPByEmailId(email);
		if (emailExistsInDatabase) {
			return ResponseEntity.ok("Exists");
		} else {
			return ResponseEntity.ok("not exists");
		}
	}

	@PostMapping("/validateEmailVerificationOTP")
	public ResponseEntity<String> validateOTP(@RequestParam String email, @RequestParam String otp) {
		boolean validate = emailIdValidationService.validateOPT(email, otp);
		if (validate) {
			return ResponseEntity.ok("valid");
		} else {
			return ResponseEntity.ok("not valid");
		}
	}

}
