package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Attendence;
import com.example.demo.model.Student;

public interface AttendService {
	
	public void add(Student student, Attendence attendence, long subject_code);

	public List<Attendence> sugangList(Student student);
	
	public void deleteSugang(long attend_code);
}
