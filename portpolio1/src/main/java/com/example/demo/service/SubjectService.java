package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Major;
import com.example.demo.model.Subject;


public interface SubjectService {
	
	public List<Major> majorList(String major_type);
	
	public List<Subject> subjectList(Long major_code, Long subject_type);

}
