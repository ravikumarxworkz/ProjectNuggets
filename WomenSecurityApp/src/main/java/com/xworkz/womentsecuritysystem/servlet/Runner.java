package com.xworkz.womentsecuritysystem.servlet;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.service.WomenSecurityService;
import com.xworkz.womentsecuritysystem.service.WomenSecurityServiceImpl;

public class Runner {

	public static void main(String[] args) {

		WomenSecurityService service = new WomenSecurityServiceImpl();
		WomenSecurityDto dto = new WomenSecurityDto();
		dto.setName("");
		dto.setAadharCardNumber((long)0);
		dto.setDateOfBirth("1/01/2011");
		dto.setContactNumber(812l);
		dto.setAltContactNumber(8123l);
		dto.setEmail("ravi");
		dto.setCountry("indian");
		dto.setState("kaa");
		dto.setWorking("asdfd");
		dto.setPresentPlace("bengalurur");
		dto.setPermanentPlace("asdfgbn");
		dto.setPincode(5);
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();

		Set<ConstraintViolation<WomenSecurityDto>> violations = validator.validate(dto);

		if (!violations.isEmpty()) {
			for (ConstraintViolation<WomenSecurityDto> violation : violations) {
				System.out.println(violation.getPropertyPath() + " " + violation.getMessage());
			}
		}
	}

}
