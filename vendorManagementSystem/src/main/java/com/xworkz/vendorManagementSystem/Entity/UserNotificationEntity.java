package com.xworkz.vendorManagementSystem.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;


@Data
@Entity
@Table(name = "usernotification")
@NamedQuery(name = "getUserNotificationByUserId", query = "SELECT entity FROM UserNotificationEntity entity WHERE entity.userId=:userId")
@NamedQuery(name = "getallnotification", query = "SELECT entity FROM UserNotificationEntity entity")
public class UserNotificationEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "message_id")
	private MessageEntity message;

	@Column(name = "user_id", nullable = false)
	private int userId;

	@Column(name = "is_read", columnDefinition = "BOOLEAN DEFAULT FALSE")
	private boolean isRead;

	
}
