package com.myproject.library.controller;

import com.google.gson.Gson;
import com.myproject.library.model.User;
import com.myproject.library.service.dto.BookDto;
import com.myproject.library.service.dto.UserDto;
import com.myproject.library.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RequestMapping("/user")
@RestController
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    Gson gson;

    @GetMapping(path = "users")
    public String getusers(){
        List<User> users = userService.getAllUsers();

        return  gson.toJson(users);
    }
    @PostMapping(path="adduser")
    public String adduser(@ModelAttribute User user){
        userService.adduser(user);
        return "success";
    }

    @PostMapping(path="addusers")
    public String addusers(UserDto user){

        try {
            userService.addusers(user);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "succes";
    }

    @DeleteMapping("/users/{id}")
    public HttpStatus deleteUser(@PathVariable long id) {
        this.userService.deleteUser(id);
        return HttpStatus.OK;
    }

}
