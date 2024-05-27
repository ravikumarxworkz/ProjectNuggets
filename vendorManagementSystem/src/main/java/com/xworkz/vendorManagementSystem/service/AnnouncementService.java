package com.xworkz.vendorManagementSystem.service;

import java.util.List;

import com.xworkz.vendorManagementSystem.DTO.AnnouncementDTO;

public interface AnnouncementService {

	boolean saveAnnouncement(AnnouncementDTO announcementDTO);

	List<AnnouncementDTO> getAllAnnouncements();

	boolean deleteAnnouncementById(int id);

}
