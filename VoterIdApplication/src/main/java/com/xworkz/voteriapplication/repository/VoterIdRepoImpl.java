package com.xworkz.voteriapplication.repository;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import com.xworkz.voteriapplication.entity.VoterIdEntity;

public class VoterIdRepoImpl implements VoterIdRepo {

	ArrayList<VoterIdEntity> read;

	@Override
	public boolean save(VoterIdEntity entity) {

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			entityManager.persist(entity);
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
			entityManagerFactory.close();

		}
		return true;

	}

	@Override
	public ArrayList<VoterIdEntity> read() {
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("com");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		System.out.println("connection is ok");
		try {
			entityTransaction.begin();
			Query query = entityManager.createNamedQuery("readAll");

			read = (ArrayList<VoterIdEntity>) query.getResultList();

			entityTransaction.commit();

		} catch (PersistenceException e) {

			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
				return null;
			}
		} finally {
			entityManager.close();
			entityManagerFactory.close();
		}

		return read;

	}
}
