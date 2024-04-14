package com.xworkz.womentsecuritysystem.service;

import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.womentsecuritysystem.entity.EmailValidationEntity;
import com.xworkz.womentsecuritysystem.repository.EmailIdValidationRepo;

@Service
public class EmailIdValidationServiceImpl implements EmailIdValidationService {

	@Autowired
	private EmailIdValidationRepo repo;

	@Autowired
	private MailSending mailSending;

	@Override
	public boolean saveOtpByEmailId(String email) {
		if (email != null) {
			Random random = new Random();
			int generatedOtp = random.nextInt(900000) + 100000;
			String otp = String.valueOf(generatedOtp);
			EmailValidationEntity entity = new EmailValidationEntity();
			entity.setEmail(email);
			entity.setOtp(otp);
			entity.setCreatedAt(LocalDateTime.now());

			boolean saveOtp = repo.saveOtpByEmailId(entity);
			if (saveOtp) {
				boolean sent = mailSending.emailVerficationOtp(email, otp);
				if (sent) {
					return true;
				}

			}
		}

		return false;
	}

	@Override
	public boolean validateEmailVerificationOPT(String email, String otp) {

		if (email != null && otp != null) {
			String latestotp = repo.findLatestOtpByEmail(email);
			if (latestotp != null) {
				if (latestotp.equals(otp)) {
					 repo.deleteEmailVerificationDataByEmail(email);
					return true;
				}
			}

		}

		return false;
	}

}
