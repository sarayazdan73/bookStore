package com.myproject.library.controller;

import com.google.gson.Gson;
import com.myproject.library.model.User;
import com.myproject.library.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

}
