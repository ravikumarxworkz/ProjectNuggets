package com.xworkz.vendorManagementSystem.violation;

import java.util.ArrayList;
import java.util.List;

import com.xworkz.vendorManagementSystem.Entity.OrderEntity;
import com.xworkz.vendorManagementSystem.repository.OrderRepo;
import com.xworkz.vendorManagementSystem.repository.OrderRepoImpl;

public class Demo {

	public static void main(String[] args) {

		OrderRepo orderRepo = new OrderRepoImpl();

		List<OrderEntity> orders = orderRepo.getOrderDetailesByvendorID(2);

		System.err.println(orders);

	}

}
