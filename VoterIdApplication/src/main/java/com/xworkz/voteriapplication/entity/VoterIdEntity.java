package com.xworkz.voteriapplication.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "VoterDetails")
@NamedQuery(name = "readAll", query = "SELECT entity FROM VoterIdEntity entity")
public class VoterIdEntity {
	@Id
	private int id;
	@Column(name = "username")
	private String name;
	@Column(name = "aadharcardnumber")
	private long aadharCardNumber;
	@Column(name = "dateOfBirth")
	private String dateOfBirth;
	@Column(name = "contactNumber")
	private long contactNumber;
	@Column(name = "altContactNumber")
	private long altContactNumber;
	@Column(name = "email")
	private String email;
	@Column(name = "country")
	private String country;
	@Column(name = "state")
	private String state;
	@Column(name = "presentplace")
	private String presentPlace;
	@Column(name = "permanetPlace")
	private String permanentPlace;
	@Column(name = "pincode")
	private int pincode;
	@Column(name = "voter_id")
	private String VoterId;

}
