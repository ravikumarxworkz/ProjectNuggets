package com.xworkz.vendorManagementSystem.DTO;

import lombok.Data;

@Data
public class PaymentDTO {

	private int orderId;
	private String productName;
	private double productPrice;
	private double deliveryCharge;
	private int orderQuantity;
	private String orderStatus;
	private double orderAmount;
	private double totalAmountToPay;
	private String paymentStatus;
	private double amountPaid;
	private double balnceAmount;

}
