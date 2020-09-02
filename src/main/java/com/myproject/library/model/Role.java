package com.myproject.library.model;


import javax.persistence.*;

@Entity
public class Role {
    @Id
    @GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "Role_Sequence")
    @SequenceGenerator(name = "Role_Sequence", sequenceName = "ROLE_SEQ")
    private Long id;
    @Column
    private String name;

    public Role() {
    }
    public Role(long id,String name) {
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
