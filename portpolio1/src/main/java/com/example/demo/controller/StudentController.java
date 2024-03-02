package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.config.auth.PrincipalUser;
import com.example.demo.model.Fee;
import com.example.demo.model.Picture;
import com.example.demo.model.Student;
import com.example.demo.repository.FeeRepository;
import com.example.demo.repository.StudentRepository;
import com.example.demo.service.StudentService;

@Controller
@RequestMapping("/student/*")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private FeeRepository feeRepository;

	@GetMapping("detail")
	public String detail(Authentication authentication, Model model) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student check = studentRepository.findByUsername(userDetails.getUsername());
		if(check.getPicture() != null) {
			model.addAttribute("picture", check.getPicture().getPictureName());
		}	
		return "/student/detail";
	}

	@GetMapping("hyuhak")
	public String hyuhak(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student check = studentRepository.findByUsername(userDetails.getUsername());
		if(check.getAcademic_status().equals("jyehak")) {			
			return "/student/hyuhak";
		}  else {
			request.setAttribute("msg", "재학 중인 인원만 신청 가능합니다.");
			return "alert";
		}
	}
	
	@PutMapping("hyuhak")
	@ResponseBody
	public String hyuhak(@RequestBody Student student) {
		studentService.hyuhak(student);
		return "success";
	}
	
	@GetMapping("bokhak")
	public String bokhak(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Student check = studentRepository.findByUsername(userDetails.getUsername());
		if(check.getAcademic_status().equals("military_hyuhak")) {			
			return "/student/bokhak";
		} else if(check.getAcademic_status().equals("normal_hyuhak")) {			
			return "/student/hyuhak";
		} else {
			request.setAttribute("msg", "휴학 중인 인원만 신청 가능합니다.");
			return "alert";
		}
	}
	
	@PutMapping("bokhak")
	@ResponseBody
	public String bokhak(@RequestBody Student student) {
		studentService.bokhak(student);
		return "success";
	}

	@GetMapping("update")
	public String update() {
		return "/student/update";
	}

	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody Student student) {
		studentService.update(student);
		return "success";
	}

	@DeleteMapping("delete/{student_code}")
	@ResponseBody
	public String delete(@PathVariable Long student_code) {
		studentService.delete(student_code);
		return "success";
	}
	
	@GetMapping("fee")
	public String fee(HttpServletRequest request) {
		SecurityContext context = SecurityContextHolder.getContext();
		PrincipalUser p = (PrincipalUser) context.getAuthentication().getPrincipal();
		Student principal = (Student)p.getStudent();
		List<Fee> feeList = feeRepository.findByStudent(principal.getStudent_code());
		if(feeList.size() == 0) {
			return "/student/fee";
		} else {
			request.setAttribute("msg", "이미 등록금이 납입되었습니다.");
			return "alert";
		}
		
	}
	
	@PostMapping("/fee/{student_code}")
	@ResponseBody
	public String fee(@PathVariable Long student_code, @RequestBody Fee fee) {
		studentService.fee(student_code, fee);
		return "success";
	}
	
	@GetMapping("picture")
	public String picture() {
		return "student/picture";
	}
	
	@PostMapping("regPicture")
	public String regPicture(Picture picture, HttpServletRequest request) {
		SecurityContext context = SecurityContextHolder.getContext();
		PrincipalUser p = (PrincipalUser) context.getAuthentication().getPrincipal();
		Student principal = (Student)p.getStudent();
		studentService.studentImage(picture, principal);
		request.setAttribute("msg", "success");
		return "student/picture";
	}
	
}
