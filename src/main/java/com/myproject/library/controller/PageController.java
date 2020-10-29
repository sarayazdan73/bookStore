package com.myproject.library.controller;

import com.google.gson.GsonBuilder;

import com.myproject.library.service.library.LibraryService;
import com.myproject.library.service.role.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@RequestMapping("/data")
    @Controller
    public class PageController {
        @Autowired
        LibraryService libraryService;
        @Autowired
        RoleService roleService;
        @RequestMapping(method = RequestMethod.GET,value = "book")
        public String getbookData(ModelMap modelMap,HttpServletRequest request) {

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
        @RequestMapping(method = RequestMethod.GET,value = "cart")
    public String testMestod(ModelMap modelMap,HttpServletRequest request){
        List<Long> idList = (List<Long>) request.getSession().getAttribute("id");
        List<Integer> numbers = (List<Integer>) request.getSession().getAttribute("number");
        modelMap.addAttribute("ids",idList);
        modelMap.addAttribute("numbers",numbers);
        return "cart";
    }



    }

