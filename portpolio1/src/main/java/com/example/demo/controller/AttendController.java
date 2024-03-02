package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Attendence;
import com.example.demo.model.Student;
import com.example.demo.model.Subject;
import com.example.demo.repository.AttendenceRepository;
import com.example.demo.repository.StudentRepository;
import com.example.demo.repository.SubjectRepository;
import com.example.demo.service.AttendService;

@Controller
@RequestMapping("/student/*")
public class AttendController {

	@Autowired
	private AttendService attendService;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private SubjectRepository subjectRepository;
	
	@Autowired
	private AttendenceRepository attendenceRepository;

	@PostMapping("addSubject/{subject_code}")
	@ResponseBody
	public String addSubject(@RequestBody Attendence attendence, @PathVariable long subject_code, 
			Authentication authentication,  HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student checkStudent = studentRepository.findByUsername(userDetails.getUsername());
		Subject checkSubject = subjectRepository.findById(subject_code).get();
		List<Attendence> checkTime = attendenceRepository.checkTime(subject_code, checkSubject.getStart_time(), checkStudent.getStudent_code());
		System.out.println(checkTime.size());
		if(checkSubject.getMajor().getMajor_code() == checkStudent.getDepartment()) {
			if(checkTime.size() > 0) {				
				return "fail";	
			} else {
				attendService.add(checkStudent, attendence, subject_code);
				return "success";
			}									
		} else {			
			return "alert";
		}
		
	}
	
	@GetMapping("sugangList")
	public String sugangList(Model model,Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student student = studentRepository.findByUsername(userDetails.getUsername());
		List<Attendence> sugangList = attendService.sugangList(student);
		model.addAttribute("sugangList", sugangList);
		return "subject/sugangList";
	}

	@DeleteMapping("deleteSugang/{attend_code}")
	@ResponseBody
	public String deleteSugang(@PathVariable long attend_code) {
		attendService.deleteSugang(attend_code);
		return "success";
	}
	
	@GetMapping("calendar")
	public String calendar(Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student student = studentRepository.findByUsername(userDetails.getUsername());
		List<Attendence> calendar = attendenceRepository.findByStudentCode(student.getStudent_code());
		model.addAttribute("calendar", calendar);
		return "subject/calendar";
	}
	
	@GetMapping("score")
	public String scorePage(Model model,Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student student = studentRepository.findByUsername(userDetails.getUsername());
		List<Attendence> sugangList = attendService.sugangList(student);
		model.addAttribute("sugangList", sugangList);
		return "subject/scorePage";
	}

}
