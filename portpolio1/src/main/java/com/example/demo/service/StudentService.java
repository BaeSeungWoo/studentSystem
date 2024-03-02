package com.example.demo.service;

import com.example.demo.model.Fee;
import com.example.demo.model.Picture;
import com.example.demo.model.Student;

public interface StudentService {
	
	public void signUp(Student student);
	
	public void update(Student student);
	
	public void delete(Long num);
	
	public void hyuhak(Student student);
	
	public void bokhak(Student student);
	
	public void fee(Long student_code, Fee fee);
	
	public void studentImage(Picture picure, Student student);
	
	public void regPro(Long professor_code, Student student);

}
