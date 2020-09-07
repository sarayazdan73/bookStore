package com.myproject.library.controller;

import com.google.gson.GsonBuilder;

import com.myproject.library.service.library.LibraryService;
import com.myproject.library.service.role.RoleService;
import com.myproject.library.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


    @RequestMapping("/data")
    @Controller
    public class PageController {
        @Autowired
        LibraryService libraryService;
        @Autowired
        RoleService roleService;
        @RequestMapping(method = RequestMethod.GET,value = "book")
        public String getbookData(ModelMap modelMap) {
            modelMap.addAttribute("libraries",new GsonBuilder().create().toJson(libraryService.getAllLibrary()));
            return "book";
        }
        @RequestMapping(method = RequestMethod.GET,value = "library")
        public String getlibraryPage() {
            return "library";
        }
        @RequestMapping(method = RequestMethod.GET,value = "user")
        public String getuserPage(ModelMap modelMap) {
            modelMap.addAttribute("roles",new GsonBuilder().create().toJson(roleService.getAllRoles()));
            return "user";
        }

    }

