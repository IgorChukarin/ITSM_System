package com.example.itsm.controller;


import com.example.itsm.model.ChatRoom;
import com.example.itsm.model.User;
import com.example.itsm.repos.ChatRoomRepository;
import com.example.itsm.repos.UserRepository;
import com.example.itsm.service.ChatRoomService;
import com.example.itsm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    UserService userService;

    @Autowired
    ChatRoomService chatRoomService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ChatRoomRepository chatRoomRepository;

    @GetMapping
    public String showChatListPage(Model model) {
        User currentUser = userService.getCurrentUser();
        ArrayList<User> users = (ArrayList<User>) userRepository.findAll();
        users.remove(currentUser);
        Iterable<ChatRoom> userChats = chatRoomRepository.findAllBySender(currentUser);
        model.addAttribute("users", users);
        model.addAttribute("userChats", userChats);
        return "chat";
    }

    @PostMapping("/startChat")
    public String createChat(@RequestParam int recipientId) {
        User currentUser = userService.getCurrentUser();
        User recipient = userRepository.findById((long) recipientId).get();
        String chatId = chatRoomService.generateChatId(currentUser.getId(), recipientId);
        if (chatRoomRepository.existsByChatId(chatId)) {
            return "redirect:/chat";
        }

        ChatRoom currentUserChatRoom = new ChatRoom();
        currentUserChatRoom.setSender(currentUser);
        currentUserChatRoom.setRecipient(recipient);
        currentUserChatRoom.setChatId(chatId);
        chatRoomRepository.save(currentUserChatRoom);

        ChatRoom recipientChatRoom = new ChatRoom();
        recipientChatRoom.setSender(recipient);
        recipientChatRoom.setRecipient(currentUser);
        recipientChatRoom.setChatId(chatId);
        chatRoomRepository.save(recipientChatRoom);
        return "redirect:/chat";
    }

    @GetMapping("{chatId}")
    public String showChat(@PathVariable String chatId, Model model) {
        User currentUser = userService.getCurrentUser();
        ArrayList<User> users = (ArrayList<User>) userRepository.findAll();
        users.remove(currentUser);
        Iterable<ChatRoom> userChats = chatRoomRepository.findAllBySender(currentUser);
        model.addAttribute("users", users);
        model.addAttribute("userChats", userChats);
        model.addAttribute("curChatId", chatId);
        return "chat";
    }

    @PostMapping("{chatId}/sendMessage")
    public String sendMessage() {
        System.out.println("sent");
        return "redirect:/chat/{chatId}";
    }
}
