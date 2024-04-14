package com.xworkz.womentsecuritysystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.xworkz.womentsecuritysystem.configuration.MailConfiguration;

import org.springframework.mail.SimpleMailMessage;

@Service
public class MailSending {

	@Autowired
	private MailConfiguration mailConfiguration;
	
	public boolean emailVerficationOtp(String email, String otp) {
		JavaMailSender mailSender = mailConfiguration.mailConfig();
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("  "); // Set your email here
        message.setTo(email);
        message.setSubject("Email Verification OTP");
        message.setText("Dear User,\n\n"
                        + "Your OTP for email verification is: " + otp + "\n\n"
                        + "Please use this OTP to verify your email address.\n\n"
                        + "Best regards,\n"
                        + "Women Security App Team");

        try {
            mailSender.send(message); // Use mailSender to send the email
            System.out.println("Email verification OTP sent successfully");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	public boolean mailSend(String email, String username) {
		JavaMailSender mailSender = mailConfiguration.mailConfig();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("  "); // Set your email here
		message.setTo(email);
		message.setSubject("Thank you for Registering");
		message.setText("Dear " + username + ",\n\n"
				+ "Thank you for registering with us. We are delighted to welcome you to our community!\n\n"
				+ "Your security and well-being are our top priorities. Together, we can make a difference!\n\n"
				+ "Best regards,\n" + "Your Application Team");

		try {
			mailSender.send(message); // Use mailSender to send the email
			System.out.println("Mail sent successfully");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean sendOTPEmail(String email, String otp) {
		JavaMailSender mailSender = mailConfiguration.mailConfig();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("   "); // Set your email here
		message.setTo(email);
		message.setSubject("Password Reset OTP");
		message.setText("Dear User,\n\n" + "Your OTP for resetting the password is: " + otp + "\n\n"
				+ "Please use this OTP to reset your password.\n\n" + "Best regards,\n" + "Women Security App Team");

		try {
			mailSender.send(message); // Use mailSender to send the email
			System.out.println("OTP Mail sent successfully");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean sendPasswordChangeEmail(String email) {
		JavaMailSender mailSender = mailConfiguration.mailConfig();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(" "); // Set your email here
		message.setTo(email);
		message.setSubject("Password Changed Successfully");
		message.setText("Dear " + email + ",\n\n" + "Your password has been successfully changed.\n\n"
				+ "If you did not make this change, please contact us immediately.\n\n" + "Best regards,\n"
				+ "Women Security App Team");

		try {
			mailSender.send(message); // Use mailSender to send the email
			System.out.println("Password change email sent successfully");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean sendOTPAdminEmail(String email, String otp, String adminName) {
		JavaMailSender mailSender = mailConfiguration.mailConfig();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(" "); // Set your email here
		message.setTo(email);
		message.setSubject("admin login  OTP");
		message.setText("Dear Admin" +"   "+  adminName + "\n\n" + " use this OTP for login: " + otp + "\n\n"
				+ "Please use this OTP to login adimin page.\n\n" + "Best regards,\n" + "Women Security App Team");

		try {
			mailSender.send(message); // Use mailSender to send the email
			System.out.println("OTP Mail sent successfully");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
