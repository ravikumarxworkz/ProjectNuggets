package com.xworkz.womentsecuritysystem.dto;

import javax.persistence.Id;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class WomenSecurityDto {
	@Id
	private int id;

	@Email(message = "Invalid email format")
	private String email;

	@Digits(integer = 12, fraction = 0, message = "Aadhar card number should be a valid number")
	private Long aadharCardNumber;

	@Digits(integer = 10, fraction = 0, message = "Contact number should be a valid number")
	private Long contactNumber;

	@Size(min = 3, max = 20, message = "Name should contain between 3 and 20 characters")
	private String name;


	@Digits(integer = 10, fraction = 0, message = "Alternate contact number should be a valid number")
	private Long altContactNumber;

	@NotNull
	private String country;

	@NotNull
	private String state;
	@NotNull
	private String presentPlace;
	@Min(value = 100000, message = "Pincode should be at least 6 digits long")
	@Max(value = 999999, message = "Pincode should not exceed 6 digits")
	private int pincode;
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z]).{8,20}$", message = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 20 characters long")
	private String password;

	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!])(?=.*[a-zA-Z]).{8,20}$", message = "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be between 8 and 20 characters long")
	private String confirmPassword;

	private MultipartFile imageFile;
	private String imagePath;

}
