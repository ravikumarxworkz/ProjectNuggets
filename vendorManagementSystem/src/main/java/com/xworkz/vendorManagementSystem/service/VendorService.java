package com.xworkz.vendorManagementSystem.service;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;

import com.xworkz.vendorManagementSystem.DTO.VendorDTO;
import com.xworkz.vendorManagementSystem.Excetion.AccountUnderVerificationException;
import com.xworkz.vendorManagementSystem.Excetion.InValidateOTPException;
import com.xworkz.vendorManagementSystem.Excetion.OTPExpiredException;

public interface VendorService {

	boolean checkEmailExistence(String email);

	boolean checkContactNumberExistence(long contactNumber);

	boolean checkGSTNumberExistence(String GSTnumber);

	boolean checkWebsiteExistence(String website);

	Set<ConstraintViolation<VendorDTO>> validateAndSaveVendorDTO(VendorDTO vendorDTO);
	
	boolean saveLoginOTP(String email);
	
	boolean validateOTPAndLogin(String email, String otp) throws InValidateOTPException,OTPExpiredException,AccountUnderVerificationException;
        
	VendorDTO getVendorDetailsByEmail(String email);
	
	String findImagePathByEmail(String email);
	
	public Set<ConstraintViolation<VendorDTO>> validateAndVendorUpdateProfile(String email, VendorDTO vendorDTO)
			throws IOException;

	  List<VendorDTO> readAllVendorData();
	  
	  boolean updateVendorStatus(int id ,String status);
	  
	  boolean Sendmessage(String email,String message);
	
} 