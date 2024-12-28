package com.cjc.main.serviceImpl;

import java.util.List;
import java.util.Optional;

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
	public Student getSingleStudent(long id) {
		Optional<Student> opStudent=sr.findById(id);
		return opStudent.get();
		}
	
	@Override
	public List<Student> updateStudentBook(long id, String borrowedBook) {
	    Student s = sr.findById(id).orElse(null);  
	    if (s != null) {
	        s.setBorrowedBook(borrowedBook);  
	        sr.save(s);  
	    }
	    return (List<Student>) sr.findAll();  
	}

	@Override
	public Student getStudentById(Long id) {
		Optional<Student> opStudent=sr.findById(id);
		   return opStudent.get();  
			}

	
	@Override
	public void save(Student student) {
		sr.save(student);
	}

	
	

	 
   

	

	
}
