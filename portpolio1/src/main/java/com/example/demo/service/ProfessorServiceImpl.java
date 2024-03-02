package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Attendence;
import com.example.demo.repository.AttendenceRepository;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	
	@Autowired
	private AttendenceRepository attendenceRepository;

	@Override
	public List<Attendence> findByProfessorName(String professor_name) {
		// TODO Auto-generated method stub
		return attendenceRepository.findByProfessorName(professor_name);
	}

	@Override
	@Transactional
	public void insertDetailScore(Attendence attendence) {
		// TODO Auto-generated method stub
		Attendence studentAttend = attendenceRepository.findById(attendence.getAttend_code()).get();
		studentAttend.setMid_score(attendence.getMid_score());
		studentAttend.setLast_score(attendence.getLast_score());
		studentAttend.setFinal_score(attendence.getFinal_score());
	}

}
