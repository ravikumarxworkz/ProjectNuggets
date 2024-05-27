package com.xworkz.vendorManagementSystem.service;



public interface AdminService {

	boolean readByEmailId(String emailId);

	boolean generateAndSendOTP(String email);

	boolean validateOpt(String email, String otp);

	boolean adminLogin(String email, String password);



}
