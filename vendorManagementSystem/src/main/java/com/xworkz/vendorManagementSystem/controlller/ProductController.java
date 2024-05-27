package com.xworkz.vendorManagementSystem.controlller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/")
@Slf4j
public class ProductController {

	@Autowired
	private ProductService productService;

	@PostMapping("/addProduct")
	@ResponseBody
	public ResponseEntity<String> productSaveDTO(ProductDTO productDTO, Model model) {
		boolean saveproduct = this.productService.SaveProdctDTO(productDTO);
		if (saveproduct) {
			return ResponseEntity.ok().body("addProduct saved successfully");
		}
		return ResponseEntity.ok().body("addProduct not saved successfully");

	}

	@GetMapping("/getProductDetailsByEmail")
	@ResponseBody
	public List<ProductDTO> getProductDetailsByEmail(@RequestParam String email) {
		List<ProductDTO> ProductDetails = productService.findProductDetails(email);
		System.err.println(ProductDetails);
		return ProductDetails;
	}
	@PostMapping("/productUpdate")
	@ResponseBody
	public ResponseEntity<String> productUpdate(ProductDTO productDTO, Model model) {
		boolean saveproduct = this.productService.updateProduct(productDTO);
		if (saveproduct) {
			return ResponseEntity.ok().body("Product updated successfully");
		}
		return ResponseEntity.ok().body("Product not updated successfully");

	}

}