package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Attendence;

public interface ProfessorService {
	
	public List<Attendence> findByProfessorName(String professor_name);
	
	public void insertDetailScore(Attendence attendence);

}
