package com.example.Eshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/website")
public class ClientFormController {

    @GetMapping
    public String showClientForm() {
        return "clientForm";
    }

    @PostMapping
    public String sendApplication() {
        return "clientForm";
    }
}
