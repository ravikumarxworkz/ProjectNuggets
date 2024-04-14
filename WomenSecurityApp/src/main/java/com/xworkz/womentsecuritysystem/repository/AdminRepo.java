package com.xworkz.womentsecuritysystem.repository;


import com.xworkz.womentsecuritysystem.entity.AdminEntity;

public interface AdminRepo {

	AdminEntity readByEmailId(String emailId);

	boolean updateOptById(int id, String otp);

	

}
