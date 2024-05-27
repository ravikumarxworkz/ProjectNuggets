package com.xworkz.vendorManagementSystem.Entity;

import java.time.LocalDateTime;
import java.util.Date;

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
@Table(name = "vendor_details")
@NamedQuery(name = "countByEmail", query = "SELECT COUNT(entity) FROM VendorEntity entity WHERE entity.emailId = :ByEmail")
@NamedQuery(name = "countContactNumber", query = "SELECT COUNT(entity) FROM VendorEntity entity WHERE entity.contactNumber = :byContactNumber")
@NamedQuery(name = "countByGSTNumber", query = "SELECT COUNT(entity) FROM VendorEntity entity WHERE entity.GSTNumber = :byGSTNumber")
@NamedQuery(name = "countByWebsite", query = "SELECT COUNT(entity) FROM VendorEntity entity WHERE entity.website = :byWebsite")
@NamedQuery(name = "saveLoginOTPAndGenerationTimeByEmail", query = "UPDATE VendorEntity entity SET entity.loginOTP = :loginOTP, entity.OTPGenerationTime = :OTPGenerationTime WHERE entity.emailId = :email")
@NamedQuery(name = "findOTPAndGenerationTimeAndStatusByEmail", query = "SELECT entity.loginOTP, entity.OTPGenerationTime ,entity.status FROM VendorEntity entity WHERE entity.emailId = :email")
@NamedQuery(name = "findVendorDetailsByEmail", query = "SELECT entity FROM VendorEntity entity WHERE entity.emailId = :ByEmail")
@NamedQuery(name = "findImagePathByEmail", query = "SELECT entity.imagePath FROM VendorEntity entity WHERE entity.emailId = :ByEmail")
@NamedQuery(name = "findVendorByEmail", query = "SELECT entity FROM VendorEntity entity WHERE entity.emailId = :ByEmail")
@NamedQuery(name = "findIdByEmail", query = "SELECT entity.id FROM VendorEntity entity WHERE entity.emailId= :email")
@NamedQuery(name = "getAllUserData", query = "SELECT entity.emailId, entity.contactNumber, entity.GSTNumber, entity.website FROM VendorEntity entity")
@NamedQuery(name = "AllVendorData", query = "SELECT entity FROM VendorEntity entity")

public class VendorEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="vendor_id")
	private int id;
	private String ownerName;
	private String emailId;
	private long contactNumber;
	private long altContactNumber;
	private String vendorName;
	private String GSTNumber;
	private String startDate;
	private String website;
	private String address;
	private int pincode;
	private String imagePath;
	private String loginOTP;
	private LocalDateTime OTPGenerationTime;
	private String status;

}
