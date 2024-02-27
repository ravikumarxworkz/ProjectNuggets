package com.xworkz.voteriapplication.dto;

import javax.persistence.Id;

import lombok.Data;

@Data
public class VoterIdDto {
	@Id
	private int id;
	private String name;
	private long aadharCardNumber;
	private String dateOfBirth;
	private long contactNumber;
	private long altContactNumber;
	private String email;
	private String country;
	private String state;
	private String presentPlace;
	private String permanentPlace;
	private int pincode;
	private String VoterId;

}
