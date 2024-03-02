package com.example.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "major")
public class Major {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long major_code;
	private String major_type;
	private String major_name;
	
	@OneToMany(mappedBy = "major", cascade = CascadeType.REMOVE)
	@JsonIgnore
	private List<Subject> subject;

}
