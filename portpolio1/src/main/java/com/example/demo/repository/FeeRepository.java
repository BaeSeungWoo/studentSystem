package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Fee;

public interface FeeRepository extends JpaRepository<Fee, Long>{
	
	@Query(value = "select * from fee where student = ?1 ;", nativeQuery = true)
	public List<Fee> findByStudent(@Param("student")Long student_number);

}
