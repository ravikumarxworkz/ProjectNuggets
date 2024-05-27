package com.xworkz.vendorManagementSystem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.vendorManagementSystem.DTO.UserNotificationDTO;
import com.xworkz.vendorManagementSystem.Entity.UserNotificationEntity;
import com.xworkz.vendorManagementSystem.repository.UserNotificationRepository;
import com.xworkz.vendorManagementSystem.repository.VendorRepository;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private UserNotificationRepository userNotificationRepository;

	@Autowired
	private VendorRepository vendorRepository;

	@Override
	public List<UserNotificationDTO> getNotifcationMessageByEmail(String email) {
		int vendorId = vendorRepository.findIdByEmail(email);
		List<UserNotificationEntity> entities = userNotificationRepository.getuserNotificationByEmail(vendorId);
		List<UserNotificationDTO> notificationDTOs = new ArrayList<>();
		for (UserNotificationEntity userNotificationEntity : entities) {
			if (userNotificationEntity.isRead() == false) {
				System.out.println(userNotificationEntity);
				UserNotificationDTO dto = new UserNotificationDTO();
				BeanUtils.copyProperties(userNotificationEntity, dto);
				notificationDTOs.add(dto);
			}

		}

		return notificationDTOs;
	}

	@Override
	public boolean markNotificationAsViewed(int id) {
		boolean read = true;
		boolean markView = userNotificationRepository.markNotificationAsViewed(id, read);
		if (markView) {
			return true;
		}
		return false;

	}

}