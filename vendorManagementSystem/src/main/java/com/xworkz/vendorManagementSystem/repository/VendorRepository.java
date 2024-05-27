package com.xworkz.vendorManagementSystem.repository;

import java.time.LocalDateTime;
import java.util.List;

import com.xworkz.vendorManagementSystem.DTO.VendorDTO;
import com.xworkz.vendorManagementSystem.Entity.EmailValidationEntity;
import com.xworkz.vendorManagementSystem.Entity.VendorEntity;

public interface VendorRepository {

	boolean checkEmailExistence(String email);

	boolean checkContactNumberExistence(long contactNumber);

	boolean checkGSTNumberExistence(String GSTnumber);

	boolean checkWebsiteExistence(String website);

	boolean VendorEntitySave(VendorEntity vendorEntity);

	boolean saveLoginOTPByEmailId(String email, String generatedOTP, LocalDateTime OTPGenerationTime);

	Object[] getOTPAndGenerationTimeByEmail(String email);
	
	VendorEntity getVendorDetailsByEmail(String email);
	
	String findImagePathByEmail(String email);
	
	VendorEntity findVendorByEmail(String email);
	
	int findIdByEmail(String email);
	
	List<VendorEntity> readAllvendorDetailes();
	
	boolean updateVendorDetailsById(int id, VendorEntity vendorEntity);
	
	List<VendorEntity> readAllvendorDeta();
	
  boolean updateVendorStatus(int id ,String status);

}