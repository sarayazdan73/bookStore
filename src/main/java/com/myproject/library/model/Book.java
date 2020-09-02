package com.myproject.library.model;

import javax.persistence.*;

@Entity
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "book_Sequence")
    @SequenceGenerator(name = "book_Sequence", sequenceName = "BOOK_SEQ")
    private Long id;
    @Column
    private String name;
    @Column
    private int price;
    @Column
    private int count;
    @Column
    private String nameWriter;
    @ManyToOne(fetch = FetchType.EAGER)
    private Library library;
    @OneToOne(fetch = FetchType.EAGER)
    private ImageStorage imageStorage;

    public Book(){

    }
    public Book(long id,String name,int price,int count,String img,String nameWriter, Library library) {
        this.id=id;
        this.name = name;
        this.price = price;
        this.count = count;
        this.imageStorage = imageStorage;
        this.nameWriter = nameWriter;
        this.library = library;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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


    public String getNameWriter() {
        return nameWriter;
    }

    public void setNameWriter(String nameWriter) {
        this.nameWriter = nameWriter;
    }


    public Library getLibrary() {
        return library;
    }

    public void setLibrary(Library library) {
        this.library = library;
    }

    public ImageStorage getImageStorage() {
        return imageStorage;
    }

    public void setImageStorage(ImageStorage imageStorage) {
        this.imageStorage = imageStorage;
    }
}
