package com.xworkz.womentsecuritysystem.repository;

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

import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;

@Repository
public class WomenSecurityRepoImpl implements WomenSecurityRepo {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveUserDetailes(WomenSecurityEntity entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			entityManager.persist(entity);
			entityTransaction.commit();
			System.out.println("data saved");
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
	public boolean findByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		try {
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countByEmail");
			query.setParameter("email", email);
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
	public boolean findByAaadharcard(Long aadharCardNumber) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		try {
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countByAadharCardNumber");
			query.setParameter("aadharCardNumber", aadharCardNumber);
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
	public boolean findByContactNumber(Long contactNumber) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		try {
			entityManager.getTransaction().begin();
			Query query = entityManager.createNamedQuery("countByContactNumber");
			query.setParameter("contactNumber", contactNumber);
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
	public WomenSecurityEntity readByEmail(String email) {
		WomenSecurityEntity entity = null;
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			Query query = entityManager.createNamedQuery("readByEmail");
			query.setParameter("email", email);
			entity = (WomenSecurityEntity) query.getSingleResult();
		} catch (NoResultException e) {
			// Handle case where no entity is found for the given email
			System.out.println("No entity found for email: " + email);
		} finally {
			if (entityManager != null && entityManager.isOpen()) {
				entityManager.close();
			}
		}
		return entity;
	}

	@Override
	public boolean updateById(int id, WomenSecurityEntity entity) {
		System.out.println("entiy======================== from repo" + entity);
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			WomenSecurityEntity entity2 = entityManager.find(WomenSecurityEntity.class, id);
			if (entity2 != null) {
				entity2.setName(entity.getName());
				entity2.setAadharCardNumber(entity.getAadharCardNumber());
				entity2.setContactNumber(entity.getContactNumber());
				entity2.setAltContactNumber(entity.getAltContactNumber());
				entity2.setEmail(entity.getEmail());
				entity2.setCountry(entity.getCountry());
				entity2.setState(entity.getState());
				entity2.setPresentPlace(entity.getPresentPlace());
				entity2.setPincode(entity.getPincode());
				entity2.setImagePath(entity.getImagePath());
				entityManager.merge(entity2);
				entityTransaction.commit();
				System.out.println("Data updated successfully");
				return true;
			} else {
				return false;
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
			}
			return false;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public boolean deleteByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("deleteByEmail");
			query.setParameter("email", email);

			int deletedRows = query.executeUpdate();

			if (deletedRows > 0) {
				entityTransaction.commit();
				return true;
			} else {
				return false;
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
			}
			return false;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public boolean complaintSave(ComplaintsEntity entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			entityManager.persist(entity);
			entityTransaction.commit();
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
	public ArrayList<ComplaintsEntity> complaintHistoryByEmail(String email) {
		ArrayList<ComplaintsEntity> list = new ArrayList<ComplaintsEntity>();
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("histortybyemail");
			query.setParameter("email", email);
			list = (ArrayList<ComplaintsEntity>) query.getResultList();
			entityTransaction.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();

			}

		} finally {
			entityManager.close();

		}
		return list;
	}

	@Override
	public boolean updatedPasswordByEmail(String email, String newPassword) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("updatedPasswordByEmail");
			query.setParameter("password", newPassword);
			query.setParameter("email", email);
			int rowsUpdated = query.executeUpdate();
			entityTransaction.commit();
			if (rowsUpdated == 0) {
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
	public boolean updateOptByEmail(String email, String otp) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("updatedOTPByEmail");
			query.setParameter("otp", otp);
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
	public List<WomenSecurityEntity> readAll() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		List<WomenSecurityEntity> readAll = null;
		try {
			TypedQuery<WomenSecurityEntity> query = entityManager.createNamedQuery("readAll",
					WomenSecurityEntity.class);
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
	public List<ComplaintsEntity> readAllComplaints() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		List<ComplaintsEntity> readAll = null;
		try {
			TypedQuery<ComplaintsEntity> query = entityManager.createNamedQuery("readAllComplaints",
					ComplaintsEntity.class);
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
	public String imagePathByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<String> query = entityManager.createNamedQuery("findImagePathByEmail", String.class);
			query.setParameter("email", email);
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
	public String findPasswordByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<String> query = entityManager.createNamedQuery("findPasswordByEmail", String.class);
			query.setParameter("email", email);
			return query.getSingleResult();
		} catch (NoResultException e) {
			return null;
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
	public String findOTPByEmail(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			TypedQuery<String> query = entityManager.createNamedQuery("findOTPByEmail", String.class);
			query.setParameter("email", email);
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
	public boolean updateComplaintStatus(int id, String status) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			ComplaintsEntity entity = entityManager.find(ComplaintsEntity.class, id);
			entity.setStatus(status);
			entityManager.merge(entity);
			entityTransaction.commit();
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
