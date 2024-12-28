package com.cjc.main.serviceI;

import java.util.List;

import com.cjc.main.model.Book;
import com.cjc.main.model.Student;

public interface StudentServiceI {

	public void saveStudentDetails(Student s);

	public List<Student> getAllStudents();

	public List<Student> searchStudentById(Long id);

	public void remove(Long id);

	public List<Student> updateStudentBook(long id, String book);

	

	

	
}
