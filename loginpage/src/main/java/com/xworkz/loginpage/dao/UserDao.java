package com.xworkz.loginpage.dao;

public interface UserDao {
	
	boolean addUser(User user);

	boolean isValiderUser(String username, String passwords);

}
