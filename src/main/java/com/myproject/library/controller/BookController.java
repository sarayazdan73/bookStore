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

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
    @GetMapping(path = "bookSearch/{x}")
    public String getBookx(@PathVariable String x){
        List<Book> books = bookService.getsbook(x);
        return  new  GsonBuilder().create().toJson(books);
    }

    @PostMapping(path ="/addcart/{id}/{number}")
    public String addcart(@PathVariable  long id,@PathVariable int number, HttpServletRequest request){
        List<Long> ids = (List<Long>) request.getSession().getAttribute("id");
        List<Integer> numbers = (List<Integer>) request.getSession().getAttribute("number");
        if (ids == null) {
            ids = new ArrayList<>();
            numbers = new ArrayList<>();
            request.getSession().setAttribute("id", ids);
            request.getSession().setAttribute("number", numbers);
        }
        ids.add(id);
        numbers.add(number);
        request.getSession().setAttribute("id", ids);
        request.getSession().setAttribute("number", numbers);
        return "succes";
    }

    @GetMapping(path = "bookid/{id}")
    public String getBookx(@PathVariable List<Long> id){
        List<Book> books = bookService.getbookid(id);
        return  new  GsonBuilder().create().toJson(books);
    }
    @GetMapping(path = "sum/{id}/{number}")
    public  List<Integer> getSum(@PathVariable List<Long> id,@PathVariable List<Integer> number){
        List<Integer> sum=bookService.getSum(id,number);
      return sum;
    }

    @GetMapping(path = "shopping/{mysum}/{id}/{number}")
    public String shop(@PathVariable int mysum,@PathVariable List<Long> id,@PathVariable List<Integer> number){
        bookService.getMoney(mysum,id,number);
        return "Success";
    }

}
