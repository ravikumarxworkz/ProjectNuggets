package com.xworkz.vendorManagementSystem.repository;

import com.xworkz.vendorManagementSystem.Entity.AdminEntity;

public interface AdminRepo {

	AdminEntity readByEmailId(String emailId);

	boolean updateOptById(int id, String otp);

	

}
