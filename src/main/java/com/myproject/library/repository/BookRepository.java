package com.myproject.library.repository;

import com.myproject.library.model.Book;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BookRepository extends CrudRepository<Book,Long> {
    List<Book> findAll();
}
