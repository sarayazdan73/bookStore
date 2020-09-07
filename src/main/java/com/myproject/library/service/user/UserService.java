package com.myproject.library.service.user;

import com.myproject.library.model.User;
import com.myproject.library.service.dto.BookDto;
import com.myproject.library.service.dto.UserDto;

import java.io.IOException;
import java.util.List;

public interface UserService {
    public List<User> getAllUsers();
    void deleteUser(long id);
    public void adduser(User user);
    public void addusers(UserDto user)throws IOException;
}
