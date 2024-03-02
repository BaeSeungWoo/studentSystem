package com.example.demo.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.model.Student;
import com.example.demo.repository.StudentRepository;

@Service
public class PrincipalDetails implements UserDetailsService{
	
	@Autowired
	private StudentRepository memberRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Student student = memberRepository.findByUsername(username);
		if(student == null) {
			return null;
		}
		PrincipalUser pStudent = new PrincipalUser(student);
		return pStudent;
	}

}
