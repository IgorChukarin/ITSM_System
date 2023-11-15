package com.example.itsm.controller;

import com.example.itsm.model.Request;
import com.example.itsm.repos.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/desk")
public class DeskController {

    @Autowired
    RequestRepository requestRepository;

    @GetMapping
    public String showDesk(Model model) {
        Iterable<Request> requests = requestRepository.findAll();
        model.addAttribute("requests", requests);
        return "desk";
    }
}
