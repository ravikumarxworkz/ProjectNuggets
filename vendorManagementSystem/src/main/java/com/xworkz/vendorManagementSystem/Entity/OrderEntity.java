package com.xworkz.vendorManagementSystem.Entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "orders_details")
@NamedQuery(name = "updateOrderStatus", query = "UPDATE OrderEntity entity SET entity.orderStatus = :orderStatus ,entity.orderAmount=:orderAmount,entity.paymentStatus=:paymentStatus WHERE entity.orderId=:orderId")
@NamedQuery(name = "updateOrderStatusAndPaymentStatusByAdmin", query = "UPDATE OrderEntity entity SET entity.orderStatus = :orderStatus ,entity.paymentStatus=:paymentStatus WHERE entity.orderId=:orderId")
@NamedQuery(name = "getOrderDetailsByVendorID", query = "SELECT entity FROM OrderEntity entity WHERE vendor.id = :vendorId")
@NamedQuery(name = "getOrderEntityByOrderId", query = "SELECT entity FROM OrderEntity entity WHERE entity.orderId = :orderId")
@NamedQuery(name = "getOrderDetailsByAdmin", query = "SELECT entity FROM OrderEntity entity")
public class OrderEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private int orderId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private ProductEntity product;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "vendor_id")
	private VendorEntity vendor;
	@Column(name = "product_name")
	private String productName;
	@Column(name = "product_price")
	private double productPrice;
	@Column(name = "delivery_charge")
	private double deliveryCharge;
	@Column(name = "descriptionAboutProduct")
	private String descriptionAboutProduct;
	@Column(name = "order_quantity")
	private int orderQuantity;
	@Column(name = "order_date")
	private LocalDateTime orderDate;
	@Column(name = "order_status")
	private String orderStatus;
	@Column(name = "delivery_date")
	private String deliveryDate;
	@Column(name = "delivery_address")
	private String deliveryAddress;
	@Column(name = "message")
	private String message;
	@Column(name = "orderAmount")
	private double orderAmount;
	private String paymentStatus;

	/* private String deliveryStatus; */

}
