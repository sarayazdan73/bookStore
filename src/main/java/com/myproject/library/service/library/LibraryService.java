package com.myproject.library.service.library;

import com.myproject.library.model.Library;

import java.util.List;

public interface LibraryService {
    public List<Library> getAllLibrary();
    public Library getLibrarybyname(String name);
    public Library addLibrary(Library library);
    void deleteLibrary(long id);
}
