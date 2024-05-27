package com.xworkz.vendorManagementSystem.controlller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xworkz.vendorManagementSystem.DTO.OrderDTO;
import com.xworkz.vendorManagementSystem.service.OrderService;
import com.xworkz.vendorManagementSystem.service.ProductService;

@Controller
@RequestMapping("/")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private ProductService productService;

	@GetMapping("/getOrderDetailsByEmail")
	@ResponseBody
	public List<OrderDTO> getProductDetailsByEmail(@RequestParam String email) {
		List<OrderDTO> OrderDetails = orderService.getOrderDetailesByVendorID(email);
		System.err.println("OrderDetails=========================controlller" + OrderDetails);
		return OrderDetails;
	}

	@GetMapping("/getOrderHistoryByEmail")
	@ResponseBody
	public List<OrderDTO> getOrderHistoryByEmail(@RequestParam String email) {
		List<OrderDTO> OrderDetails = orderService.getOrderHistoryByEmail(email);
		System.err.println("getOrderHistoryByEmail=========================controlller" + OrderDetails);
		return OrderDetails;
	}

	@GetMapping("/getOrderPaymentListByEmail")
	@ResponseBody
	public List<OrderDTO> getOrderPaymentListByEmail(@RequestParam String email) {
		System.err.println("getOrderPaymentListByEmail");
		List<OrderDTO> OrderDetails = orderService.getOrderPaymentListByEmail(email);
		System.err.println("getOrderPaymentListByEmail=========================controlller" + OrderDetails);
		return OrderDetails;
	}

	/*
	 * @PostMapping("updateOrderStatus")
	 * 
	 * @ResponseBody public ResponseEntity<Object> updateVendorStatus(@RequestParam
	 * String orderId, String productId, String delivereStatus) { int orderID =
	 * Integer.parseInt(orderId); int productID = Integer.parseInt(productId);
	 * boolean update = orderService.updateOrderProduct(orderID, delivereStatus);
	 * System.out.println("Received orderID: " + orderId);
	 * System.out.println("Received productID: " + productId);
	 * System.out.println("Received status: " + delivereStatus); if (update) {
	 * return ResponseEntity.ok().body("updateOrderStatusSuccessfully"); }
	 * 
	 * return ResponseEntity.ok().body("!updateVendorStatusSuccessfully"); }
	 */
	

	@PostMapping("/upload")
	@ResponseBody
	public ResponseEntity<Object> uploadInvoice(@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam("orderId") String orderId, @RequestParam("status") String status) {
		try {
			int orderID = Integer.parseInt(orderId);
			System.err.println("File not found or empty.");
			System.err.println("file===================" + file);
			boolean updateOrderStatus = orderService.processInvoiceAndSendEmail(file, orderID, status);
			if (updateOrderStatus) {
				return ResponseEntity.ok().body("updateOrderStatusSuccessfully");
			} else {

				return ResponseEntity.ok().body("updateOrderStatusSuccessfully");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.ok().body("!Failed to upload invoice and send email.");
		}
	}

}


