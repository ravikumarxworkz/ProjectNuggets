package com.xworkz.womentsecuritysystem.service;

import java.util.ArrayList;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;
import com.xworkz.womentsecuritysystem.repository.WomenSecurityRepo;
import com.xworkz.womentsecuritysystem.repository.WomenSecurityRepoImpl;

public class WomenSecurityServiceImpl implements WomenSecurityService {

	WomenSecurityRepo repo = new WomenSecurityRepoImpl();

	@Override
	public boolean save(WomenSecurityDto dto) {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();

		Set<ConstraintViolation<WomenSecurityDto>> violations = validator.validate(dto);

		if (!violations.isEmpty()) {
			for (ConstraintViolation<WomenSecurityDto> violation : violations) {
				System.out.println(violation.getPropertyPath() + " " + violation.getMessage());
			}
			return false;
		} else {
			WomenSecurityEntity entity = new WomenSecurityEntity();
			entity.setName(dto.getName());
			entity.setAadharCardNumber(dto.getAadharCardNumber());
			entity.setDateOfBirth(dto.getDateOfBirth());
			entity.setContactNumber(dto.getContactNumber());
			entity.setAltContactNumber(dto.getAltContactNumber());
			entity.setEmail(dto.getEmail());
			entity.setWorking(dto.getWorking());
			entity.setCountry(dto.getCountry());
			entity.setState(dto.getState());
			entity.setPresentPlace(dto.getPresentPlace());
			entity.setPermanentPlace(dto.getPermanentPlace());
			entity.setPincode(dto.getPincode());
			entity.setAccountstatus(dto.getAccountstatus());
			if (repo.isExit(dto.getEmail())) {
				return false;
			} else {
				boolean save = repo.save(entity);
				if (save) {
					return true;
				} else {
					return false;
				}
			}
		}

	}

	@Override
	public boolean logIn(String email, long phoneNumber) {

		boolean logIn = repo.logIn(email, phoneNumber);
		if (logIn) {
			return true;
		}
		return false;

	}

	@Override
	public WomenSecurityEntity view(String email, long phoneNumber) {
		return repo.view(email, phoneNumber);

		/*
		 * WomenSecurityDto dto = new WomenSecurityDto(); WomenSecurityEntity entity =
		 * repo.view(email, phoneNumber); dto.setId(entity.getId());
		 * dto.setName(entity.getName());
		 * dto.setAadharCardNumber(entity.getAadharCardNumber());
		 * dto.setDateOfBirth(entity.getDateOfBirth());
		 * dto.setContactNumber(entity.getContactNumber());
		 * dto.setAltContactNumber(entity.getAltContactNumber());
		 * dto.setEmail(entity.getEmail()); dto.setWorking(entity.getWorking());
		 * dto.setCountry(entity.getCountry()); dto.setState(entity.getState());
		 * dto.setWorking(entity.getWorking());
		 * dto.setPresentPlace(entity.getPresentPlace());
		 * dto.setPermanentPlace(entity.getPermanentPlace());
		 * dto.setPincode(entity.getPincode()); return dto;
		 */
	}

	@Override
	public boolean update(int id, WomenSecurityDto dto) {

		if (id != 0 && dto != null) {
			WomenSecurityEntity entity = new WomenSecurityEntity();
			entity.setId(id);
			entity.setName(dto.getName());
			entity.setAadharCardNumber(dto.getAadharCardNumber());
			entity.setDateOfBirth(dto.getDateOfBirth());
			entity.setContactNumber(dto.getContactNumber());
			entity.setAltContactNumber(dto.getAltContactNumber());
			entity.setEmail(dto.getEmail());
			entity.setWorking(dto.getWorking());
			entity.setCountry(dto.getCountry());
			entity.setState(dto.getState());
			entity.setPresentPlace(dto.getPresentPlace());
			entity.setPermanentPlace(dto.getPermanentPlace());
			entity.setPincode(dto.getPincode());
			boolean update = repo.update(id, entity);
			System.out.println(update);
			if (update) {
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean delete(String email) {
		boolean delete = repo.delte(email);
		if (delete) {
			return true;
		}
		return false;
	}

	@Override
	public boolean complaintSave(ComplaintsDTO dto) {
		ComplaintsEntity entity = new ComplaintsEntity();
		entity.setName(dto.getName());
		entity.setIncidentTiming(dto.getIncidentTiming());
		entity.setPlace(dto.getPlace());
		entity.setAboutIncident(dto.getAboutIncident());
		entity.setContactNumber(dto.getContactNumber());
		entity.setEmail(dto.getEmail());
		entity.setComplaintNumber(dto.getComplaintNumber());
		boolean save = repo.complaintSave(entity);
		if (save) {
			return true;
		}
		return false;
	}

	@Override
	public ArrayList<ComplaintsEntity> complaintHistortyByemail(String email) {

		return repo.complaintHistortyByemail(email);
	}

}
