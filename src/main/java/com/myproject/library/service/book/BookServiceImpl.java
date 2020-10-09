package com.myproject.library.service.book;


import com.myproject.library.model.Book;
import com.myproject.library.model.ImageStorage;
import com.myproject.library.model.Library;
import com.myproject.library.model.User;
import com.myproject.library.repository.BookRepository;
import com.myproject.library.repository.ImageStorageRepository;
import com.myproject.library.repository.LibraryRepository;
import com.myproject.library.repository.UserRepository;
import com.myproject.library.service.dto.BookDto;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LibraryRepository libraryRepository;

    @Autowired
    private ImageStorageRepository imageStorageRepository;

    @Transactional
    public List<Book> getAllBooks(){

        List<Book> books = bookRepository.findAll();

        return books;
    }


    @Override
    public void deleteBook(long id) {
        Optional<Book> BookDb = this.bookRepository.findById(id);

        if (BookDb.isPresent()) {
            this.bookRepository.delete(BookDb.get());
        } else {
            throw new ResourceNotFoundException("Record not found with id : " + id);
        }
    }

    @Override
    public void uploadbookdata(BookDto book) throws IOException {
        Path filepath = Paths.get("D:/pic", book.getImageStorage().getOriginalFilename());
        book.getImageStorage().transferTo(filepath);
        ImageStorage imageStorage = new ImageStorage();
        imageStorage.setFileDir("D:/pic");
        imageStorage.setFileName(book.getImageStorage().getOriginalFilename());
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {

            username = principal.toString();
        }
        User user = userRepository.findUserByUserName(username);
        imageStorage.setUser(user);
        ImageStorage imageS = imageStorageRepository.saveAndFlush(imageStorage);
        Book book1=new Book();
        book1.setCount(book.getCount());
        book1.setName(book.getName());
        book1.setNameWriter(book.getNameWriter());
        book1.setPrice(book.getPrice());
        Library library=new Library();
        Library library1 = libraryRepository.findLibraryByName(book.getLibrary());
        library.setId(library1.getId());
        book1.setLibrary(library);
        book1.setImageStorage(imageS);
        bookRepository.save(book1);

    }

    @Override
    public List<Book> getsbook(String x) {
        List<Book> books =bookRepository.findByNameContaining(x);
        return books;
    }

    @Override
    public List<Book> getbookid(List<Long> id) {
        List<Book> books = bookRepository.findByIdIn(id);
        return books;
    }


}

