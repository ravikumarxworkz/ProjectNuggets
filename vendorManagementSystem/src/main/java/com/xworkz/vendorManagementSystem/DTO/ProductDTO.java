package com.xworkz.vendorManagementSystem.DTO;

import javax.persistence.Id;

import com.xworkz.vendorManagementSystem.Entity.VendorEntity;

import lombok.Data;

@Data
public class ProductDTO {

	@Id
	private int id;
	private String email;
	private String category;
	private String productName;
	private String available;
	private double productPrice;
	private double deliveryCharge;
	private String descriptionAboutProduct;
	private String status;
	/*
	 * private String orderQuantity; private String deliveryAddress; private String
	 * deliveryDate;
	 */
	private VendorEntity vendor;

}
