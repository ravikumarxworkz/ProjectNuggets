package com.xworkz.womentsecuritysystem.repository;

import java.util.ArrayList;
import java.util.List;

import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;

public interface WomenSecurityRepo {

	boolean findByEmail(String email);

	boolean findByAaadharcard(Long aadharCardNumber);

	boolean findByContactNumber(Long contactNumber);

	boolean saveUserDetailes(WomenSecurityEntity entity);

	WomenSecurityEntity readByEmail(String email);

	boolean updateById(int id, WomenSecurityEntity entity);

	boolean deleteByEmail(String email);

	boolean updatedPasswordByEmail(String email, String newPassword);
	
	boolean updateComplaintStatus(int id, String status);

	boolean updateOptByEmail(String email, String otp);

	boolean complaintSave(ComplaintsEntity entity);

	String imagePathByEmail(String email);

	String findOTPByEmail(String email);

	String findPasswordByEmail(String email);

	int findIdByEmail(String email);

	ArrayList<ComplaintsEntity> complaintHistoryByEmail(String email);

	List<ComplaintsEntity> readAllComplaints();

	List<WomenSecurityEntity> readAll();
}
