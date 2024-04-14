package com.xworkz.womentsecuritysystem.entity;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "Complaints")
@NamedQuery(name = "histortybyemail", query = "SELECT entity FROM ComplaintsEntity entity WHERE entity.email=: email")
@NamedQuery(name = "readAllComplaints", query = "SELECT entity FROM ComplaintsEntity entity")
public class ComplaintsEntity {

	@Id
	private int id;
	private String name;
	private String incidentTiming;
	private String place;
	private String aboutIncident;
	private long contactNumber;
	private String email;
	private int complaintNumber;
	private String status;

}
