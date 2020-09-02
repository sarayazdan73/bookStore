package com.myproject.library.model;


import javax.persistence.*;

@Entity
public class ImageStorage {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator ="ImageStorage_Sequence")
    @SequenceGenerator(name = "ImageStorage_Sequence", sequenceName = "ImageStorage_Sequence")
    long id;
    @Column
    String fileName;
    @Column
    String fileDir;
    @ManyToOne
    User user;

    public ImageStorage() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileDir() {
        return fileDir;
    }

    public void setFileDir(String fileDir) {
        this.fileDir = fileDir;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

