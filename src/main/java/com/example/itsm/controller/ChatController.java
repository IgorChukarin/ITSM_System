package com.example.itsm.controller;


import com.example.itsm.model.ChatRoom;
import com.example.itsm.model.User;
import com.example.itsm.repos.ChatRoomRepository;
import com.example.itsm.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    ChatRoomRepository chatRoomRepository;

    @GetMapping
    public String showChat(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User currentUser = userRepository.findByUsername(username);


        ArrayList<User> users = (ArrayList<User>) userRepository.findAll();
        users.remove(currentUser);
        model.addAttribute("users", users);


        Iterable<ChatRoom> userChats = chatRoomRepository.findAllBySender(currentUser);
        model.addAttribute("userChats", userChats);
        return "chatPage";
    }

    @PostMapping("/startChat")
    public String startChat(@RequestParam int recipientId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User currentUser = userRepository.findByUsername(username);

        User recipient = userRepository.findById((long) recipientId).get();
        String chatId = currentUser.getId() + "_" + recipientId;

        ChatRoom chatRoom = new ChatRoom();
        chatRoom.setSender(currentUser);
        chatRoom.setRecipient(recipient);
        chatRoom.setChatId(chatId);
        chatRoomRepository.save(chatRoom);

        ChatRoom chatRoomReversed = new ChatRoom();
        chatRoomReversed.setSender(recipient);
        chatRoomReversed.setRecipient(currentUser);
        chatRoomReversed.setChatId(chatId);
        chatRoomRepository.save(chatRoomReversed);
        return "redirect:/chat";
    }
}
