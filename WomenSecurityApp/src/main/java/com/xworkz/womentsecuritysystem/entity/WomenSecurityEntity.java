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
@NamedQuery(name = "readAll", query = "SELECT entity FROM WomenSecurityEntity entity")
@NamedQuery(name = "readByEmail", query = "SELECT entity FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name = "findPasswordByEmail", query = "SELECT entity.password FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name = "findIdByEmail", query = "SELECT entity.id FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name = "findOTPByEmail", query = "SELECT entity.otp FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name = "findImagePathByEmail", query = "SELECT entity.imagePath FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name = "countByEmail", query = "SELECT COUNT(entity) FROM WomenSecurityEntity entity WHERE entity.email = :email")
@NamedQuery(name = "countByAadharCardNumber", query = "SELECT COUNT(entity) FROM WomenSecurityEntity entity WHERE entity.aadharCardNumber = :aadharCardNumber")
@NamedQuery(name = "countByContactNumber", query = "SELECT COUNT(entity) FROM WomenSecurityEntity entity WHERE entity.contactNumber = :contactNumber")
@NamedQuery(name = "updatedPasswordByEmail", query = "UPDATE WomenSecurityEntity entity SET entity.password = :password WHERE entity.email = :email")
@NamedQuery(name = "updatedOTPByEmail", query = "UPDATE WomenSecurityEntity entity SET entity.otp = :otp WHERE entity.email = :email")
@NamedQuery(name = "deleteByEmail", query = "DELETE FROM WomenSecurityEntity entity WHERE entity.email = :email")
public class WomenSecurityEntity {
	@Id
	@Column(name = "id")
	private int id;
	@Column(name = "username")
	private String name;
	@Column(name = "aadharcardnumber")
	private long aadharCardNumber;
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
	@Column(name = "pincode")
	private int pincode;
	@Column(name = "password")
	private String password;
	@Column(name = "otp")
	private String otp;
	@Column(name = "imagePath")
	private String imagePath;

}
