package com.xworkz.vendorManagementSystem.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.inject.spi.Bean;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xworkz.vendorManagementSystem.DTO.OrderDTO;
import com.xworkz.vendorManagementSystem.Entity.OrderEntity;
import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.repository.OrderRepo;
import com.xworkz.vendorManagementSystem.repository.ProductRepo;
import com.xworkz.vendorManagementSystem.repository.VendorRepository;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderRepo orderRepo;

	@Autowired
	private ProductRepo productRepo;

	@Autowired
	private VendorRepository vendorRepository;

	@Autowired
	MailSending mailSending;

	/*----------------------------------GET  ORDER DETAILES ONLY BY VENODR ID METHOD------------------------------------ */
	@Override
	public List<OrderDTO> getOrderDetailesByVendorID(String email) {
		if (email != null) {
			int vendorId = this.vendorRepository.findIdByEmail(email);
			List<OrderEntity> orderList = orderRepo.getOrderDetailesByvendorID(vendorId);

			List<OrderDTO> dtoOrderList = orderList.stream()
					.filter(orderEntity -> "Order".equalsIgnoreCase(orderEntity.getOrderStatus())).map(orderEntity -> {
						OrderDTO orderDTO = new OrderDTO();
						BeanUtils.copyProperties(orderEntity, orderDTO);
						return orderDTO;
					}).collect(Collectors.toList());

			Collections.reverse(dtoOrderList);

			return dtoOrderList;
		}
		return null;
	}

	/*----------------------------------VEDNOR UPDATE ORDER STATUS AND SEND BILL COPY TO ADMIN  METHOD------------------------------------ */
	@Override
	public boolean processInvoiceAndSendEmail(MultipartFile file, int orderId, String orderStatus) {
		String setpaymentStatus = "unpaid";
		if (file == null || file.isEmpty()) {
			double orderAmount = 0.0d;
			boolean updatedOrder = orderRepo.updateOrderStatusAndAmount(orderId, orderStatus, orderAmount,
					setpaymentStatus);
			if (updatedOrder) {
				return true;
			}

		}
		OrderEntity orderEntity = orderRepo.getOrderEntityByOrderId(orderId);
		if (orderStatus.equalsIgnoreCase("delivered")) {
			double orderAmount = orderEntity.getProductPrice() * orderEntity.getOrderQuantity()
					+ orderEntity.getDeliveryCharge();
			boolean updatedOrder = orderRepo.updateOrderStatusAndAmount(orderId, orderStatus, orderAmount,
					setpaymentStatus);
			if (updatedOrder) {
				boolean sendOrderInvoice = mailSending.sendOrderInvoiceToAdmin(orderEntity.getVendor().getEmailId(),
						orderStatus, orderEntity.getProductName(), file);
				if (sendOrderInvoice) {
					return true;
				}

			}
		}
		return false;
	}

	/*----------------------------------GET ORDERED HISTORY BY EMAIL  METHOD------------------------------------ */
	@Override
	public List<OrderDTO> getOrderHistoryByEmail(String email) {
		if (email != null) {
			int vendorId = this.vendorRepository.findIdByEmail(email);
			List<OrderEntity> orderList = orderRepo.getOrderDetailesByvendorID(vendorId);

			List<OrderDTO> dtoOrderList = orderList.stream().map(orderEntity -> {
				OrderDTO orderDTO = new OrderDTO();
				BeanUtils.copyProperties(orderEntity, orderDTO);
				return orderDTO;
			}).collect(Collectors.toList());

			Collections.reverse(dtoOrderList);

			return dtoOrderList;
		}
		return null;
	}

	/*----------------------------------GET   ORDERD  PAYMENT HISTORY BY EMAIL(VEDNOR) METHOD------------------------------------ */
	@Override
	public List<OrderDTO> getOrderPaymentListByEmail(String email) {
		if (email != null) {
			int vendorId = this.vendorRepository.findIdByEmail(email);
			List<OrderEntity> orderList = orderRepo.getOrderDetailesByvendorID(vendorId);

			// Filter orders by status and calculate payment details
			List<OrderDTO> DtoOrderList = orderList.stream()
					.filter(orderEntity -> orderEntity.getOrderStatus().equalsIgnoreCase("received"))
					.map(orderEntity -> {
						double totalAmountToPay = orderEntity.getOrderAmount();
						double amountPaid = orderEntity.getPaymentStatus().equalsIgnoreCase("paid")
								? orderEntity.getOrderAmount()
								: 0.0d;
						double balanceAmount = totalAmountToPay - amountPaid;

						OrderDTO orderDTO = new OrderDTO();
						BeanUtils.copyProperties(orderEntity, orderDTO);
						orderDTO.setTotalAmountToPay(totalAmountToPay);
						orderDTO.setAmountPaid(amountPaid);
						orderDTO.setBalanceAmount(balanceAmount);
						return orderDTO;
					}).collect(Collectors.toList());

			return DtoOrderList;
		}
		return null;
	}

	/*----------------------------------BELOW CAODE ABOUT ADIMN SIDE ORDER CODE------------------------------------ */
	/*----------------------------------SAVE ADMIN  ORDERED PRODUCT METHOD------------------------------------ */
	@Override
	public boolean saveorder(OrderDTO orderDTO) {

		if (orderDTO != null) {
			if (orderDTO.getOrderStatus().equals("Order")) {
				System.err.println("updateOrder");
				ProductEntity productEntity = productRepo.getProductDetailesByProductID(orderDTO.getProductId());
				OrderEntity orderEntity = new OrderEntity();
				orderDTO.setProductName(productEntity.getProductName());
				orderDTO.setProductPrice(productEntity.getProductPrice());
				orderDTO.setDeliveryCharge(productEntity.getDeliveryCharge());
				orderDTO.setDescriptionAboutProduct(productEntity.getDescriptionAboutProduct());
				orderDTO.setProduct(productEntity);
				orderDTO.setVendor(productEntity.getVendor());
				orderDTO.setOrderDate(LocalDateTime.now());
				BeanUtils.copyProperties(orderDTO, orderEntity);
				boolean saveOrder = orderRepo.saveOrder(orderEntity);
				if (saveOrder) {
					return true;
				}

			}

		}
		return false;
	}

	/*---------------------------------- GET ADMIN ORDERD DETAILS METHOD------------------------------------ */
	@Override
	public List<OrderDTO> getOrderDetailsByAdmin() {
		List<OrderEntity> orderList = orderRepo.getOrderDetailsByAdmin();

		Collections.reverse(orderList);
		List<OrderDTO> dtoOrderList = orderList.stream()
				.filter(orderEntity -> "order".equalsIgnoreCase(orderEntity.getOrderStatus())).map(orderEntity -> {
					OrderDTO orderDTO = new OrderDTO();
					BeanUtils.copyProperties(orderEntity, orderDTO);
					return orderDTO;
				}).collect(Collectors.toList());

		return dtoOrderList;
	}

	/*---------------------------------- ADMIN UPDATING ORDER  DETAILES  ------------------------------------ */
	@Override
	public boolean updateOrderByAdmin(OrderDTO orderDTO) {
		if (orderDTO != null) {

			OrderEntity orderEntity = orderRepo.getOrderEntityByOrderId(orderDTO.getOrderId());
			BeanUtils.copyProperties(orderDTO, orderEntity);

			boolean updateOrder = orderRepo.updateOrderByOrderId(orderDTO.getOrderId(), orderEntity);
			if (updateOrder) {
				return true;
			}

		}
		return false;
	}
	/*---------------------------------- ADMIN DETIING  ORDERED PRODUCT  ------------------------------------ */

	@Override
	public boolean cancelOrderByAdmin(int orderId, String OrderStatus) {

		double orderAmount = 0.0d;
		String paymentStatus = "unpaid";
		boolean cancelOrder = orderRepo.updateOrderStatusAndAmount(orderId, OrderStatus, orderAmount, paymentStatus);
		if (cancelOrder) {
			return true;
		}
		System.out.println("CANCEL  orderId================" + orderId);
		System.out.println("CANCEL  OrderStatus================" + OrderStatus);

		return false;
	};

	/*---------------------------------- ADMIN GET ALL ORDER STATUS  ------------------------------------ */
	@Override
	public List<OrderDTO> getOrderStatusDetailsByAdmin() {
		List<OrderEntity> orderList = orderRepo.getOrderDetailsByAdmin();

		Collections.reverse(orderList);

		List<OrderDTO> dtoOrderList = orderList.stream()
				.filter(orderEntity -> ("delivered".equalsIgnoreCase(orderEntity.getOrderStatus())
						|| "received".equalsIgnoreCase(orderEntity.getOrderStatus()))
						&& "unpaid".equalsIgnoreCase(orderEntity.getPaymentStatus()))
				.map(orderEntity -> {
					OrderDTO orderDTO = new OrderDTO();
					BeanUtils.copyProperties(orderEntity, orderDTO);
					return orderDTO;
				}).collect(Collectors.toList());

		return dtoOrderList;
	}

	/*---------------------------------- ADMIN UPDATINNG  ALL ORDER & PAYMENT STATUS AND SEND BILL TO VEDNOR  ------------------------------------ */
	@Override
	public boolean updateOrderStatusByAdmin(int orderId, String paymentStatus, String orderStatus, MultipartFile file) {
		boolean updatedOrder = orderRepo.updateOrderStatusAndPaymentStatusByAdmin(orderId, orderStatus, paymentStatus);
		OrderEntity orderEntity = orderRepo.getOrderEntityByOrderId(orderId);
		if (updatedOrder) {
			boolean sendOrderInvoice = mailSending.sendOrderInvoiceToAdmin(orderEntity.getVendor().getEmailId(),
					orderStatus, orderEntity.getProductName(), file);
			if (sendOrderInvoice) {
				return true;
			}

			return true;
		}
		return false;
	}

	/*----------------------------------ADMIIN GET ALL ORDER HISTORY  METHOD------------------------------------ */
	@Override
	public List<OrderDTO> getAllOrderHistory() {
		List<OrderEntity> orderList = orderRepo.getOrderDetailsByAdmin();

		Collections.reverse(orderList);
		List<OrderDTO> dtoOrderList = orderList.stream().map(orderEntity -> {
			OrderDTO orderDTO = new OrderDTO();
			BeanUtils.copyProperties(orderEntity, orderDTO);
			return orderDTO;
		}).collect(Collectors.toList());

		return dtoOrderList;
	}

	/*---------------------------------- ADMIN GET ALL ORDER HISTORY AND PAYMENT SUMMARY ------------------------------------ */
	@Override
	public List<OrderDTO> getOrderPaymentHistory() {
		List<OrderEntity> orderList = orderRepo.getOrderDetailsByAdmin();
		List<OrderDTO> DtoOrderList = orderList.stream()
				.filter(orderEntity -> orderEntity.getOrderStatus().equalsIgnoreCase("received")).map(orderEntity -> {
					double totalAmountToPay = orderEntity.getOrderAmount();
					double amountPaid = orderEntity.getPaymentStatus().equalsIgnoreCase("paid")
							? orderEntity.getOrderAmount()
							: 0.0d;
					double balanceAmount = totalAmountToPay - amountPaid;

					OrderDTO orderDTO = new OrderDTO();
					BeanUtils.copyProperties(orderEntity, orderDTO);
					orderDTO.setTotalAmountToPay(totalAmountToPay);
					orderDTO.setAmountPaid(amountPaid);
					orderDTO.setBalanceAmount(balanceAmount);

					return orderDTO;
				}).collect(Collectors.toList());

		return DtoOrderList;
	}

}
