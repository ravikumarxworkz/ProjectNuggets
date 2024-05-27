package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import com.xworkz.vendorManagementSystem.Entity.UserNotificationEntity;

public interface UserNotificationRepository {

	boolean saveUserNotification(UserNotificationEntity userNotificationEntity);

	List<UserNotificationEntity> getuserNotificationByEmail(int vendorId);

	boolean markNotificationAsViewed(int notificationId, boolean  read);

	UserNotificationEntity findById(int id);

	List<UserNotificationEntity> readall();

}
