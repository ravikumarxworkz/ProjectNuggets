package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xworkz.vendorManagementSystem.Entity.AnnouncementEntity;

@Repository
public class AnnouncementRepoImpl implements AnnouncementRepo {

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Override
	public boolean saveAnnouncement(AnnouncementEntity announcementEntity) {
		EntityManager entityManager = null;
		EntityTransaction transaction = null;
		try {
			entityManager = entityManagerFactory.createEntityManager();
			transaction = entityManager.getTransaction();
			transaction.begin();
			entityManager.persist(announcementEntity);
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			if (entityManager != null) {
				entityManager.close();
			}
		}
	}

	@Override
	public List<AnnouncementEntity> getAllAnnouncements() {
		EntityManager entityManager = null;
		try {
			entityManager = entityManagerFactory.createEntityManager();
			TypedQuery<AnnouncementEntity> query = entityManager.createNamedQuery("getAllAnnouncement",
					AnnouncementEntity.class);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (entityManager != null) {
				entityManager.close();
			}
		}
	}

	@Override
	public boolean deleteAnnouncementById(int id) {
		EntityManager entityManager = null;
		EntityTransaction transaction = null;
		try {
			entityManager = entityManagerFactory.createEntityManager();
			transaction = entityManager.getTransaction();
			transaction.begin();
			AnnouncementEntity entity = entityManager.find(AnnouncementEntity.class, id);
			if (entity != null) {
				entityManager.remove(entity);
				transaction.commit();
				return true;
			}
			return false;
		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			if (entityManager != null) {
				entityManager.close();
			}
		}
	}
}
