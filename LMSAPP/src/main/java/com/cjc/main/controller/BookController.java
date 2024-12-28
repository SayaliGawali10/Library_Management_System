package com.cjc.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjc.main.model.Book;
import com.cjc.main.serviceI.BookServiceI;


@Controller
public class BookController{

	@Autowired
	BookServiceI bsi;
	
	@RequestMapping("/")
	public String preLogin() {
		return "login";
	}
	
	
	@RequestMapping("/login")
	public String onLogin(@RequestParam("Username") String username, @RequestParam("Password") String password, Model m) {
		
		if(username.equals("admin") && password.equals("admin123")) {
			List<Book> al=bsi.getAllBooks();
			m.addAttribute("data", al);
		return "admin";
	}
		else {
	
	    return "login";
		
		}
		}
	
	@RequestMapping("/AddBook")
    public String viewBooks(@ModelAttribute Book b, Model m) {
		bsi.saveBookDetails(b);
        List<Book> books = bsi.getAllBooks(); 
        m.addAttribute("books", books);  
        return "addBooks";  
    }

	@RequestMapping("/SearchBook")
	public String getBookDetails(@RequestParam Long id, Model m) {
		List<Book> result=bsi.searchBookById(id);
		if(result.size()>0)
		{
			m.addAttribute("books", result);
			
		}
		else {
		List<Book> students=bsi.getAllBooks();
		m.addAttribute("data", students);
		}
		return "addBooks";
}
    
	@RequestMapping("/DeleteBook")
	public String removeBooks(@RequestParam ("id") int id, Model m) {
		bsi.remove(id);
		List<Book> list=bsi.getAllBooks();
		m.addAttribute("books", list);
		return "addBooks";
		
	}
	
	

}
