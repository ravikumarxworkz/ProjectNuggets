package com.xworkz.vendorManagementSystem.service;

public interface EmailIdValidationService {

	boolean saveOTPByEmailId(String email);
	
	boolean validateOPT(String email, String otp);

}
