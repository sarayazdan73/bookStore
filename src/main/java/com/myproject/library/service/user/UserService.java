package com.myproject.library.service.user;

import com.myproject.library.model.User;

import java.util.List;

public interface UserService {
    public List<User> getAllUsers();
    public void adduser(User user);
}
