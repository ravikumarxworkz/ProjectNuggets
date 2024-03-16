package com.xworkz.womentsecuritysystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "womenDetails")
@NamedQuery(name="login", query="SELECT entity FROM WomenSecurityEntity entity WHERE entity.email = :email AND entity.contactNumber = :contactNumber")
@NamedQuery(name="isExit", query="SELECT entity FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name="deleteByEmail", query="DELETE FROM WomenSecurityEntity entity WHERE entity.email = :email")
public class WomenSecurityEntity {
	@Id
	@Column(name = "id")
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
	@Column(name = "working")
	private String working;
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
	@Column(name = "accountstatus")
	private String accountstatus;

}
