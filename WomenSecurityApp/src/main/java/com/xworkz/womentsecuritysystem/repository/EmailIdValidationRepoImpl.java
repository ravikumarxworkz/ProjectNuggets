package com.xworkz.womentsecuritysystem.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.womentsecuritysystem.entity.EmailValidationEntity;

@Repository
public class EmailIdValidationRepoImpl implements EmailIdValidationRepo {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveOtpByEmailId(EmailValidationEntity entity) {
		System.err.println("saveOtpByEmailId");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			entityManager.persist(entity);
			entityTransaction.commit();
			System.out.println("email id otp and time is saved saved");
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
	public String findLatestOtpByEmail(String email) {
		System.err.println("findLatestOtpByEmail=======================");
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
	public boolean deleteEmailVerificationDataByEmail(String email) {
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
