package com.myproject.library.service.book;


import com.myproject.library.model.Book;
import com.myproject.library.service.dto.BookDto;

import java.io.IOException;
import java.util.List;

public interface BookService {
    List<Book> getAllBooks();
    void deleteBook(long id);
    void uploadbookdata(BookDto book) throws IOException;
    List<Book> getsbook(String x);

}
