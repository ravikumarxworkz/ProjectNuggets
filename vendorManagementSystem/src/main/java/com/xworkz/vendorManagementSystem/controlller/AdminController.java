package com.xworkz.vendorManagementSystem.controlller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xworkz.vendorManagementSystem.DTO.AnnouncementDTO;
import com.xworkz.vendorManagementSystem.DTO.OrderDTO;
import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.DTO.VendorDTO;
import com.xworkz.vendorManagementSystem.service.AdminService;
import com.xworkz.vendorManagementSystem.service.AnnouncementService;
import com.xworkz.vendorManagementSystem.service.OrderService;
import com.xworkz.vendorManagementSystem.service.ProductService;
import com.xworkz.vendorManagementSystem.service.VendorService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private VendorService vendorService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private AnnouncementService announcementService;

	@GetMapping("/adminLoginPage")
	public String adminPage() {
		return "adminlogin";

	}

	/*---------------------------------- CHECK ADMIN EMAIL AND GENERATE LOGIN OTP  METHOD------------------------------------ */
	@GetMapping("/reemail")
	public ResponseEntity<String> checkEmailInDatabase(@RequestParam String email) {
		boolean emailExistsInDatabase = adminService.generateAndSendOTP(email);
		if (emailExistsInDatabase) {
			return ResponseEntity.ok("exists");
		} else {
			return ResponseEntity.ok("not exists");
		}
	}

	/*---------------------------------- VALIDATE ADMIN LFOIN OTP  METHOD------------------------------------ */
	@PostMapping("/validateOTP")
	public ResponseEntity<String> validateOTP(@RequestParam String email, @RequestParam String otp) {
		boolean validate = adminService.validateOpt(email, otp);
		if (validate) {
			return ResponseEntity.ok("valid");
		} else {
			return ResponseEntity.ok("not valid");
		}
	}
	/*----------------------------------ADMIN LOGIN WITH PASSWORD METHOD------------------------------------ */

	@PostMapping("/Login")
	public String adminLogin(@RequestParam String email, String password, Model model, HttpServletRequest request,
			HttpSession session) {
		boolean login = adminService.adminLogin(email, password);
		if (login) {
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("email", email);
			return "adminpage";
		} else {
			model.addAttribute("error", "Incorrect password");
			return "redirect:/admin/adminLoginPage";
		}
	}

	/*----------------------------------ADMIN LOGOUT METHOD------------------------------------ */
	@GetMapping("/adminLogout")
	public String logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession httpSession = request.getSession(false);

		if (httpSession != null) {
			httpSession.setAttribute("username", null);
			httpSession.invalidate();
		}

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		return "redirect:/homePage";
	}

	/*----------------------------------DISPLAY VENDOR IMAGE  METHOD------------------------------------ */
	@GetMapping("/display")
	public void displayUserImageByEmail(HttpServletResponse response,
			@RequestParam(value = "imagePath", required = false) String imagePath) throws IOException {
		String ImagePath = imagePath;
		if (imagePath != null) {
			File file = new File("D:\\vendorManageMentUserProfileImage\\" + ImagePath);
			InputStream in = new BufferedInputStream(new FileInputStream(file));
			ServletOutputStream out = response.getOutputStream();
			IOUtils.copy(in, out);
			response.flushBuffer();
		}
	}

	/*----------------------------------GET ALL VENDOR LIST METHOD------------------------------------ */
	@GetMapping("/getUserData")
	@ResponseBody
	public List<VendorDTO> getData() {
		List<VendorDTO> data = vendorService.readAllVendorData();
		return data;
	}

	/*----------------------------------APPROVE VENDOR LOGIN PERMISSION METHOD ------------------------------------ */
	@PostMapping("updateVendorStatus")
	@ResponseBody
	public ResponseEntity<Object> updateVendorStatus(@RequestParam String id, String status) {
		int vendorID = Integer.parseInt(id);
		boolean update = vendorService.updateVendorStatus(vendorID, status);
		if (update) {
			return ResponseEntity.ok().body("updateVendorStatusSuccessfully");
		} else {
			return ResponseEntity.ok().body("!updateVendorStatusSuccessfully");
		}
	}

	/*----------------------------------GET ALL PRODUCT LIST METHOD------------------------------------ */
	@GetMapping("/getAllProducts")
	@ResponseBody
	public List<ProductDTO> getProductDetails() {
		List<ProductDTO> ProductData = productService.readAllProducts();
		return ProductData;
	}

	/*----------------------------------GET USER DETAILS BY  EMAILID METHOD------------------------------------ */
	@GetMapping("/getUserDataByEmail")
	@ResponseBody
	public VendorDTO getUserByEmail(@RequestParam String email) {
		VendorDTO filteredData = vendorService.getVendorDetailsByEmail(email);
		return filteredData;
	}

	/*----------------------------------SAVE ORDER METHOD------------------------------------ */
	@PostMapping("orderProduct")
	@ResponseBody
	public ResponseEntity<Object> orderProduct(OrderDTO orderDTO) {
		boolean saveorder = orderService.saveorder(orderDTO);
		if (saveorder) {
			return ResponseEntity.ok().body("Order Product successfully");
		}
		return ResponseEntity.ok().body("Order  Product not successfully");
	}

	/*----------------------------------GET ORDER DETAILS LIST METHOD------------------------------------ */
	@GetMapping("/getOrderDetailsByAdmin")
	@ResponseBody
	public List<OrderDTO> getProductDetailsByEmail() {
		List<OrderDTO> OrderDetails = orderService.getOrderDetailsByAdmin();
		return OrderDetails;
	}

	/*----------------------------------GET ORDER STATUS DETAILS LIST METHOD----------------------------------- */
	@GetMapping("/getOrderStatusDetails")
	@ResponseBody
	public List<OrderDTO> getOrderStatusDetails() {
		List<OrderDTO> orderStatusDetails = orderService.getOrderStatusDetailsByAdmin();
		return orderStatusDetails;
	}

	/*----------------------------------UPDATE  ORDER PRODUCT DETAILS  METHOD----------------------------------- */
	@PostMapping("updateOrderProduct")
	@ResponseBody
	public ResponseEntity<Object> updateOrderProduct(OrderDTO orderDTO) {
		System.out.println("updateOrderProduct===============" + orderDTO);
		boolean updateOrder = orderService.updateOrderByAdmin(orderDTO);
		if (updateOrder) {
			return ResponseEntity.ok().body("update Order Product successfully");
		}

		return ResponseEntity.ok().body("!update Order Product successfully");
	}

	/*----------------------------------CANCEL ORDER METHOD------------------------------------ */
	@PostMapping("cancelOrder")
	@ResponseBody
	public ResponseEntity<Object> cancelOrder(@RequestParam int orderId, @RequestParam String orderStatus) {
		boolean updateOrder = orderService.cancelOrderByAdmin(orderId, orderStatus);
		if (updateOrder) {
			return ResponseEntity.ok().body("Order cancelled successfully");
		}
		return ResponseEntity.ok().body("!Order not cancelled successfully");

	}

	/*----------------------------------UPDATE ORDER AND PAYMENT STATUS METHOD------------------------------------ */
	@PostMapping("/updateOrderStatusByAdmin")
	@ResponseBody
	public ResponseEntity<Object> updateOrderStatusByAdmin(@RequestParam("orderId") String orderId,
			@RequestParam("paymentStatus") String paymentStatus, @RequestParam("orderStatus") String orderStatus,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			int orderID = Integer.parseInt(orderId);
			boolean updateOrderStatus = orderService.updateOrderStatusByAdmin(orderID, paymentStatus, orderStatus,
					file);
			if (updateOrderStatus) {
				return ResponseEntity.ok().body("updateOrderStatusSuccessfully");
			} else {

				return ResponseEntity.ok().body("!updateOrderStatusSuccessfully");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.ok().body("!Failed to upload invoice and send email.");
		}
	}

	/*----------------------------------GET ORDER DETAILS HISTORY LIST METHOD------------------------------------ */
	@GetMapping("/getAllOrderHistory")
	@ResponseBody
	public List<OrderDTO> getAllOrderHistory() {
		List<OrderDTO> OrderDetails = orderService.getAllOrderHistory();
		return OrderDetails;
	}

	/*----------------------------------GET ALL GET ORDER DETAILS PAYMENT HISTORY  AND PAYMENT SUMMARY HISTORY LIST METHOD------------------------------------ */
	@GetMapping("/getOrderPaymentHistory")
	@ResponseBody
	public List<OrderDTO> getOrderPaymentHistory() {
		List<OrderDTO> OrderDetails = orderService.getOrderPaymentHistory();
		return OrderDetails;
	}

	/*----------------------------------save announcement METHOD------------------------------------ */
	@PostMapping("saveAnnouncement")
	@ResponseBody
	public ResponseEntity<Object> saveAnnouncement(@ModelAttribute AnnouncementDTO announcementDTO) {
		boolean saveAnnouncement = this.announcementService.saveAnnouncement(announcementDTO);
		if (saveAnnouncement) {
			return ResponseEntity.ok().body("Announcement saved successfully");
		}
		return ResponseEntity.ok().body("!Announcement saved successfully");

	}

	/*----------------------------------GET ALL Announcements LIST METHOD------------------------------------ */
	@GetMapping("/getAnnouncements")
	@ResponseBody
	public List<AnnouncementDTO> getAnnouncements() {
		System.out.println("this is  getAnnouncements");
		List<AnnouncementDTO> announcements = this.announcementService.getAllAnnouncements();
		return announcements;
	}

	/*----------------------------------delete announcement METHOD------------------------------------ */
	@PostMapping("deleteAnnouncement")
	@ResponseBody
	public ResponseEntity<Object> deleteAnnouncement(@RequestParam int id) {
		System.out.println("id===========================" + id);
		boolean deleteAnnouncement = this.announcementService.deleteAnnouncementById(id);
		System.out.println("deleteAnnouncement===============" + deleteAnnouncement);
		if (deleteAnnouncement) {
			return ResponseEntity.ok().body("Announcement deleted successfully");
		}
		return ResponseEntity.ok().body("!Announcement deleted successfully");

	}
}
