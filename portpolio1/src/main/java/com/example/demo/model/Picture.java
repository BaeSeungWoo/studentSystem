package com.example.demo.model;

import javax.persistence.Embeddable;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Embeddable
public class Picture {
	
	@Transient
	private MultipartFile studentImage;
	private String pictureName;

}
