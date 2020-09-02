package com.myproject.library.model;


import javax.persistence.*;

@Entity
public class Library {
    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "library_Sequence")
    @SequenceGenerator(name = "library_Sequence", sequenceName = "LIBRARY_SEQ")
    private Long id;
    @Column
    private String name;

    public Library() {
    }
    public Library(long id,String name) {
        this.id=id;
        this.name=name;
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
}
