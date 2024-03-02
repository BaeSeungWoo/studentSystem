package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Long>{
	
	@Query(value = "SELECT * FROM subject AS a LEFT OUTER JOIN major AS b ON a.major = b.major_code WHERE a.major = ?1 AND a.subject_type = ?2 ;", nativeQuery = true)
	List<Subject> findBySubjectList(@Param("major")long major_code, long subject_type);
	
	@Query(value = "SELECT * FROM subject AS a LEFT OUTER JOIN major AS b ON a.major = b.major_code WHERE a.major = ?1 ;", nativeQuery = true)
	List<Subject> findBySubjectList2(@Param("major")long major_code);
	
}
