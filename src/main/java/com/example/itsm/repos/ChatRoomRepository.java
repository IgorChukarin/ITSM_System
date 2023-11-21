package com.example.itsm.repos;

import com.example.itsm.model.ChatRoom;
import com.example.itsm.model.TechnicalService;
import com.example.itsm.model.User;
import org.springframework.data.repository.CrudRepository;

import javax.persistence.criteria.CriteriaBuilder;

public interface ChatRoomRepository extends CrudRepository<ChatRoom, String> {
    Iterable<ChatRoom> findAllBySender(User sender);
}
