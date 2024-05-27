package com.xworkz.vendorManagementSystem.DTO;

import java.time.LocalDateTime;

import javax.persistence.Id;

import lombok.Data;

@Data
public class MessageDTO {
	@Id
	private int id;
	private String content;
	private int senderId;
	private LocalDateTime timestamp;

}
