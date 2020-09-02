package com.myproject.library.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.myproject.library.model.Book;
import com.myproject.library.service.book.BookService;
import com.myproject.library.service.dto.BookDto;
import com.myproject.library.service.imageStorage.ImageStorageService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@RequestMapping("/book")
@RestController
public class BookController {
    @Autowired
    ImageStorageService imageStorageService;
    @Autowired
    BookService bookService;
    @Autowired
    Gson gson;
    @GetMapping(path = "books")
    public String getbooks(){
        List<Book> books = bookService.getAllBooks();
        return  new GsonBuilder().create().toJson(books);
    }
    @DeleteMapping("/books/{id}")
    public HttpStatus deleteBook(@PathVariable long id) {
        this.bookService.deleteBook(id);
        return HttpStatus.OK;
    }
    @PostMapping(path ="/addbookimage")
    public String addbookimage(BookDto book){
        try {
            bookService.uploadbookdata(book);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "succes";
    }

    @GetMapping(
            value = "img/{id}",
            produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
    )
    public @ResponseBody byte[] getFile(@PathVariable("id")long id) throws IOException {
        String path= imageStorageService.downloadFile(id);
        File initialFile = new File(path);
        InputStream in = new FileInputStream(initialFile);
        return IOUtils.toByteArray(in);
    }



}
