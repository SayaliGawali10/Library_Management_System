package com.cjc.main.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cjc.main.model.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long>{

	

	public List<Book> findAllById(long id);

	public void deleteById(int id);

	
	
	
	

	
	

	
	
	
	
}
