package com.xworkz.vendorManagementSystem.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.xworkz.vendorManagementSystem.service.EmailIdValidationService;
import com.xworkz.vendorManagementSystem.service.VendorService;

@RestController
@RequestMapping("/loginOTP")
@EnableWebMvc
public class LogInController {

	@Autowired
	private VendorService vendorService;

	@GetMapping("/genrateLoginOTPAndSave")
	public ResponseEntity<String> genrateOTPAndSave(@RequestParam String email) {
		System.err.println("+++++++++++++++++++++++++++++++++++");
		boolean emailExistsInDatabase = vendorService.saveLoginOTP(email);
		if (emailExistsInDatabase) {
			System.err.println("==========================================");
			return ResponseEntity.ok("OPTSentSuccessfully");
		} else {
			return ResponseEntity.ok("OPTSentnotSuccessfully");
		}
	}
}
