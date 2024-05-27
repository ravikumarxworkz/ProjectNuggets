package com.xworkz.vendorManagementSystem.repository;

import java.util.List;

import com.xworkz.vendorManagementSystem.Entity.AnnouncementEntity;

public interface AnnouncementRepo {

	boolean saveAnnouncement(AnnouncementEntity announcementEntity);

	List<AnnouncementEntity> getAllAnnouncements();

	boolean deleteAnnouncementById(int id);

}
