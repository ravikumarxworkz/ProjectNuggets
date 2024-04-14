package com.xworkz.womentsecuritysystem.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;
import com.xworkz.womentsecuritysystem.exception.PasswordMismatchException;
import com.xworkz.womentsecuritysystem.exception.UserNotFoundException;
import com.xworkz.womentsecuritysystem.repository.WomenSecurityRepo;
import com.xworkz.womentsecuritysystem.violation.CustomConstraintViolation;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WomenSecurityServiceImpl implements WomenSecurityService {
	@Autowired
	private WomenSecurityRepo repo;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MailSending mailSending;

	@Override
	public boolean findByEmail(String email) {
		return this.repo.findByEmail(email);
	}

	@Override
	public boolean findByAaadharcard(Long aadharCardNumber) {
		return this.repo.findByAaadharcard(aadharCardNumber);
	}

	@Override
	public boolean findByContactNumber(Long contactNumber) {
		return this.repo.findByContactNumber(contactNumber);
	}

	@Override
	public String findImagePathByEmail(String email) {
		return repo.imagePathByEmail(email);
	}

	@Override
	public Set<ConstraintViolation<WomenSecurityDto>> validateAndSaveDTO(WomenSecurityDto dto) {

		boolean exitEmail = repo.findByEmail(dto.getEmail());
		boolean exitAadharCardNumber = repo.findByAaadharcard(dto.getAadharCardNumber());
		boolean exitContactNumber = repo.findByContactNumber(dto.getContactNumber());

		Set<ConstraintViolation<WomenSecurityDto>> constraintViolations = new HashSet<>();

		if (exitEmail) {
			constraintViolations.add(new CustomConstraintViolation<>("email", "Email already exists"));
		}

		if (exitAadharCardNumber) {
			constraintViolations
					.add(new CustomConstraintViolation<>("aadharCardNumber", "Aadhar card number already exists"));
		}

		if (exitContactNumber) {
			constraintViolations.add(new CustomConstraintViolation<>("contactNumber", "Contact number already exists"));
		}

		Set<ConstraintViolation<WomenSecurityDto>> dtoConstraintViolations = validate(dto);
		constraintViolations.addAll(dtoConstraintViolations);

		if (!dto.getPassword().equals(dto.getConfirmPassword())) {
			constraintViolations.add(new CustomConstraintViolation<>("password", "Password mismatch"));
		}

		if (!constraintViolations.isEmpty()) {
			log.error("Constraint violations in SignUpDTO: " + dto);
			return constraintViolations;
		}

		WomenSecurityEntity entity = new WomenSecurityEntity();
		entity.setName(dto.getName());
		entity.setAadharCardNumber(dto.getAadharCardNumber());
		entity.setContactNumber(dto.getContactNumber());
		entity.setAltContactNumber(dto.getAltContactNumber());
		entity.setEmail(dto.getEmail());
		entity.setCountry(dto.getCountry());
		entity.setState(dto.getState());
		entity.setPresentPlace(dto.getPresentPlace());
		entity.setPincode(dto.getPincode());
		entity.setPassword(passwordEncoder.encode(dto.getPassword()));
		entity.setImagePath("defaultUserImage.png");
		repo.saveUserDetailes(entity);
		boolean sent = mailSending.mailSend(dto.getEmail(), dto.getName());
		if (sent) {
			log.info("DTO is saved successfully.");
		} else {
			log.error("Failed to send email to: " + dto.getEmail());
		}

		return Collections.emptySet();
	}

	private Set<ConstraintViolation<WomenSecurityDto>> validate(WomenSecurityDto dto) {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		Set<ConstraintViolation<WomenSecurityDto>> violations = validator.validate(dto);
		return violations;
	}

////////////////////////////SignIn //////////////////////////////////////////////////////
	@Override
	public boolean SignIn(String email, String password) throws UserNotFoundException, PasswordMismatchException {
		String storedPassword = repo.findPasswordByEmail(email);
		if (storedPassword == null) {
			throw new UserNotFoundException("Email is not registered");
		}

		if (!passwordEncoder.matches(password, storedPassword)) {
			throw new PasswordMismatchException("Password is incorrect");
		}
		log.info("LOGIN successfully.");
		return true;
	}

////////////////////////////readByEmail/////////////////////////////////////

	@Override
	public WomenSecurityDto readByEmail(String email) {

		WomenSecurityDto dto = new WomenSecurityDto();
		WomenSecurityEntity entity = repo.readByEmail(email);
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setAadharCardNumber(entity.getAadharCardNumber());
		dto.setContactNumber(entity.getContactNumber());
		dto.setAltContactNumber(entity.getAltContactNumber());
		dto.setEmail(entity.getEmail());
		dto.setCountry(entity.getCountry());
		dto.setState(entity.getState());
		dto.setPresentPlace(entity.getPresentPlace());
		dto.setPincode(entity.getPincode());
		dto.setImagePath(entity.getImagePath());
		dto.setPassword(null);

		return dto;

	}

////////////////////////////updateById /////////////////////////////////////
	@Override
	public Set<ConstraintViolation<WomenSecurityDto>> validateAndUpdateProfile(String email, WomenSecurityDto dto)
			throws IOException {
		saveImage(dto);
		return validateAndUpdate(dto.getEmail(), dto);
	}

	private void saveImage(WomenSecurityDto dto) throws IOException {
		if (dto.getImageFile() != null && !dto.getImageFile().isEmpty()) {
			byte[] fileBytes = dto.getImageFile().getBytes();
			String filePath = "D:\\WomenSecuirtyAappUserImages\\" + dto.getImageFile().getOriginalFilename();
			File newFile = new File(filePath);
			Path path = Paths.get(newFile.getAbsolutePath());
			Files.write(path, fileBytes);
			dto.setImagePath(dto.getImageFile().getOriginalFilename().toString());
		} else {
			String existingUserImagePath = repo.imagePathByEmail(dto.getEmail());
			dto.setImagePath(existingUserImagePath);
		}
	}

	public Set<ConstraintViolation<WomenSecurityDto>> validateAndUpdate(String email, WomenSecurityDto dto) {
		List<WomenSecurityEntity> allEntities = repo.readAll();

		boolean exitAadharCardNumber = allEntities.stream().anyMatch(entity -> !entity.getEmail().equals(email)
				&& entity.getAadharCardNumber() == dto.getAadharCardNumber());
		boolean exitContactNumber = allEntities.stream().anyMatch(
				entity -> !entity.getEmail().equals(email) && entity.getContactNumber() == dto.getContactNumber());

		Set<ConstraintViolation<WomenSecurityDto>> constraintViolations = new HashSet<>();

		if (exitAadharCardNumber) {
			constraintViolations
					.add(new CustomConstraintViolation<>("aadharCardNumber", "Aadhar card number already exists"));
		}

		if (exitContactNumber) {
			constraintViolations.add(new CustomConstraintViolation<>("contactNumber", "Contact number already exists"));
		}

		Set<ConstraintViolation<WomenSecurityDto>> dtoConstraintViolations = validate(dto);
		constraintViolations.addAll(dtoConstraintViolations);

		if (!constraintViolations.isEmpty()) {
			log.error("Constraint violations in update operation for email: " + email);
			return constraintViolations;
		}

		WomenSecurityEntity entity1 = repo.readByEmail(email);
		if (entity1 != null && entity1.getEmail() != null) {
			boolean aadharChanged = entity1.getAadharCardNumber() != dto.getAadharCardNumber();
			boolean contactChanged = entity1.getContactNumber() != dto.getContactNumber();

			if (aadharChanged || contactChanged) {
				if (aadharChanged && allEntities.stream().anyMatch(entity -> !entity.getEmail().equals(email)
						&& entity.getAadharCardNumber() == dto.getAadharCardNumber())) {
					constraintViolations.add(
							new CustomConstraintViolation<>("aadharCardNumber", "Aadhar card number already exists"));
					return constraintViolations;
				}

				if (contactChanged && allEntities.stream().anyMatch(entity -> !entity.getEmail().equals(email)
						&& entity.getContactNumber() == dto.getContactNumber())) {
					constraintViolations
							.add(new CustomConstraintViolation<>("contactNumber", "Contact number already exists"));
					return constraintViolations;
				}
			} else {
				dto.setAadharCardNumber(entity1.getAadharCardNumber());
				dto.setContactNumber(entity1.getContactNumber());
			}
			entity1.setName(dto.getName());
			entity1.setAadharCardNumber(dto.getAadharCardNumber());
			entity1.setContactNumber(dto.getContactNumber());
			entity1.setAltContactNumber(dto.getAltContactNumber());
			entity1.setCountry(dto.getCountry());
			entity1.setState(dto.getState());
			entity1.setPresentPlace(dto.getPresentPlace());
			entity1.setPincode(dto.getPincode());
			entity1.setImagePath(dto.getImagePath());

			boolean update = repo.updateById(entity1.getId(), entity1);
			if (update) {
				log.info("Entity with email " + email + " updated successfully.");
			} else {
				log.error("Failed to update entity with email: " + email);
			}
		}

		return Collections.emptySet();
	}

////////////////////////////deleteByEmailAndPassword /////////////////////////////////////
	@Override
	public boolean deleteByEmailAndPassword(String email, String password)
			throws UserNotFoundException, PasswordMismatchException {
		String storedPassword = repo.findPasswordByEmail(email);

		if (storedPassword == null) {
			throw new UserNotFoundException("Email is not registered");
		}

		if (!passwordEncoder.matches(password, storedPassword)) {
			throw new PasswordMismatchException("Password is incorrect");
		}

		boolean delete = repo.deleteByEmail(email);
		return delete;
	}
////////////////////////////updatedPasswordByEmailandOldPassword /////////////////////////////////////

	@Override
	public boolean updatedPasswordByEmailandOldPassword(String email, String oldPassword, String newPassword,
			String confirmPassword) throws UserNotFoundException, PasswordMismatchException {

		String storedPassword = repo.findPasswordByEmail(email);

		if (storedPassword == null) {
			throw new UserNotFoundException("Email is not registered");
		}

		if (!passwordEncoder.matches(oldPassword, storedPassword)) {
			throw new PasswordMismatchException("oldPassword is incorrect");
		}

		if (!newPassword.equals(confirmPassword)) {
			throw new PasswordMismatchException("New password and confirm password do not match");
		}

		boolean updatePassword = repo.updatedPasswordByEmail(email, passwordEncoder.encode(newPassword));
		return updatePassword;
	}

////////////////////////////generateAndSendOTP/////////////////////////////////////
	@Override
	public boolean generateAndSendOTP(String email) {
		if (email != null) {
			String otp = generateOTP();
			boolean OTPsave = repo.updateOptByEmail(email, otp);
			if (OTPsave) {
				boolean sent = mailSending.sendOTPEmail(email, otp);
				if (sent) {
					return true;
				}
			}
		}
		return false;
	}

	private String generateOTP() {
		Random random = new Random();
		int otpNumber = 100000 + random.nextInt(900000);
		return String.valueOf(otpNumber);
	}

////////////////////////////validate otp  /////////////////////////////////////
	@Override
	public boolean validateOpt(String email, String otp) {

		if (email != null && otp != null) {
			String OTP = repo.findOTPByEmail(email);
			if (OTP.equals(otp)) {
				boolean resetOtp = repo.updateOptByEmail(email, null);
				if (resetOtp) {
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public boolean forgotPassword(String email, String newPassword, String confirmPassword)
			throws UserNotFoundException, PasswordMismatchException {
		if (!newPassword.equals(confirmPassword)) {
			throw new PasswordMismatchException("New password and confirm password do not match");
		}
		boolean updatePassword = repo.updatedPasswordByEmail(email, passwordEncoder.encode(newPassword));
		if (updatePassword) {
			boolean sent = mailSending.sendPasswordChangeEmail(email);
			if (sent) {
				return true;

			}
		}
		return false;
	}

////////////////////////////complaintSave/////////////////////////////////////
	@Override
	public boolean complaintSave(ComplaintsDTO dto) {

		ComplaintsEntity entity = new ComplaintsEntity();
		entity.setName(dto.getName());
		entity.setIncidentTiming(dto.getIncidentTiming());
		entity.setPlace(dto.getPlace());
		entity.setAboutIncident(dto.getAboutIncident());
		entity.setContactNumber(dto.getPhoneNumber());
		entity.setEmail(dto.getEmail());
		entity.setComplaintNumber(dto.getComplaintNumber());
		entity.setStatus("Registered");
		boolean save = repo.complaintSave(entity);
		if (save) {
			return true;
		}
		return false;
	}
////////////////////////////complaintHistortyByemail /////////////////////////////////////

	@Override
	public ArrayList<ComplaintsDTO> complaintHistoryByEmail(String email) {
		List<ComplaintsEntity> complaintsEntities = repo.complaintHistoryByEmail(email);
		ArrayList<ComplaintsDTO> complaintsDTOs = new ArrayList<>();

		if (complaintsEntities != null) {
			for (ComplaintsEntity entity : complaintsEntities) {
				ComplaintsDTO dto = new ComplaintsDTO();
				dto.setId(entity.getId());
				dto.setName(entity.getName());
				dto.setEmail(entity.getEmail());
				dto.setIncidentTiming(entity.getIncidentTiming());
				dto.setAboutIncident(entity.getAboutIncident());
				dto.setPhoneNumber(entity.getContactNumber());
				dto.setPlace(entity.getPlace());
				dto.setComplaintNumber(entity.getComplaintNumber());
				dto.setStatus(entity.getStatus());
				complaintsDTOs.add(dto);
			}
		}

		return complaintsDTOs;
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
				dto.setIncidentTiming(entity.getIncidentTiming());
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

	@Override
	public boolean updateComplaintStatus(int id, String status) {

		if (status != null) {
			boolean update = repo.updateComplaintStatus(id, status);
			if (update) {
				return true;
			}
		}
		return false;
	}

}
