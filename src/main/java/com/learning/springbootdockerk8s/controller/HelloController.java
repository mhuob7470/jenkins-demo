package com.learning.springbootdockerk8s.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class HelloController {

    @GetMapping("/test")
    public String test(){
        return "test";
    }
    @GetMapping("/test2")
    public String test2(){
        return "test";
    }

}
