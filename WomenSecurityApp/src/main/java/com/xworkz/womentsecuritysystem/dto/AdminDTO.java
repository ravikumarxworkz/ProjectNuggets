package com.xworkz.womentsecuritysystem.dto;

import javax.persistence.Id;

import lombok.Data;

@Data
public class AdminDTO {

	@Id
	private int id;
	private String adminName;
	private String emailId;
	private String password;
	private String otp;

}
