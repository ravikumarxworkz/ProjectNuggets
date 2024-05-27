package com.xworkz.vendorManagementSystem.service;

import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.vendorManagementSystem.Entity.EmailValidationEntity;
import com.xworkz.vendorManagementSystem.repository.EmailIdValidationRepo;

@Service
public class EmailIdValidationServiceImpl implements EmailIdValidationService {

	@Autowired
	private EmailIdValidationRepo emailIdValidationRepo;

	@Autowired
	private MailSending mailSending;

	@Override
	public boolean saveOTPByEmailId(String email) {
		if (email != null) {
			Random random = new Random();
			int generatedOtp = random.nextInt(900000) + 100000;
			String OTP = String.valueOf(generatedOtp);
			EmailValidationEntity entity = new EmailValidationEntity();
			entity.setEmail(email);
			entity.setOTP(OTP);
			entity.setOTPCreatedTime(LocalDateTime.now());

			boolean saveOTP = emailIdValidationRepo.saveOTPByEmailId(entity);
			if (saveOTP) {
				boolean sent = mailSending.sendEmailVerficationOTP(email, OTP);
				if (sent) {
					return true;
				}

			}
		}

		return false;
	}

	@Override
	public boolean validateOPT(String email, String otp) {

		if (email != null && otp != null) {
			String latestotp = emailIdValidationRepo.findLatestOTPByEmailId(email);
			if (latestotp != null) {
				if (latestotp.equals(otp)) {
					emailIdValidationRepo.deleteEmailVerificationDataByEmailId(email);
					return true;
				}
			}

		}

		return false;
	}

}
