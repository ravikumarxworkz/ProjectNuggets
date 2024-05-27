package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import com.xworkz.vendorManagementSystem.Entity.OrderEntity;

public interface OrderRepo {

	boolean saveOrder(OrderEntity orderEntity);

	boolean updateOrderStatusAndAmount(int orderId, String OrderStatus, double orderAmount, String paymentStatus);

	boolean updateOrderStatusAndPaymentStatusByAdmin(int orderId, String OrderStatus, String paymentStatus);

	List<OrderEntity> getOrderDetailesByvendorID(int vendorID);

	OrderEntity getOrderEntityByOrderId(int orderId);

	List<OrderEntity> getOrderDetailsByAdmin();

	boolean updateOrderByOrderId(int orderId, OrderEntity orderEntity);
}
