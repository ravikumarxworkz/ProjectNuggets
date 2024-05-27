package com.xworkz.vendorManagementSystem.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.DTO.VendorDTO;
import com.xworkz.vendorManagementSystem.Entity.EmailValidationEntity;
import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.Entity.VendorEntity;
import com.xworkz.vendorManagementSystem.Excetion.AccountUnderVerificationException;
import com.xworkz.vendorManagementSystem.Excetion.InValidateOTPException;
import com.xworkz.vendorManagementSystem.Excetion.OTPExpiredException;
import com.xworkz.vendorManagementSystem.repository.VendorRepository;
import com.xworkz.vendorManagementSystem.violation.CustomConstraintViolation;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class VendorServiceImpl implements VendorService {

	@Autowired
	private VendorRepository vendorRepository;
	@Autowired
	private MailSending mailSending;

	@Override
	public boolean checkEmailExistence(String email) {
		log.info("checkEmailExistence method exit");
		return this.vendorRepository.checkEmailExistence(email);
	}

	@Override
	public boolean checkContactNumberExistence(long contactNumber) {
		log.info("checkContactNumberExistence method exit");
		return this.vendorRepository.checkContactNumberExistence(contactNumber);
	}

	@Override
	public boolean checkGSTNumberExistence(String GSTnumber) {
		log.info("checkGSTNumberExistence method exit");
		return this.vendorRepository.checkGSTNumberExistence(GSTnumber);
	}

	@Override
	public boolean checkWebsiteExistence(String website) {
		log.info("checkWebsiteExistence method exit");
		return this.vendorRepository.checkWebsiteExistence(website);
	}

	@Override
	public Set<ConstraintViolation<VendorDTO>> validateAndSaveVendorDTO(VendorDTO vendorDTO) {

		boolean CheckEmailExitences = vendorRepository.checkEmailExistence(vendorDTO.getEmailId());
		boolean checkContactNumberExistence = vendorRepository
				.checkContactNumberExistence(vendorDTO.getContactNumber());
		boolean checkWebsiteExistence = vendorRepository.checkWebsiteExistence(vendorDTO.getWebsite());
		boolean checkGSTNumberExistence = vendorRepository.checkGSTNumberExistence(vendorDTO.getGSTNumber());

		Set<ConstraintViolation<VendorDTO>> constraintViolations = new HashSet<>();

		if (CheckEmailExitences) {
			constraintViolations.add(new CustomConstraintViolation<>("email", "Email already exists"));
		}

		if (checkContactNumberExistence) {
			constraintViolations.add(new CustomConstraintViolation<>("contacNumber", "Contact number already exists"));
		}

		if (checkWebsiteExistence) {
			constraintViolations.add(new CustomConstraintViolation<>("website", "Contact number already exists"));
		}
		if (checkGSTNumberExistence) {
			constraintViolations.add(new CustomConstraintViolation<>("GSTNumber", "GSTNumber already exists"));
		}

		Set<ConstraintViolation<VendorDTO>> dtoConstraintViolations = validate(vendorDTO);
		constraintViolations.addAll(dtoConstraintViolations);

		if (!constraintViolations.isEmpty()) {
			log.error("Constraint violations in SignUpDTO: " + vendorDTO);
			return constraintViolations;
		}
		VendorEntity vendorEntity = new VendorEntity();
		vendorDTO.setImagePath("defaultUserImage.png");
		vendorDTO.setStatus("pending");

		BeanUtils.copyProperties(vendorDTO, vendorEntity);
		boolean saveDTO = this.vendorRepository.VendorEntitySave(vendorEntity);
		if (saveDTO) {
			boolean sendRegisterEmail = mailSending.SendEmailRgisterSuccessfully(vendorDTO);
			if (sendRegisterEmail) {
				log.info("DTO is saved successfully. and Email sent to owmer email Id");
			}
		}

		return Collections.emptySet();

	}

	private Set<ConstraintViolation<VendorDTO>> validate(VendorDTO DTO) {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		Set<ConstraintViolation<VendorDTO>> violations = validator.validate(DTO);
		return violations;
	}

	@Override
	public boolean saveLoginOTP(String email) {
		System.err.println("saveLoginOTP=============service method");
		if (email != null) {
			Random random = new Random();
			int generatedOtp = random.nextInt(900000) + 100000;
			String OTP = String.valueOf(generatedOtp);
			LocalDateTime OTPGenerationTime = LocalDateTime.now();

			boolean saveOTP = vendorRepository.saveLoginOTPByEmailId(email, OTP, OTPGenerationTime);
			System.err.println("saveOTP==========" + saveOTP);
			if (saveOTP) {
				boolean sent = mailSending.sendLoginOTPToEmail(email, OTP);
				if (sent) {
					System.err.println("enmail sent successfully service method");
					return true; // OTP sent successfully
				} else {
					return false;
				}
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public boolean validateOTPAndLogin(String email, String otp)
			throws InValidateOTPException, OTPExpiredException, AccountUnderVerificationException {
		if (email != null && otp != null) {
			Object[] otpAndGenerationTime = vendorRepository.getOTPAndGenerationTimeByEmail(email);

			if (otpAndGenerationTime != null && otpAndGenerationTime.length == 3) {
				String storedOTP = (String) otpAndGenerationTime[0];
				LocalDateTime generationTime = (LocalDateTime) otpAndGenerationTime[1];
				String status = (String) otpAndGenerationTime[2];
				if (otp.equals(storedOTP)) {
					LocalDateTime currentTime = LocalDateTime.now();
					long minutesPassed = ChronoUnit.MINUTES.between(generationTime, currentTime);

					if ("pending".equalsIgnoreCase(status)) {
						throw new AccountUnderVerificationException(
								"Your account is under verification. You cannot log in at the moment.");
					} else {
						if (minutesPassed <= 2) {
							return true;
						} else {
							throw new OTPExpiredException("OTP has expired");
						}
					}

					/*
					 * if (minutesPassed <= 2) { if ("pending".equalsIgnoreCase(status)) { throw new
					 * AccountUnderVerificationException(
					 * "Your account is under verification. You cannot log in at the moment."); }
					 * else { return true; } } else { throw new
					 * OTPExpiredException("OTP has expired"); }
					 */
				} else {
					throw new InValidateOTPException("Invalid OTP");
				}
			}
		}
		return false;
	}

	@Override
	public VendorDTO getVendorDetailsByEmail(String email) {
		VendorEntity entity = this.vendorRepository.getVendorDetailsByEmail(email);

		if (entity != null) {
			entity.setLoginOTP(null);
			entity.setOTPGenerationTime(null);
			VendorDTO vendorDTO = new VendorDTO();
			BeanUtils.copyProperties(entity, vendorDTO);
			return vendorDTO;
		} else {
			return null; // or throw an exception or handle as required
		}
	}

	@Override
	public String findImagePathByEmail(String email) {
		return this.vendorRepository.findImagePathByEmail(email);
	}

	@Override
	public Set<ConstraintViolation<VendorDTO>> validateAndVendorUpdateProfile(String email, VendorDTO vendorDTO)
			throws IOException {
		// Validate and update vendor profile
		saveImage(vendorDTO);
		return validateAndUpdateVendor(email, vendorDTO);
	}

	private void saveImage(VendorDTO vendorDTO) throws IOException {
		if (vendorDTO.getImageFile() != null && !vendorDTO.getImageFile().isEmpty()) {
			byte[] fileBytes = vendorDTO.getImageFile().getBytes();
			String filePath = "D:\\vendorManageMentUserProfileImage\\" + vendorDTO.getImageFile().getOriginalFilename();
			File newFile = new File(filePath);
			Path path = Paths.get(newFile.getAbsolutePath());
			Files.write(path, fileBytes);

			vendorDTO.setImagePath(vendorDTO.getImageFile().getOriginalFilename().toString());
		} else {
			String existingUserImagePath = vendorRepository.findImagePathByEmail(vendorDTO.getEmailId());
			vendorDTO.setImagePath(existingUserImagePath);
		}
	}

	public Set<ConstraintViolation<VendorDTO>> validateAndUpdateVendor(String email, VendorDTO vendorDTO) {
		List<VendorEntity> allVendors = vendorRepository.readAllvendorDetailes();
		VendorEntity vendorOldDetails = vendorRepository.findVendorByEmail(email);

		Set<ConstraintViolation<VendorDTO>> constraintViolations = new HashSet<>();

		boolean emailChanged = !email.equals(vendorDTO.getEmailId());

		boolean GSTNumberChanged = vendorOldDetails.getGSTNumber() != null
				&& !vendorOldDetails.getGSTNumber().equals(vendorDTO.getGSTNumber());

		boolean websiteChanged = vendorOldDetails.getWebsite() != null
				&& !vendorOldDetails.getWebsite().equals(vendorDTO.getWebsite());

		boolean contactChanged = vendorOldDetails.getContactNumber() != vendorDTO.getContactNumber();

		if (emailChanged
				&& allVendors.stream().anyMatch(entity -> entity.getEmailId().equals(vendorDTO.getEmailId()))) {
			constraintViolations.add(new CustomConstraintViolation<>("email", "Email already exists"));
		}

		if (contactChanged && allVendors.stream().anyMatch(entity -> !entity.getEmailId().equals(email)
				&& entity.getContactNumber() == vendorDTO.getContactNumber())) {
			constraintViolations.add(new CustomConstraintViolation<>("contactNumber", "Contact number already exists"));
			return constraintViolations;
		}

		if (GSTNumberChanged && allVendors.stream().anyMatch(
				entity -> !entity.getEmailId().equals(email) && entity.getGSTNumber() == vendorDTO.getGSTNumber())) {
			constraintViolations
					.add(new CustomConstraintViolation<>("aadharCardNumber", "Aadhar card number already exists"));
			return constraintViolations;
		}
		if (websiteChanged && allVendors.stream().anyMatch(
				entity -> !entity.getEmailId().equals(email) && entity.getWebsite() == vendorDTO.getWebsite())) {
			constraintViolations
					.add(new CustomConstraintViolation<>("aadharCardNumber", "Aadhar card number already exists"));
			return constraintViolations;
		}

		if (!constraintViolations.isEmpty()) {
			log.error("Constraint violations in vendor update operation for email: " + email);
			return constraintViolations;
		}
		if (!emailChanged) {
			vendorDTO.setEmailId(vendorOldDetails.getEmailId());
		}
		if (!GSTNumberChanged) {
			vendorDTO.setGSTNumber(vendorOldDetails.getGSTNumber());
		}
		if (!websiteChanged) {
			vendorDTO.setWebsite(vendorOldDetails.getWebsite());
		}
		if (!contactChanged) {
			vendorDTO.setContactNumber(vendorOldDetails.getContactNumber());
		}
		vendorOldDetails.setOwnerName(vendorDTO.getOwnerName());
		vendorOldDetails.setEmailId(vendorDTO.getEmailId());
		vendorOldDetails.setContactNumber(vendorDTO.getContactNumber());
		vendorOldDetails.setAltContactNumber(vendorDTO.getAltContactNumber());
		vendorOldDetails.setVendorName(vendorDTO.getVendorName());
		vendorOldDetails.setStartDate(vendorDTO.getStartDate());
		vendorOldDetails.setGSTNumber(vendorDTO.getGSTNumber());
		vendorOldDetails.setPincode(vendorDTO.getPincode());
		vendorOldDetails.setImagePath(vendorDTO.getImagePath());
		vendorOldDetails.setAddress(vendorDTO.getAddress());

		boolean update = vendorRepository.updateVendorDetailsById(vendorOldDetails.getId(), vendorOldDetails);
		if (update) {
			log.info("Entity with email " + email + " updated successfully.");
		} else {
			log.error("Failed to update entity with email: " + email);
		}

		return Collections.emptySet();
	}

	@Override
	public List<VendorDTO> readAllVendorData() {
		List<VendorEntity> vendorEntities = vendorRepository.readAllvendorDeta();
		List<VendorDTO> vendorDTOs = new ArrayList<>();

		for (VendorEntity vendorEntity : vendorEntities) {
			VendorDTO vendorDTO = new VendorDTO();
			try {
				BeanUtils.copyProperties(vendorEntity, vendorDTO);
				vendorDTOs.add(vendorDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return vendorDTOs;
	}

	@Override
	public boolean updateVendorStatus(int id, String status) {
		System.err.println("updateVendorStatus===========" + id);
		System.err.println("updateVendorStatus===========" + status);
		if (status != null) {
			boolean update = vendorRepository.updateVendorStatus(id, status);
			System.err.println("updateVendorStatus====================" + update);
			if (update) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean Sendmessage(String email, String message) {
		if (email != null && message != null) {
			boolean sendMessage = mailSending.sendMessage(email, message);
			if (sendMessage) {
				return true;
			}
		}
		return false;
	}

}
