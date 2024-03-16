package com.xworkz.womentsecuritysystem.repository;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import com.xworkz.womentsecuritysystem.dto.ComplaintsDTO;
import com.xworkz.womentsecuritysystem.entity.ComplaintsEntity;
import com.xworkz.womentsecuritysystem.entity.WomenSecurityEntity;

public class WomenSecurityRepoImpl implements WomenSecurityRepo {

	@Override
	public boolean save(WomenSecurityEntity entity) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
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
			entityManagerFactory.close();

		}
		return true;

	}

	@Override
	public boolean logIn(String email, long phoneNumber) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("login");
			query.setParameter("email", email);
			query.setParameter("contactNumber", phoneNumber);
			query.getSingleResult();
			entityTransaction.commit();
			return true;
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();

			}

		} finally {
			entityManager.close();
			entityManagerFactory.close();

		}
		return false;

	}

	@Override
	public boolean isExit(String email) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("isExit");
			query.setParameter("email", email);
			query.getSingleResult();
			entityTransaction.commit();
			return true;
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();

			}

		} finally {
			entityManager.close();
			entityManagerFactory.close();

		}
		return false;

	}

	@Override
	public WomenSecurityEntity view(String email, long phoneNumber) {
		WomenSecurityEntity entity = new WomenSecurityEntity();
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("login");
			query.setParameter("email", email);
			query.setParameter("contactNumber", phoneNumber);
			entity = (WomenSecurityEntity) query.getSingleResult();
			entityTransaction.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();

			}

		} finally {
			entityManager.close();
			entityManagerFactory.close();

		}
		return entity;
	}

	@Override
	public boolean update(int id, WomenSecurityEntity entity) {
		System.err.println("this update method");
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("Connection is ok");
		try {
			System.out.println("beging");
			entityTransaction.begin();
			System.out.println("beging=========================");
			WomenSecurityEntity entity2 = entityManager.find(WomenSecurityEntity.class, id);
			System.out.println("outsiude if condition" + entity2);
			if (entity2 != null) {
				System.out.println("if conndition " + entity2);
				entity2.setName(entity.getName());
				entity2.setAadharCardNumber(entity.getAadharCardNumber());
				entity2.setDateOfBirth(entity.getDateOfBirth());
				entity2.setContactNumber(entity.getContactNumber());
				entity2.setAltContactNumber(entity.getAltContactNumber());
				entity2.setEmail(entity.getEmail());
				entity2.setWorking(entity.getWorking());
				entity2.setCountry(entity.getCountry());
				entity2.setState(entity.getState());
				entity2.setPresentPlace(entity.getPresentPlace());
				entity2.setPermanentPlace(entity.getPermanentPlace());
				entity2.setPincode(entity.getPincode());
				entityManager.merge(entity2);
				entityTransaction.commit();
				System.out.println("Data updated successfully");
				return true;
			} else {
				System.out.println("Entity with ID " + id + " not found.");
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
			entityManagerFactory.close();
		}
	}

	@Override
	public boolean delte(String email) {
		System.out.println("this repo delete method");
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("deleteByEmail");
			query.setParameter("email", email);

			int deletedRows = query.executeUpdate();

			if (deletedRows > 0) {
				entityTransaction.commit();
				System.out.println(deletedRows + " row(s) deleted.");
				return true;
			} else {
				System.out.println("No rows deleted.");
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
			entityManagerFactory.close();
		}
	}

	@Override
	public boolean complaintSave(ComplaintsEntity entity) {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			entityManager.persist(entity);
			entityTransaction.commit();
			System.out.println("compalints  data saved");
		} catch (PersistenceException e) {
			e.printStackTrace();
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
				return false;
			}

		} finally {
			entityManager.close();
			entityManagerFactory.close();

		}
		return true;

	}

	@Override
	public ArrayList<ComplaintsEntity> complaintHistortyByemail(String email) {
		ArrayList<ComplaintsEntity> list = new ArrayList<ComplaintsEntity>();
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
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
			entityManagerFactory.close();

		}
		return list;
	}

}
