package com.xworkz.womentsecuritysystem.entity;

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
@NamedQuery(name = "findLatestOtpByEmail", query = "SELECT e.otp FROM EmailValidationEntity e WHERE e.email = :email ORDER BY e.createdAt DESC")
@NamedQuery(name = "deleteEmailVerificationDataByEmail", query = "DELETE FROM EmailValidationEntity entity WHERE entity.email = :email")
public class EmailValidationEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "email")
	private String email;
	@Column(name = "otp")
	private String otp;
	@Column(name = "created_at")
	private LocalDateTime createdAt;

}
