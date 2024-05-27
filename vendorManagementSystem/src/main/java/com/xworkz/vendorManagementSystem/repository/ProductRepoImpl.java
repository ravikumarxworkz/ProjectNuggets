package com.xworkz.vendorManagementSystem.repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.vendorManagementSystem.Entity.ProductEntity;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ProductRepoImpl implements ProductRepo {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveProdctEntity(ProductEntity productEntity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		log.info("connection is ok");
		try {
			entityTransaction.begin();
			entityManager.persist(productEntity);
			entityTransaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
				return false;
			}

		} finally {
			entityManager.close();

		}
		return true;
	}

	@Override
	public List<ProductEntity> findProductByEmail(int id) {
		System.err.println("vendorid===============" + id);
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		return entityManager.createNamedQuery("findProductByVendor", ProductEntity.class).setParameter("vendorId", id)
				.getResultList();
	}

	@Override
	public boolean updateProductById(int id, ProductEntity productEntity) {
		System.err.println("updateProductById=============repo================");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			ProductEntity entity = entityManager.find(ProductEntity.class, id);
			entity.setCategory(productEntity.getCategory());
			entity.setProductName(productEntity.getProductName());
			entity.setProductPrice(productEntity.getProductPrice());
			entity.setDeliveryCharge(productEntity.getDeliveryCharge());
			entity.setAvailable(productEntity.getAvailable());
			entity.setDescriptionAboutProduct(productEntity.getDescriptionAboutProduct());
			entityManager.merge(entity);
			entityTransaction.commit();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
				return false;
			}

		} finally {
			entityManager.close();

		}
		return false;
	}

	@Override
	public List<ProductEntity> readAllProducts() {
		System.err.println("==============readAllProducts====================================");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		List<ProductEntity> readAll = null;
		try {
			TypedQuery<ProductEntity> query = entityManager.createNamedQuery("readAllProducts", ProductEntity.class);
			readAll = query.getResultList();
			System.err.println("readALL" + readAll);
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return readAll != null ? new ArrayList<>(readAll) : Collections.emptyList();
	}

	
	/*
	 * @Override public boolean updateOrderProduct(int id, String status) {
	 * System.err.println("updateProductStatus=============repo================");
	 * EntityManager entityManager = entityManagerFactory.createEntityManager();
	 * EntityTransaction entityTransaction = entityManager.getTransaction(); try {
	 * entityTransaction.begin(); ProductEntity entity =
	 * entityManager.find(ProductEntity.class, id); entity.setStatus(status);
	 * entityManager.merge(entity); entityTransaction.commit(); return true;
	 * 
	 * } catch (Exception e) { e.printStackTrace(); if
	 * (entityTransaction.isActive()) { entityTransaction.rollback(); return false;
	 * }
	 * 
	 * } finally { entityManager.close();
	 * 
	 * } return false; }
	 */
	 

	@Override
	public ProductEntity getProductDetailesByProductID(int ProductID) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		return entityManager.createNamedQuery("getProductDetailesByProductID", ProductEntity.class)
				.setParameter("ProductID", ProductID).getSingleResult();
	}

}

