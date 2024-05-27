package com.xworkz.vendorManagementSystem.service;

public interface MessageService {

	boolean sendToAll(String messageContent ,String subject);

	boolean sendToUser(String email, String messageContent,String subject);

}
