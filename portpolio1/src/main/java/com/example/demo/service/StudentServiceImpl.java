package com.example.demo.service;



import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Fee;
import com.example.demo.model.Picture;
import com.example.demo.model.Professor;
import com.example.demo.model.Student;
import com.example.demo.repository.FeeRepository;
import com.example.demo.repository.ProfessorRepository;
import com.example.demo.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private FeeRepository feeRepository;
	@Autowired
	private ProfessorRepository professorRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public void signUp(Student student) {
		// TODO Auto-generated method stub
		String initPwd = student.getPassword();
		String encodePwd = encoder.encode(initPwd);
		student.setPassword(encodePwd);
		student.setGrade("1학년");
		student.setAcademic_status("jyehak");
		studentRepository.save(student);
	}

	@Transactional
	@Override
	public void update(Student student) {
		// TODO Auto-generated method stub
		Student updateStudent = studentRepository.findById(student.getStudent_code()).get();
		updateStudent.setAddress(student.getAddress());
		updateStudent.setEmail(student.getEmail());
		updateStudent.setPhone(student.getPhone());
	}

	@Override
	public void delete(Long num) {
		// TODO Auto-generated method stub
		studentRepository.deleteById(num);
	}

	@Transactional
	@Override
	public void hyuhak(Student student) {
		// TODO Auto-generated method 
		Date hyuhakDate = new Date();
		Student hyuhak = studentRepository.findById(student.getStudent_code()).get();
		hyuhak.setAcademic_status(student.getAcademic_status());
		hyuhak.setHyhak_date(hyuhakDate);
	}

	@Transactional
	@Override
	public void bokhak(Student student) {
		// TODO Auto-generated method stub
		Date bokhakDate = new Date();
		Student bokhak = studentRepository.findById(student.getStudent_code()).get();
		bokhak.setAcademic_status(student.getAcademic_status());
		bokhak.setBokhak_date(bokhakDate);
	}

	@Transactional
	@Override
	public void fee(Long student_code, Fee fee) {
		// TODO Auto-generated method stub
		Student fee_student = studentRepository.findById(student_code).get();
		Date payment_date = new Date();
		fee.setStudent(fee_student);
		fee.setPayment_date(payment_date);
		fee.setPrice(3876000);
		feeRepository.save(fee);
	}

	@Override
	@Transactional
	public void studentImage(Picture picture, Student student) {
		// TODO Auto-generated method stub
		UUID uuid = UUID.randomUUID();
		MultipartFile studentImage = picture.getStudentImage();
		Student regStud = studentRepository.findByUsername(student.getUsername());
		String uploadFileName = "";
		if(!studentImage.isEmpty()) {
			uploadFileName = uuid.toString() + "_" + studentImage.getOriginalFilename();
			File saveFile = new File(uploadFileName);
			try {
				studentImage.transferTo(saveFile);
				picture.setPictureName(uploadFileName);;
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		regStud.setPicture(picture);
		
	}

	@Transactional
	@Override
	public void regPro(Long professor_code, Student student) {
		// TODO Auto-generated method stub
		Professor professor = professorRepository.findById(professor_code).get();
		student.setName(professor.getProfessor_name());
		student.setDepartment(professor.getProfessor_major());
		student.setRole("ROLE_PROFESSOR");
	}

}
