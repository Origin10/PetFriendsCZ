package petfriends.service;

import java.util.List;

import petfriends.model.Book;


public interface StuffService {
	List<Book> findAll ();
	
	Book findOne(Long id);
	
	List<Book> findByCategory(String category);
	
	List<Book> blurrySearch(String title);

	Book save(Book book);

	void removeOne(Long id);
}
