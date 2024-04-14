package com.xworkz.womentsecuritysystem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.entity.AdminEntity;
import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;
import com.xworkz.womentsecuritysystem.repository.AdminRepo;
import com.xworkz.womentsecuritysystem.repository.WomenSecurityRepo;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminRepo adminRepo;
	@Autowired
	private MailSending mailSending;
	@Autowired
	private WomenSecurityRepo repo;

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

	@Override
	public List<WomenSecurityDto> readAll() {
		List<WomenSecurityEntity> entities = repo.readAll();
		List<WomenSecurityDto> dtos = new ArrayList<>();
		if (entities != null) {
			for (WomenSecurityEntity entity : entities) {
				WomenSecurityDto dto = new WomenSecurityDto();
				dto.setId(entity.getId());
				dto.setName(entity.getName());
				dto.setEmail(entity.getEmail());
				dto.setAadharCardNumber(entity.getAadharCardNumber());
				dto.setContactNumber(entity.getContactNumber());
				dto.setAltContactNumber(entity.getAltContactNumber());
				dto.setCountry(entity.getCountry());
				dto.setState(entity.getState());
				dto.setPresentPlace(entity.getPresentPlace());
				dto.setPincode(entity.getPincode());
				dtos.add(dto);
			}

		}
		return dtos;
	}

	@Override
	public List<ComplaintsDTO> readAllComplaints() {
		List<ComplaintsEntity> list = repo.readAllComplaints();
		List<ComplaintsDTO> readAll = new ArrayList<>();
		if (list != null) {
			for (ComplaintsEntity entity : list) {
				ComplaintsDTO dto = new ComplaintsDTO();
				dto.setId(entity.getId());
				dto.setName(entity.getName());
				dto.setEmail(entity.getEmail());
				dto.setAboutIncident(entity.getAboutIncident());
				dto.setPlace(entity.getPlace());
				dto.setPhoneNumber(entity.getContactNumber());
				dto.setComplaintNumber(entity.getComplaintNumber());
				dto.setStatus(entity.getStatus());
				readAll.add(dto);

			}

		}

		return readAll;
	}
}
