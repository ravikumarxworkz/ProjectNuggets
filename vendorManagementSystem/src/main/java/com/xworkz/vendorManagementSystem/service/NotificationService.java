package com.xworkz.vendorManagementSystem.service;

import java.util.List;

import com.xworkz.vendorManagementSystem.DTO.UserNotificationDTO;

public interface NotificationService {

	List<UserNotificationDTO> getNotifcationMessageByEmail(String email);
	
	boolean markNotificationAsViewed(int id);
}