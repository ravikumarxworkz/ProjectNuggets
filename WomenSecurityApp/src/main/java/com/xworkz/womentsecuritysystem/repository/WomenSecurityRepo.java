package com.xworkz.womentsecuritysystem.repository;

import java.util.ArrayList;

import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;

public interface WomenSecurityRepo {

	boolean save(WomenSecurityEntity entity);

	boolean isExit(String email);

	boolean logIn(String email, long phoneNumber);

	WomenSecurityEntity view(String email, long phoneNumber);

	boolean update(int id, WomenSecurityEntity entity);

	boolean delte(String email);
	
	boolean complaintSave(ComplaintsEntity entity); 
	
	ArrayList<ComplaintsEntity> complaintHistortyByemail(String email );

}
