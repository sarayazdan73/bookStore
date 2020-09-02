package com.myproject.library.model;

import javax.persistence.*;
@Entity
@Table(name = "myusers")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_Sequence")
    @SequenceGenerator(name = "user_Sequence", sequenceName = "USER_SEQ")
    private Long id;
    @Column()
    private String name;
    @Column( unique = true, nullable = false)
    private String userName;
    @Column( unique = true, nullable = false)
    private String password;
    @ManyToOne(fetch = FetchType.EAGER)
    private Role role;

    public User() {
    }

    public User(long id, String name, String lastName, int code, String userName, String password, Role role) {
        this.id = id;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.role = role;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}

