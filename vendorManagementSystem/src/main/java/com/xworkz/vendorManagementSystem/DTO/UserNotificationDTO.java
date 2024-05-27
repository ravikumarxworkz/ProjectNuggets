package com.xworkz.vendorManagementSystem.DTO;

import javax.persistence.Id;

import com.xworkz.vendorManagementSystem.Entity.MessageEntity;

import lombok.Data;

@Data
public class UserNotificationDTO {
	@Id
	private int id;
	private int userId;
	private MessageEntity message;
	private boolean isRead;

}
