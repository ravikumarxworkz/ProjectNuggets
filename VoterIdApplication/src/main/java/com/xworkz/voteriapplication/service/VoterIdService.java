package com.xworkz.voteriapplication.service;

import com.xworkz.voteriapplication.dto.VoterIdDto;

public interface VoterIdService {

	boolean validateAndSave(VoterIdDto dto);

	boolean isExists(long aadhareCardNumber);

}
