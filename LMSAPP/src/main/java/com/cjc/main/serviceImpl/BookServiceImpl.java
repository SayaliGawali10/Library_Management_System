package com.cjc.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjc.main.model.Book;
import com.cjc.main.repository.BookRepository;
import com.cjc.main.serviceI.BookServiceI;



@Service
public class BookServiceImpl implements BookServiceI 
{

	@Autowired
	BookRepository br;

        @Override
	    public List<Book> getAllBooks() {
	        return (List<Book>) br.findAll();  
	    }

		@Override
		public void saveBookDetails(Book b) {
			br.save(b);
			
		}

		@Override
		public List<Book> searchBookById(Long id) {
			List<Book> books=br.findAllById(id);
			return books;
		}
		
		@Transactional
		@Override
		public void remove(int id) {
			br.deleteById(id);
			
		}

	   
	  
	
	
	
	

	
}
