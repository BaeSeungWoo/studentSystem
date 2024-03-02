package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.model.Attendence;
import com.example.demo.model.Student;
import com.example.demo.model.Subject;
import com.example.demo.repository.AttendenceRepository;
import com.example.demo.repository.SubjectRepository;


@Service 
public class AttendServiceImpl implements AttendService{
	
	@Autowired
	private AttendenceRepository attendenceRepository;
		
	@Autowired
	private SubjectRepository subjectRepository;

	@Override
	public void add(Student student, Attendence attendence, long subject_code) {
		// TODO Auto-generated method stub
		Subject subject = subjectRepository.findById(subject_code).get();
		attendence.setStudent(student);
		attendence.setSubject(subject);
		attendenceRepository.save(attendence);
	}

	@Override
	public List<Attendence> sugangList(Student student) {
		// TODO Auto-generated method stub
		long code = student.getStudent_code();		
		return attendenceRepository.attendList(code);
	}

	@Override
	public void deleteSugang(long attend_code) {
		// TODO Auto-generated method stub
		attendenceRepository.deleteById(attend_code);
	}
	
}
