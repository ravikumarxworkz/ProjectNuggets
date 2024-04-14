package com.xworkz.womentsecuritysystem.rest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.xworkz.womentsecuritysystem.service.WomenSecurityService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/")
@Slf4j
@EnableWebMvc
public class SignUpValidationcontroller {
	@Autowired
	private WomenSecurityService service;
	 
	@GetMapping(value = "/emailId/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String onEmail(@PathVariable String email) {
		boolean emailExistsInDatabase = service.findByEmail(email);
		if (emailExistsInDatabase) {
			return "exists";
		} else {
			return " not exists";
		}
	}

	@GetMapping(value = "/aadharNumber/{aadharCardNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String onAadharNumber(@PathVariable Long aadharCardNumber) {
		boolean exists = this.service.findByAaadharcard(aadharCardNumber);

		if (exists) {
			log.info("Aadhar card number exists");
			return "aadharNumberexists";
		} else {
			log.info("Aadhar card number does not exist");
			return "aadharNumberexists is not exit";
		}
	}

	@GetMapping(value = "/contactNumber/{contactNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String onContactNumber(@PathVariable Long contactNumber) {
		System.out.println("contactNumber============" + contactNumber);
		boolean exists = this.service.findByContactNumber(contactNumber);

		if (exists) {
			log.info("Contact number exists");
			return "contactNumberexists";
		} else {
			log.info("Contact number does not exist");
			return "contactNumberexists is not exit";
		}
	}
	
	@GetMapping("/reemail")
	public ResponseEntity<String> checkEmailInDatabase(@RequestParam String email) {
		boolean emailExistsInDatabase = service.generateAndSendOTP(email);
		if (emailExistsInDatabase) {
			return ResponseEntity.ok("exists");
		} else {
			return ResponseEntity.ok("not exists");
		}
	}

	@PostMapping("/validateOTP")
	public ResponseEntity<String> validateOTP(@RequestParam String email, @RequestParam String otp) {
		boolean validate = service.validateOpt(email, otp);
		if (validate) {
			return ResponseEntity.ok("valid");
		} else {
			return ResponseEntity.ok("not valid");
		}
	}
	

}
