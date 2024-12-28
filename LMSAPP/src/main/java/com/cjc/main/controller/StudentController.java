package com.cjc.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cjc.main.model.Book;
import com.cjc.main.model.Student;
import com.cjc.main.serviceI.BookServiceI;
import com.cjc.main.serviceI.StudentServiceI;

@Controller
public class StudentController
{

	@Autowired
	StudentServiceI ssi;
	
	@RequestMapping("/AddStudent")
    public String viewBooks(@ModelAttribute Student s, Model m) {
		ssi.saveStudentDetails(s);
        List<Student> students = ssi.getAllStudents(); 
        m.addAttribute("students", students);  
        return "addstudent";  
    }

	@RequestMapping("/SearchStudent")
	public String getStudentDetails(@RequestParam Long id, Model m) {
		List<Student> result=ssi.searchStudentById(id);
		if(result.size()>0)
		{
			m.addAttribute("students", result);
			
		}
		else {
		List<Student> students=ssi.getAllStudents();
		m.addAttribute("students", students);
		
	}
		return "addstudent";
}
    
	@RequestMapping("/DeleteStudent")
	public String removeStudents(@RequestParam ("id") Long id, Model m) {
		ssi.remove(id);
		List<Student> list=ssi.getAllStudents();
		m.addAttribute("students", list);
		return "addstudent";
		
	}
	
	@RequestMapping("/changeBook")
	public String changeBook(@RequestParam("id") long id, @RequestParam("book") String book, Model m) {
		
		List<Student> students=ssi.updateStudentBook(id, book);
		m.addAttribute("students", students);
		return "addstudent";
		
	}
	@RequestMapping("/ChangeBook")
	public String onBatchChange(@RequestParam long id, Model m) {
	    Student st = ssi.getSingleStudent(id);  
	    List<Student> list = ssi.getAllStudents();  
        m.addAttribute("st", st);  
	    m.addAttribute("students", list);   
	    return "changeBook";  
	    }

	@RequestMapping("/UpdateBook")
	public String batchShift(@RequestParam("studentid") long id, @RequestParam("borrowedBook") String borrowedBook, Model m) {
	    List<Student> students = ssi.updateStudentBook(id, borrowedBook);  
	    m.addAttribute("students", students);  
	    return "addstudent";  
	}

	@RequestMapping("/RemoveBook")
	public String removeBook(@RequestParam("id") Long id, Model m) {
	    Student student = ssi.getStudentById(id);  // Assuming ssi.getStudentById(id) fetches the student by ID
	    if (student != null) {
	        student.setBorrowedBook(null);  // Clear the borrowedBook field
	        ssi.save(student);  // Save the updated student object
	    }
	    List<Student> list = ssi.getAllStudents();  // Fetch the updated list of students
	    m.addAttribute("students", list);
	    return "addstudent";  // Or the correct view name where you display the list of students
	}



}
