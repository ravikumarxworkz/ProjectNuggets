package com.xworkz.vendorManagementSystem.Entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "email_validation")
@NamedQuery(name = "findLatestOtpByEmail", query = "SELECT entity.OTP FROM EmailValidationEntity entity WHERE entity.email = :email ORDER BY entity.OTPCreatedTime DESC")
@NamedQuery(name = "deleteEmailVerificationDataByEmail", query = "DELETE FROM EmailValidationEntity entity WHERE entity.email = :email")
public class EmailValidationEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "validation_emailId")
	private String email;
	@Column(name = "validation_OTP")
	private String OTP;
	@Column(name = "OTP_Created_Time")
	private LocalDateTime OTPCreatedTime;

}
