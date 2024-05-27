package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import com.xworkz.vendorManagementSystem.Entity.MessageEntity;

public interface MessageRepo {

	boolean saveMessage(MessageEntity messageEntity);
	
	List<MessageEntity> readAllMessages();
	
	boolean saveMessagePersonlly(MessageEntity messageEntity);
	

}

