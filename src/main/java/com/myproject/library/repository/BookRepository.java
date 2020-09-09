package com.myproject.library.repository;

import com.myproject.library.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BookRepository extends JpaRepository<Book,Long> {
    List<Book> findAll();
    List<Book>findByNameContaining(String x);

}
