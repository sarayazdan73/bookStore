package com.myproject.library.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.myproject.library.model.Library;
import com.myproject.library.service.library.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/library")
@RestController
public class LibrarryController {
    @Autowired
    LibraryService libraryService;
    @Autowired
    Gson gson;

    @GetMapping(path = "libraries")
    public String getlibraries(){
        List<Library> libraries = libraryService.getAllLibrary();

        return  new GsonBuilder().create().toJson(libraries);
    }
    @PostMapping(path="addlibrary")
    public String addlibrariy(@ModelAttribute Library libraryName){
        Library li=libraryService.addLibrary(libraryName);
        return new GsonBuilder().create().toJson(li);
    }
    @DeleteMapping("/libraries/{id}")
    public HttpStatus deleteLibrary(@PathVariable long id) {
        this.libraryService.deleteLibrary(id);
        return HttpStatus.OK;
    }

}
