package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.model.Subject;
import com.example.demo.service.SubjectService;

@Controller
@RequestMapping("/student/*")
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
		
	@GetMapping("sugang_application")
	public String sugang_application() {
		return "subject/sugang_application";
	}
	
	@GetMapping("getSubjectList/{subject_type}/{major_code}")
	@ResponseBody
	public List<Subject> getSubjectList(@PathVariable Long subject_type, @PathVariable Long major_code) {
		return subjectService.subjectList(major_code, subject_type);
		
	}
	
}
