package com.example.demo.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "student")
@DynamicInsert
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long student_code;
	private String username;
	private String password;
	private String name;
	@Temporal(TemporalType.DATE)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date birth;
	private String gender;
	private String academic_status;
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date hyhak_date;
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date bokhak_date;
	@Embedded
	private Address address;
	private String phone;
	private String email;
	private String grade;
	private long department;
	private String juya;
	@ColumnDefault("'ROLE_STUDENT'")
	private String role;
	@Embedded
	private Picture picture;
	
	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Attendence> attendence;
	
	@OneToMany(mappedBy = "student", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Fee> fee;

}
