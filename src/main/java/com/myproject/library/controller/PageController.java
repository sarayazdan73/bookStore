package com.myproject.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


    @RequestMapping("/data")
    @Controller
    public class PageController {

        @RequestMapping(method = RequestMethod.GET,value = "book")
        public String getbookData() {
            return "book";
        }
        @RequestMapping(method = RequestMethod.GET,value = "library")
        public String getlibraryPage() {
            return "library";
        }
        @RequestMapping(method = RequestMethod.GET,value = "user")
        public String getuserPage() {
            return "user";
        }

    }

