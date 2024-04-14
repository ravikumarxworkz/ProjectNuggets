package com.xworkz.womentsecuritysystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "admin_detailes")
@NamedQuery(name = "readByEmailId", query = "SELECT entity FROM AdminEntity entity WHERE entity.emailId = :emailId")
public class AdminEntity {

	@Id
	@Column(name = "admin_Id")
	private int id;
	@Column(name = "admin_Name")
	private String adminName;
	@Column(name = "admin_emailId")
	private String emailId;
	@Column(name = "admin_password")
	private String password;
	@Column(name = "login_otp")
	private String otp;

}
