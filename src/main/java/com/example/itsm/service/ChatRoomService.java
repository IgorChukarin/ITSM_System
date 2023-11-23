package com.example.itsm.service;

import org.springframework.stereotype.Service;

@Service
public class ChatRoomService {

    public String generateChatId(long senderId, int recipientId) {
        String chatId = null;
        if (senderId < recipientId) {
            chatId = senderId + "_" + recipientId;
        } else {
            chatId = recipientId + "_" + senderId;
        }
        return chatId;
    }

}
