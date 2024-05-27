package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.vendorManagementSystem.Entity.MessageEntity;

@Repository
public class MessageRepoImpl implements MessageRepo {

	@Autowired
	EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveMessage(MessageEntity messageEntity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			entityManager.persist(messageEntity);
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
	public boolean saveMessagePersonlly(MessageEntity messageEntity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			entityManager.persist(messageEntity);
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
	public List<MessageEntity> readAllMessages() {
		// TODO Auto-generated method stub
		return null;
	}

}
