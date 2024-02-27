package com.xworkz.voteriapplication.service;

import java.util.ArrayList;

import com.xworkz.voteriapplication.dto.VoterIdDto;
import com.xworkz.voteriapplication.entity.VoterIdEntity;
import com.xworkz.voteriapplication.repository.VoterIdRepo;
import com.xworkz.voteriapplication.repository.VoterIdRepoImpl;

public class VoterIdServiceImpl implements VoterIdService {

    private VoterIdRepo idRepo = new VoterIdRepoImpl();

    @Override
    public boolean validateAndSave(VoterIdDto dto) {
        VoterIdEntity entity = new VoterIdEntity();

        entity.setName(dto.getName());
        entity.setAadharCardNumber(dto.getAadharCardNumber());
        entity.setDateOfBirth(dto.getDateOfBirth());
        entity.setContactNumber(dto.getContactNumber());
        entity.setAltContactNumber(dto.getAltContactNumber());
        entity.setCountry(dto.getCountry());
        entity.setState(dto.getState());
        entity.setPresentPlace(dto.getPresentPlace());
        entity.setPermanentPlace(dto.getPermanentPlace());
        entity.setPincode(dto.getPincode());
        entity.setVoterId(dto.getVoterId());

        boolean exists = isExists(dto.getAadharCardNumber());
        if (exists) {
            return false;
        } else {
            boolean saved = idRepo.save(entity);
            return saved;
        }
    }

    @Override
    public boolean isExists(long aadharCardNumber) {
        ArrayList<VoterIdEntity> entities = idRepo.read();
        for (VoterIdEntity entity : entities) {
            if (entity.getAadharCardNumber() == aadharCardNumber) {
                return true;
            }
        }
        return false;
    }

}
