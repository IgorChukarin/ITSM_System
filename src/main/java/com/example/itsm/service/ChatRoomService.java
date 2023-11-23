package com.example.itsm.service;

import com.example.itsm.model.User;
import com.example.itsm.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatRoomService {

    @Autowired
    UserRepository userRepository;

    public String generateChatId(long senderId, int recipientId) {
        String chatId = null;
        if (senderId < recipientId) {
            chatId = senderId + "_" + recipientId;
        } else {
            chatId = recipientId + "_" + senderId;
        }
        return chatId;
    }

    public User findRecipient(String chatId, User sender) {
        Long senderId = sender.getId();
        int firstIdFromChatId = Integer.parseInt(chatId.substring(0, chatId.indexOf("_")));
        int secondIdFromChatId = Integer.parseInt(chatId.substring(chatId.indexOf("_") + 1));
        Long recipientId = 0L;
        if (firstIdFromChatId == senderId) {
            recipientId = (long) secondIdFromChatId;
        } else {
            recipientId = (long) firstIdFromChatId;
        }
        User recipient = userRepository.findById(recipientId).get();
        return recipient;
    }

}
