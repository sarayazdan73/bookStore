package com.myproject.library.service.dto;

import org.springframework.web.multipart.MultipartFile;

public class BookDto {

    String name;
    int price;
    int count;
    String nameWriter;
    long library;
    MultipartFile imageStorage;


    public BookDto(String name, int price, int count, long library, MultipartFile imageStorage, String nameWriter) {
        this.name = name;
        this.price = price;
        this.count = count;
        this.library = library;
        this.imageStorage = imageStorage;
        this.nameWriter = nameWriter;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public long getLibrary() {
        return library;
    }

    public void setLibrary(long library) {
        this.library = library;
    }

    public MultipartFile getImageStorage() {
        return imageStorage;
    }

    public void setImageStorage(MultipartFile imageStorage) {
        this.imageStorage = imageStorage;
    }

    public String getNameWriter() {
        return nameWriter;
    }

    public void setNameWriter(String nameWriter) {
        this.nameWriter = nameWriter;
    }
}
