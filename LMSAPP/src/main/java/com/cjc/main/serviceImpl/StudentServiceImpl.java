package com.cjc.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjc.main.model.Book;
import com.cjc.main.model.Student;
import com.cjc.main.repository.StudentRepository;
import com.cjc.main.serviceI.StudentServiceI;




@Service
public class StudentServiceImpl implements StudentServiceI
{

	@Autowired
	StudentRepository sr;
	
	@Override
	public void saveStudentDetails(Student s) {
		sr.save(s);
	}

	@Override
	public List<Student> getAllStudents() {
		return (List<Student>)sr.findAll();
	}

	@Override
	public List<Student> searchStudentById(Long id) {
		List<Student> Students=sr.findAllById(id);
		return Students;
		
	}
	
	@Transactional
	@Override
	public void remove(Long id) {
		sr.deleteById(id);
		
	}

	@Override
	public List<Student> updateStudentBook(long id, String book) {
		
		Student s=sr.findById(id).get();
		
		sr.save(s);
		return (List<Student>) sr.findAll();
	}
	

	
	 
   

	

	
}
