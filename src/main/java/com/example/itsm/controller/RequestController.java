package com.example.itsm.controller;

import com.example.itsm.model.Request;
import com.example.itsm.repos.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/request")
public class RequestController {

    @Autowired
    RequestRepository requestRepository;

    @GetMapping("{requestId}")
    public String showRequestPage(@PathVariable int requestId, Model model) {
        Request request = requestRepository.findById(requestId).get();
        model.addAttribute("request", request);
        return "requestPage";
    }
}
