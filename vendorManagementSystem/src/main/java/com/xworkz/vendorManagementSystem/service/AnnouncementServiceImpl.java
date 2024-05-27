package com.xworkz.vendorManagementSystem.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.xworkz.vendorManagementSystem.DTO.AnnouncementDTO;
import com.xworkz.vendorManagementSystem.Entity.AnnouncementEntity;
import com.xworkz.vendorManagementSystem.repository.AnnouncementRepo;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementRepo announcementRepo;

    @Override
    public boolean saveAnnouncement(AnnouncementDTO announcementDTO) {
        if (announcementDTO != null) {
            AnnouncementEntity announcementEntity = new AnnouncementEntity();
            BeanUtils.copyProperties(announcementDTO, announcementEntity);
            boolean save = this.announcementRepo.saveAnnouncement(announcementEntity);
            return save;
        }
        return false;
    }

    @Override
    public List<AnnouncementDTO> getAllAnnouncements() {
        List<AnnouncementEntity> entities = this.announcementRepo.getAllAnnouncements();
        if (entities != null) {
            return entities.stream().map(entity -> {
                AnnouncementDTO dto = new AnnouncementDTO();
                BeanUtils.copyProperties(entity, dto);
                return dto;
            }).collect(Collectors.toList());
        }
        return null;
    }

    @Override
    public boolean deleteAnnouncementById(int id) {
        return this.announcementRepo.deleteAnnouncementById(id);
    }
}
