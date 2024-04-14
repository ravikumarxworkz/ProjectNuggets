package com.xworkz.womentsecuritysystem.repository;

import com.xworkz.womentsecuritysystem.entity.EmailValidationEntity;

public interface EmailIdValidationRepo {

	boolean saveOtpByEmailId(EmailValidationEntity entity);

	String findLatestOtpByEmail(String email);

	boolean deleteEmailVerificationDataByEmail(String email);

}
