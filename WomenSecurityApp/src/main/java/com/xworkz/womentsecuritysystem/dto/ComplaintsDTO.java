package com.xworkz.womentsecuritysystem.dto;



import javax.persistence.Id;

import lombok.Data;

@Data
public class ComplaintsDTO {
	@Id
	private int id;
	private String name;
	private String incidentTiming;
	private String place;
	private String aboutIncident;
	private long phoneNumber;
	private String email;
	private int complaintNumber;
	private String status;
	

}
