package com.example.itsm.repos;

import com.example.itsm.model.ChatMessage;
import org.springframework.data.repository.CrudRepository;

public interface ChatMessageRepository extends CrudRepository<ChatMessage, Integer> {
}
