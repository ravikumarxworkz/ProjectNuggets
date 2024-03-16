package com.xworkz.womentsecuritysystem.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "Complaints")
@NamedQuery(name="histortybyemail",query = "SELECT entity FROM ComplaintsEntity entity WHERE entity.email=: email")
public class ComplaintsEntity {

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
