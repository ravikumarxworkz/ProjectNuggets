package com.xworkz.vendorManagementSystem.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.vendorManagementSystem.Entity.EmailValidationEntity;

@Repository
public class EmailIdValidationRepoImpl implements EmailIdValidationRepo {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveOTPByEmailId(EmailValidationEntity entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
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
	public String findLatestOTPByEmailId(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		try {
			Query query = entityManager.createNamedQuery("findLatestOtpByEmail");
			query.setParameter("email", email);
			query.setMaxResults(1);
			return (String) query.getSingleResult();

		} catch (NoResultException e) {
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteEmailVerificationDataByEmailId(String email) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("deleteEmailVerificationDataByEmail");
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
}
