package com.xworkz.vendorManagementSystem.repository;

import com.xworkz.vendorManagementSystem.Entity.EmailValidationEntity;

public interface EmailIdValidationRepo {

	boolean saveOTPByEmailId(EmailValidationEntity entity);

	String findLatestOTPByEmailId(String email);

	boolean deleteEmailVerificationDataByEmailId(String email);

}
