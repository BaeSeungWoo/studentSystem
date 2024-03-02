package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "attendence")
public class Attendence {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long attend_code;
	@ManyToOne
	@JoinColumn(name = "student_code")
	private Student student;
	
	@ManyToOne
	@JoinColumn(name = "subject_code")
	private Subject subject;
	
	private long term_code;
	
	private long year;
	private long mid_score;
	private String final_score;
	private long last_score;
	private long re_attend;

}

