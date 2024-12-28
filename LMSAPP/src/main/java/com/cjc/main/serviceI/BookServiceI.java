package com.cjc.main.serviceI;

import java.util.List;

import com.cjc.main.model.Book;

public interface BookServiceI {

	
	public List<Book> getAllBooks();

	public void saveBookDetails(Book b);

	public List<Book> searchBookById(Long id);

	public void remove(int id);
	
	

	
	

	

	

	

	

	
	
	
	

	
	
}
