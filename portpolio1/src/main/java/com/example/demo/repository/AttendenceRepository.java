package com.example.demo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Attendence;

public interface AttendenceRepository extends JpaRepository<Attendence, Long> {

	@Query(value = "select *\r\n"
			+ "from attendence a left join subject b on a.subject_code = b.subject_code\r\n"
			+ "left join professor c on b.professor = c.professor_code where a.student_code = ?1 ;", nativeQuery = true)
	List<Attendence> attendList(Long student_code);
	
	@Query(value = "select * from attendence as a left outer join subject as b on a.subject_code = :subject_code where b.start_time = :start_time and a.student_code = :student_code ;", nativeQuery = true)
	List<Attendence> checkTime(@Param("subject_code")Long subject_code, @Param("start_time")Date start_time, @Param("student_code")Long student_code);
	
	@Query(value = "select * from attendence as a left outer join subject as b on a.subject_code = b.subject_code where student_code = ?1 order by yoil asc ,start_time asc ;", nativeQuery = true)
	List<Attendence> findByStudentCode(@Param("student_code")Long student_code);
	
	@Query(value = "select * from attendence a left join subject b on a.subject_code = b.subject_code\r\n"
			+ "left join professor c on b.professor = c.professor_code where c.professor_name = :professor_name ;", nativeQuery = true)
	List<Attendence> findByProfessorName(@Param("professor_name")String professor_name);
 
}
