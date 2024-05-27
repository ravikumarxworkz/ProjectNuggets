package com.xworkz.vendorManagementSystem.controlller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xworkz.vendorManagementSystem.service.MessageService;


@RestController
@RequestMapping("/messages")
public class MessageController {

	@Autowired
	MessageService messageService;

	@PostMapping("/sendMessage")
	@ResponseBody
	public String sendMessage(@RequestParam("subject") String subject, @RequestParam("message") String message,
			@RequestParam("sendToAll") boolean sendToAll,
			@RequestParam(value = "recipientEmail", required = false) String recipientEmail) {
		try {
			if (sendToAll) {
				System.out.println("subject===============" + subject);
				System.err.println("message===========controleer======" + message);
				boolean sendMessageToAll = messageService.sendToAll(message, subject);
				if (sendMessageToAll) {
					return "Message sent successfully";
				} else {
					return "!Message sent successfully";
				}

			} else {
				System.out.println("message send successfully" + recipientEmail);
				boolean messageSent = messageService.sendToUser(recipientEmail, message, subject);
				if (messageSent) {
					return "Message sent successfully";
				}
			}

		} catch (Exception e) {
			return "Failed to send message: " + e.getMessage();
		}
		return "!Message sent successfully";
	}
}