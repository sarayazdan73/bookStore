package com.myproject.library.service.library;

import com.myproject.library.model.Library;

import java.util.List;

public interface LibraryService {
    public List<Library> getAllLibrary();
    public Library addLibrary(Library libraryName);
    void deleteLibrary(long id);
}
