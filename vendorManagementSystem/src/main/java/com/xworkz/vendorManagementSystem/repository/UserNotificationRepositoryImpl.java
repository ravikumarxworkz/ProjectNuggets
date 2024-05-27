package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.vendorManagementSystem.Entity.ProductEntity;
import com.xworkz.vendorManagementSystem.Entity.UserNotificationEntity;

@Repository
public class UserNotificationRepositoryImpl implements UserNotificationRepository {

	@Autowired
	EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveUserNotification(UserNotificationEntity userNotificationEntity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			entityManager.persist(userNotificationEntity);
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
	public UserNotificationEntity findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean markNotificationAsViewed(int notificationId, boolean read) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		try {
			entityTransaction.begin();
			UserNotificationEntity entity = entityManager.find(UserNotificationEntity.class, notificationId);
			entity.setRead(read);
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
	public List<UserNotificationEntity> getuserNotificationByEmail(int vendorId) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		return entityManager.createNamedQuery("getUserNotificationByUserId", UserNotificationEntity.class)
				.setParameter("userId", vendorId).getResultList();
	}

	@Override
	public List<UserNotificationEntity> readall() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		return entityManager.createNamedQuery("getallnotification", UserNotificationEntity.class).getResultList();

	}
}
