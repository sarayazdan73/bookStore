package com.myproject.library.service.library;

import com.myproject.library.model.Library;
import com.myproject.library.repository.LibraryRepository;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class LibraryServiceImpl implements LibraryService {
    @Autowired
    private LibraryRepository libraryRepository;

    @Transactional
    public List<Library> getAllLibrary(){

        List<Library> libraries = libraryRepository.findAll();

        return libraries;
    }

    public Library addLibrary(Library libraryName){
        Library li = libraryRepository.save(libraryName);
        return li;
    }

    @Override
    public void deleteLibrary(long id) {
        Optional< Library > libraryDb = this.libraryRepository.findById(id);

        if (libraryDb.isPresent()) {
            this.libraryRepository.delete(libraryDb.get());
        } else {
            throw new ResourceNotFoundException("Record not found with id : " + id);
        }
    }

}
