package com.xworkz.vendorManagementSystem.repository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.vendorManagementSystem.Entity.VendorEntity;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class VendorRepositoryImpl implements VendorRepository {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public boolean checkEmailExistence(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		try {
			log.info("checkEmailExistence method repo");
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countByEmail");
			query.setParameter("ByEmail", email);
			Long count = (Long) query.getSingleResult();
			entityManager.getTransaction().commit();
			return count > 0;
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return false;
	}

	@Override
	public boolean checkContactNumberExistence(long contactNumber) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		try {
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countContactNumber");
			query.setParameter("byContactNumber", contactNumber);
			Long count = (Long) query.getSingleResult();
			entityManager.getTransaction().commit();
			return count > 0;
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return false;
	}

	@Override
	public boolean checkGSTNumberExistence(String GSTNumber) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		try {
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countByGSTNumber");
			query.setParameter("byGSTNumber", GSTNumber);
			Long count = (Long) query.getSingleResult();
			entityManager.getTransaction().commit();
			return count > 0;
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return false;
	}

	@Override
	public boolean checkWebsiteExistence(String website) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countByWebsite");
			query.setParameter("byWebsite", website);
			Long count = (Long) query.getSingleResult();
			entityManager.getTransaction().commit();
			return count > 0;
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return false;
	}

	@Override
	public boolean VendorEntitySave(VendorEntity vendorEntity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		log.info("connection is ok");
		try {
			entityTransaction.begin();
			entityManager.persist(vendorEntity);
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
	public boolean saveLoginOTPByEmailId(String email, String generatedOTP, LocalDateTime OTPGenerationTime) {
		System.err.println("saveLoginOTPByEmailId=================================");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("saveLoginOTPAndGenerationTimeByEmail");
			query.setParameter("loginOTP", generatedOTP);
			query.setParameter("OTPGenerationTime", OTPGenerationTime);
			query.setParameter("email", email);
			int rowsUpdated = query.executeUpdate();
			entityTransaction.commit();
			if (rowsUpdated == 0) {
				System.out.println("OTP not updated successfully");
				return false;
			}
		} catch (PersistenceException e) {
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
	public Object[] getOTPAndGenerationTimeByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<Object[]> query = entityManager.createNamedQuery("findOTPAndGenerationTimeAndStatusByEmail",
					Object[].class);
			query.setParameter("email", email);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null; // Return null if no result found
		} catch (Exception e) {
			e.printStackTrace();
			return null; // Return null in case of any exception
		}
	}

	@Override
	public VendorEntity getVendorDetailsByEmail(String email) {
		VendorEntity entity = null;
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			Query query = entityManager.createNamedQuery("findVendorDetailsByEmail");
			query.setParameter("ByEmail", email);
			entity = (VendorEntity) query.getSingleResult();
		} catch (NoResultException e) {
			System.out.println("No entity found for email: " + email);
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return entity;
	}

	@Override
	public String findImagePathByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<String> query = entityManager.createNamedQuery("findImagePathByEmail", String.class);
			query.setParameter("ByEmail", email);
			return query.getSingleResult();
		} catch (NoResultException e) {

			return null;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	@Override
	public VendorEntity findVendorByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<VendorEntity> query = entityManager.createNamedQuery("findVendorByEmail", VendorEntity.class);
			query.setParameter("ByEmail", email);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null; // or throw an exception as per your requirement
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	@Override
	public int findIdByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<Integer> query = entityManager.createNamedQuery("findIdByEmail", Integer.class);
			query.setParameter("email", email);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return -1;
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
	}

	@Override
	public List<VendorEntity> readAllvendorDetailes() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		List<VendorEntity> readAll = null;
		try {
			TypedQuery<VendorEntity> query = entityManager.createNamedQuery("getAllUserData", VendorEntity.class);
			readAll = query.getResultList();
		} catch (RuntimeException e) {

		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return readAll != null ? new ArrayList<>(readAll) : Collections.emptyList();
	}

	@Override
	public boolean updateVendorDetailsById(int id, VendorEntity updatedVendor) {
		System.err.println("updateVendorDetailsById===================");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			VendorEntity existingVendor = entityManager.find(VendorEntity.class, id);
			if (existingVendor != null) {
				// Update the existing vendor entity with the new details
				existingVendor.setOwnerName(updatedVendor.getOwnerName());
				existingVendor.setEmailId(updatedVendor.getEmailId());
				existingVendor.setContactNumber(updatedVendor.getContactNumber());
				existingVendor.setAltContactNumber(updatedVendor.getAltContactNumber());
				existingVendor.setVendorName(updatedVendor.getVendorName());
				existingVendor.setStartDate(updatedVendor.getStartDate());
				existingVendor.setGSTNumber(updatedVendor.getGSTNumber());
				existingVendor.setPincode(updatedVendor.getPincode());
				existingVendor.setImagePath(updatedVendor.getImagePath());
				existingVendor.setAddress(updatedVendor.getAddress());

				// Merge the changes to the existing entity
				entityManager.merge(existingVendor);
				entityTransaction.commit();
				return true;
			} else {
				// Vendor with the specified ID not found
				return false;
			}
		} catch (PersistenceException e) {
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
	public List<VendorEntity> readAllvendorDeta() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		List<VendorEntity> readAll = null;
		try {
			TypedQuery<VendorEntity> query = entityManager.createNamedQuery("AllVendorData", VendorEntity.class);
			readAll = query.getResultList();
		} catch (RuntimeException e) {

		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return readAll != null ? new ArrayList<>(readAll) : Collections.emptyList();
	}

	@Override
	public boolean updateVendorStatus(int id, String status) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			VendorEntity entity = entityManager.find(VendorEntity.class, id);
			entity.setStatus(status);
			entityManager.merge(entity);
			entityTransaction.commit();
			System.err.println("=================--------------------------------");
			return true;
		} catch (PersistenceException e) {
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

}
