package com.myproject.library.service.book;


import com.myproject.library.model.Book;
import com.myproject.library.service.dto.BookDto;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface BookService {
    List<Book> getAllBooks();
    void deleteBook(long id);
    void uploadbookdata(BookDto book) throws IOException;
    List<Book> getsbook(String x);
    List<Book> getbookid(List<Long> id);
    List<Integer> getSum(List<Long> id,List<Integer> number);
    void getMoney(int sum,List<Long> id,List<Integer> number);

}
