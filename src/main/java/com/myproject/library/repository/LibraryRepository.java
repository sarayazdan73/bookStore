package com.myproject.library.repository;

import com.myproject.library.model.Library;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LibraryRepository extends JpaRepository<Library,Long> {
    List<Library> findAll();
    Library findLibraryByName(String name);
    void removeLibraryById(long id);

}
