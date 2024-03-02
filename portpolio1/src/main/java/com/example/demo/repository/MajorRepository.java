package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Major;

public interface MajorRepository extends JpaRepository<Major, Long>{
	
	@Query(value = "select * from major where major_type = :major_type", nativeQuery = true)
	List<Major> findByMajorType(String major_type);

}
