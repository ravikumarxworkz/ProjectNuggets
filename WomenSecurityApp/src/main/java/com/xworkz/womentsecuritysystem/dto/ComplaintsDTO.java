package com.xworkz.womentsecuritysystem.dto;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data


public class ComplaintsDTO {
	@Id
	private int id;
	private String name;
	private LocalDateTime incidentTiming;
	private String place;
	private String aboutIncident;
	private long contactNumber;
	private String email;
	private int complaintNumber;
	
	
}
