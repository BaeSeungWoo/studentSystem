package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Attendence;
import com.example.demo.model.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.ProfessorService;

@Controller
@RequestMapping("/professor/*")
public class ProfessorController {
	
	@Autowired
	private ProfessorService professorService;
	@Autowired
	private StudentRepository studentRepository;
	
	@GetMapping("insertScore")
	public String insertScore(Model model,Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student student = studentRepository.findByUsername(userDetails.getUsername());
		List<Attendence> studentList = professorService.findByProfessorName(student.getName());
		model.addAttribute("studentList", studentList);
		return "professor/insertScore";
	}
	
	@GetMapping("insertScore/{attend_code}")
	public String insertScore(@PathVariable Long attend_code, Model model) {
		model.addAttribute("attendCode", attend_code);
		return "professor/detailInsert";
	}
	
	@PutMapping("insertDetailScore")
	@ResponseBody
	public String insertDetailScore(@RequestBody Attendence attendence) {
		professorService.insertDetailScore(attendence);
		return "success";
	}

}
