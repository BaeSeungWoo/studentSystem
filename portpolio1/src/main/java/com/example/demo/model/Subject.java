package com.example.demo.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "subject")
public class Subject {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long subject_code;
	private long subject_type;
	private String credits_earned;
	private String subject_name;
	private String haknyun;
	private long yoil;
	
	@Temporal(TemporalType.TIME)
	private Date start_time;
	@Temporal(TemporalType.TIME)
	private Date end_time;
	
	
	@ManyToOne
	@JoinColumn(name = "major")
	private Major major;
	
	@ManyToOne
	@JoinColumn(name = "professor")
	private Professor professor;
	
	@OneToMany(mappedBy = "subject", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Attendence> attendence;

}
