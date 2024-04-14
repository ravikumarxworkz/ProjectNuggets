package com.xworkz.womentsecuritysystem.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.exception.PasswordMismatchException;
import com.xworkz.womentsecuritysystem.exception.UserNotFoundException;

public interface WomenSecurityService {

	boolean findByEmail(String email);

	boolean findByAaadharcard(Long aadharCardNumber);

	boolean findByContactNumber(Long contactNumber);

	Set<ConstraintViolation<WomenSecurityDto>> validateAndSaveDTO(WomenSecurityDto dto);

	boolean SignIn(String email, String password) throws UserNotFoundException, PasswordMismatchException;

	String findImagePathByEmail(String email);

	WomenSecurityDto readByEmail(String email);

	public Set<ConstraintViolation<WomenSecurityDto>> validateAndUpdateProfile(String email, WomenSecurityDto dto)
			throws IOException;

	boolean deleteByEmailAndPassword(String email, String password)
			throws UserNotFoundException, PasswordMismatchException;

	boolean updatedPasswordByEmailandOldPassword(String email, String oldPassword, String newPassword,
			String confirmPassword) throws UserNotFoundException, PasswordMismatchException;

	boolean generateAndSendOTP(String email);

	boolean validateOpt(String email, String otp);

	boolean forgotPassword(String email, String newPassword, String confirmPassword)
			throws UserNotFoundException, PasswordMismatchException;

	boolean complaintSave(ComplaintsDTO dto);

	boolean updateComplaintStatus( int id ,String status);

	ArrayList<ComplaintsDTO> complaintHistoryByEmail(String email);

	List<WomenSecurityDto> readAll();

	List<ComplaintsDTO> readAllComplaints();

}
