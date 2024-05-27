package com.xworkz.vendorManagementSystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.Entity.VendorEntity;
import com.xworkz.vendorManagementSystem.repository.ProductRepo;
import com.xworkz.vendorManagementSystem.repository.VendorRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepo productRepository;

	@Autowired
	VendorRepository vendorRepository;

	@Autowired
	private MailSending mailSending;

	@Override
	public boolean SaveProdctDTO(ProductDTO productDTO) {
		ProductEntity productEntity = new ProductEntity();

		VendorEntity vendorEntity = vendorRepository.findVendorByEmail(productDTO.getEmail());

		if (vendorEntity != null) {
			/* productDTO.setStatus("NotOrder"); */
			productDTO.setVendor(vendorEntity);
			/* productEntity.setVendor(vendorEntity); */

			BeanUtils.copyProperties(productDTO, productEntity);
			boolean saveProduct = this.productRepository.saveProdctEntity(productEntity);
			if (saveProduct) {
				return true;
			}
		} else {
			return false;
		}
		return false;
	}

	@Override
	public List<ProductDTO> findProductDetails(String email) {
		int vendorID = vendorRepository.findIdByEmail(email);
		List<ProductEntity> productEntities = productRepository.findProductByEmail(vendorID);
		List<ProductDTO> productDTOs = new ArrayList<>();
		for (ProductEntity productEntity : productEntities) {
			ProductDTO productDTO = new ProductDTO();
			BeanUtils.copyProperties(productEntity, productDTO);
			productDTOs.add(productDTO);
		}

		return productDTOs;
	}

	@Override
	public boolean updateProduct(ProductDTO EditProductDTO) {
		System.err.println("updateProduct====SERVICE============" + EditProductDTO);
		if (EditProductDTO != null) {
			ProductEntity UpdateproductEntity = new ProductEntity();
			BeanUtils.copyProperties(EditProductDTO, UpdateproductEntity);
			boolean updateproduct = productRepository.updateProductById(EditProductDTO.getId(), UpdateproductEntity);
			if (updateproduct) {
				return true;
			}

		}
		return false;
	}

	@Override
	public List<ProductDTO> readAllProducts() {
		List<ProductEntity> productEntities = productRepository.readAllProducts();
		List<ProductDTO> productDTOs = new ArrayList<>();
		for (ProductEntity productEntity : productEntities) {
			productEntity.getVendor().setOTPGenerationTime(null);
			productEntity.getVendor().setLoginOTP(null);
			ProductDTO productDTO = new ProductDTO();
			try {
				BeanUtils.copyProperties(productEntity, productDTO);
				productDTOs.add(productDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return productDTOs;
	}

	
}