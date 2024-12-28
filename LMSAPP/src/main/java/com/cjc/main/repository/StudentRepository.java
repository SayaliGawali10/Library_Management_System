package com.cjc.main.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cjc.main.model.Student;


public interface StudentRepository extends CrudRepository<Student, Long>{

	public List<Student> findAllById(Long id);

	public void save(List<Student> student);

	
	

	
	
}
