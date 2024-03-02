package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Major;
import com.example.demo.model.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.StudentService;
import com.example.demo.service.SubjectService;

@Controller
public class LoginController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private SubjectService subjectService;

	@GetMapping("/login")
	public String login() {
		return "/login/login";
	}
	
	@GetMapping("getMajorList/{major_type}")
	@ResponseBody
	public List<Major> getMajorList(@PathVariable String major_type){
		return subjectService.majorList(major_type);
	}

	@GetMapping("/SignUp")
	public String signUp() {
		return "/login/signUp";
	}

	@PostMapping("/SignUp")
	@ResponseBody
	public String signUp(@RequestBody Student student) {
		if (studentRepository.findByUsername(student.getUsername()) != null) {
			return "fail";
		} else {
			studentService.signUp(student);
			return "success";
		}
	}
	
	@GetMapping("/regProfessor")
	public String regProfessor() {
		return "/login/regProfessor";
	}
	
	@GetMapping("/regProfessor/{professor_code}")
	@ResponseBody
	public String regProfessor(@PathVariable Long professor_code, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student student = studentRepository.findByUsername(userDetails.getUsername());
		studentService.regPro(professor_code, student);
		return "success";
	}

}
