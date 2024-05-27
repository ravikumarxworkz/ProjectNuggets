package com.xworkz.vendorManagementSystem.RestController;

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

import com.xworkz.vendorManagementSystem.service.VendorService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/")
@Slf4j
@EnableWebMvc
public class RegisterValidationcontroller {
	@Autowired
	private VendorService vendorService;

	@GetMapping(value = "/checkEmailExistence/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkEmailExistence(@PathVariable String email) {
		boolean emailExistsInDatabase = vendorService.checkEmailExistence(email);
		if (emailExistsInDatabase) {
			System.err.println("emailExistsInDatabase==========="+emailExistsInDatabase);
			return "EmailIDexists";
		} else {
			return "  EmailID not exists";
		}
	}

	@GetMapping(value = "/checkGSTNumberExistence/{GSTNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkGSTNumberExistence(@PathVariable String GSTNumber) {
		boolean exists = this.vendorService.checkGSTNumberExistence(GSTNumber);

		if (exists) {
			log.info("GSTNumber exists");
			return "GSTNumberExist";
		} else {
			log.info("GSTNumber does not exist");
			return "GSTNumberExists is not exit";
		}
	}

	@GetMapping(value = "/checkContactNumberExistence/{contactNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkContactNumberExistence(@PathVariable Long contactNumber) {
		System.out.println("contactNumber============" + contactNumber);
		boolean exists = this.vendorService.checkContactNumberExistence(contactNumber);

		if (exists) {
			log.info("Contact number exists");
			return "contactNumberexists";
		} else {
			log.info("Contact number does not exist");
			return "contactNumberexists is not exit";
		}
	}

	@GetMapping(value = "/checkWebsiteExistence/{website}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkWebsiteExistence(@PathVariable String website) {
		System.out.println("contactNumber============" + website);
		boolean exists = this.vendorService.checkWebsiteExistence(website);

		if (exists) {
			log.info("websiteExists ");
			return "websiteExists";
		} else {
			log.info("website does not exist");
			return "website is not exit";
		}
	}

	/*
	 * @GetMapping("/reemail") public ResponseEntity<String>
	 * checkEmailInDatabase(@RequestParam String email) { boolean
	 * emailExistsInDatabase = service.generateAndSendOTP(email); if
	 * (emailExistsInDatabase) { return ResponseEntity.ok("exists"); } else { return
	 * ResponseEntity.ok("not exists"); } }
	 * 
	 * @PostMapping("/validateOTP") public ResponseEntity<String>
	 * validateOTP(@RequestParam String email, @RequestParam String otp) { boolean
	 * validate = service.validateOpt(email, otp); if (validate) { return
	 * ResponseEntity.ok("valid"); } else { return ResponseEntity.ok("not valid"); }
	 * }
	 */

}
