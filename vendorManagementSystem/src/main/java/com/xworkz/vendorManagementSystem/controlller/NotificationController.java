package com.xworkz.vendorManagementSystem.controlller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xworkz.vendorManagementSystem.DTO.UserNotificationDTO;
import com.xworkz.vendorManagementSystem.service.NotificationService;

@Controller
@RequestMapping("/notification")
public class NotificationController {

	@Autowired
	private NotificationService notificationService;

	@GetMapping("/fetchUserNotifications")
	@ResponseBody
	public List<UserNotificationDTO> fetchUserNotifications(@RequestParam String email) {
		List<UserNotificationDTO> notifications = notificationService.getNotifcationMessageByEmail(email);
		return notifications;
	}

	@GetMapping("/markNotificationAsViewed")
	@ResponseBody
	public List<UserNotificationDTO> markNotificationAsViewed(@RequestParam int id, String userEmail) {

		notificationService.markNotificationAsViewed(id);

		List<UserNotificationDTO> updatedNotifications = notificationService.getNotifcationMessageByEmail(userEmail);

		return updatedNotifications;
	}

}
