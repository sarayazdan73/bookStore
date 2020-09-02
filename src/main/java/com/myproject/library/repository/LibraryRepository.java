package com.myproject.library.repository;

import com.myproject.library.model.Library;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LibraryRepository extends CrudRepository<Library,Long> {
    List<Library> findAll();
    void removeLibraryById(long id);

}
