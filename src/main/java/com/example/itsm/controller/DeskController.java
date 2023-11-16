package com.example.itsm.controller;

import com.example.itsm.model.Request;
import com.example.itsm.model.RequestStatus;
import com.example.itsm.model.User;
import com.example.itsm.repos.RequestRepository;
import com.example.itsm.repos.UserRepository;
import jdk.net.SocketFlow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/desk")
public class DeskController {

    @Autowired
    RequestRepository requestRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping
    public String showDesk(Model model) {
        Iterable<Request> requests = requestRepository.findAll();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        model.addAttribute("username", username);
        model.addAttribute("requests", requests);
        return "desk";
    }

    @PostMapping
    public String assignContractor(@RequestParam int requestId) {
        System.out.println(requestId);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User user = userRepository.findByUsername(username);
        Request request = requestRepository.findById(requestId).get();
        request.setContractor(user);
        request.setStatus(RequestStatus.IN_PROGRESS);
        requestRepository.save(request);
        return "redirect:/desk";
    }

    @PostMapping("/complete")
    public String completeTask(@RequestParam int requestId) {
        Request request = requestRepository.findById(requestId).get();
        request.setStatus(RequestStatus.COMPLETED);
        requestRepository.save(request);
        return "redirect:/desk";
    }
}
