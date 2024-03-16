package com.xworkz.womentsecuritysystem.dto;

import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;
@Data
public class WomenSecurityDto {
	@Id
	private int id;
	/*
	 * @NotBlank
	 * 
	 * @NotNull
	 * 
	 * @Size(min=3 , max=4 ,message="user name between 3 to 25 only")
	 */
	private String name;
	/* @NotNull */
	private Long aadharCardNumber;
	/*
	 * @NotBlank
	 * 
	 * @NotNull
	 */
	private String dateOfBirth;
	
    private long contactNumber;

    private long altContactNumber;

	private String email;
	
	private String working;
	
	private String country;
	
	private String state;

	private String presentPlace;
	
	private String permanentPlace;
	private int pincode;
	private String accountstatus;
}
