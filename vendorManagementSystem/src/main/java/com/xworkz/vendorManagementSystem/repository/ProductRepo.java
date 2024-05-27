package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import com.xworkz.vendorManagementSystem.DTO.ProductDTO;
import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.Entity.VendorEntity;

public interface ProductRepo {

	boolean saveProdctEntity(ProductEntity productEntity);

	List<ProductEntity> findProductByEmail(int id);

	ProductEntity getProductDetailesByProductID(int id);

	boolean updateProductById(int id, ProductEntity productEntity);

	List<ProductEntity> readAllProducts();

	/* boolean updateOrderProduct(int id, String status); */
	

}
