package com.xworkz.voteriapplication.repository;

import java.util.ArrayList;

import com.xworkz.voteriapplication.entity.VoterIdEntity;

public interface VoterIdRepo {

	boolean save(VoterIdEntity entity);

	ArrayList<VoterIdEntity> read();

}
