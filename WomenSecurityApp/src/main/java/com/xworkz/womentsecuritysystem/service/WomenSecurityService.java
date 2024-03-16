package com.xworkz.womentsecuritysystem.service;

import java.util.ArrayList;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.dto.WomenSecurityDto;
import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;

public interface WomenSecurityService {

	boolean save(WomenSecurityDto dto);

	boolean logIn(String email, long phoneNumber);

	WomenSecurityEntity view(String email, long phoneNumber);

	boolean update(int id, WomenSecurityDto dto);

	boolean delete(String email);
	
	boolean complaintSave(ComplaintsDTO dto );
	
	ArrayList<ComplaintsEntity> complaintHistortyByemail(String email );
	

}
