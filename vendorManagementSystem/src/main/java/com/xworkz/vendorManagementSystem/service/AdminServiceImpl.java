package com.xworkz.vendorManagementSystem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.DTO.VendorDTO;
import com.xworkz.vendorManagementSystem.Entity.AdminEntity;
import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.Entity.VendorEntity;
import com.xworkz.vendorManagementSystem.repository.AdminRepo;
import com.xworkz.vendorManagementSystem.repository.VendorRepository;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminRepo adminRepo;
	@Autowired
	private MailSending mailSending;
	@Autowired
	private VendorRepository vendorRepository;

	@Override
	public boolean readByEmailId(String emailId) {
		return false;
	}

	@Override
	public boolean generateAndSendOTP(String email) {
		AdminEntity entity = adminRepo.readByEmailId(email);

		if (entity == null || entity.getEmailId() == null) {
			return false;
		}
		String otp = generateOTP();
		boolean save = adminRepo.updateOptById(entity.getId(), otp);
		if (save) {
			boolean sent = mailSending.sendOTPAdminEmail(entity.getEmailId(), otp, entity.getAdminName());
			if (sent) {
				return true;
			}
		}
		return false;
	}

	private String generateOTP() {
		Random random = new Random();
		int otpNumber = 100000 + random.nextInt(900000);
		return String.valueOf(otpNumber);
	}

	@Override
	public boolean validateOpt(String email, String otp) {
		AdminEntity entity = adminRepo.readByEmailId(email);

		if (entity == null || entity.getEmailId() == null) {
			return false;
		}

		if (entity.getEmailId().equals(email) && entity.getOtp().equals(otp)) {
			boolean resetOtp = adminRepo.updateOptById(entity.getId(), null);
			if (resetOtp) {
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean adminLogin(String email, String password) {
		if (email != null && password != null) {
			AdminEntity entity = adminRepo.readByEmailId(email);
			if (entity != null) {
				if (entity.getEmailId().equals(email) && entity.getPassword().equals(password)) {
					return true;
				}

			}

		}

		return false;
	}

}
