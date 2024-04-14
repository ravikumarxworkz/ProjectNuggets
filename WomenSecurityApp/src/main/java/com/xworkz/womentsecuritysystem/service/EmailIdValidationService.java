package com.xworkz.womentsecuritysystem.service;

public interface EmailIdValidationService {

	boolean saveOtpByEmailId(String email);
	
	boolean validateEmailVerificationOPT(String email, String otp);

}
