package com.xworkz.vendorManagementSystem.DTO;

import java.time.LocalDateTime;

import javax.persistence.Id;

import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.Entity.VendorEntity;

import lombok.Data;

@Data
public class OrderDTO {
	  
	@Id
	int orderId;
	private int productId;
	private int vendorId;
	private String productName;
	private double productPrice;
	private double deliveryCharge;
	private String descriptionAboutProduct; 
	private int orderQuantity;
	private LocalDateTime orderDate;
	private String deliveryDate;
	private String deliveryAddress;
	private String message;
	private String orderStatus;
	private ProductEntity product;
	private VendorEntity vendor;
	private double orderAmount;
	private double amountPaid;
	private String paymentStatus;
	private double totalAmountToPay;
	private double BalanceAmount;
	
	/* private String deliveryStatus; */
}
