package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Major;
import com.example.demo.model.Subject;
import com.example.demo.repository.MajorRepository;
import com.example.demo.repository.SubjectRepository;

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private MajorRepository majorRepository;
	@Autowired
	private SubjectRepository subjectRepository;

	@Override
	public List<Major> majorList(String major_type) {
		// TODO Auto-generated method stub
		return majorRepository.findByMajorType(major_type);
	}

	@Override
	public List<Subject> subjectList(Long major_code, Long subject_type) {
		// TODO Auto-generated method stub
		if (subject_type == 0) {
			return subjectRepository.findBySubjectList2(major_code);
		} else {
			return subjectRepository.findBySubjectList(major_code, subject_type);
		}
	}
}
