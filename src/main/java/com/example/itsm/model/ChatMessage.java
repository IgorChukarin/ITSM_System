package com.example.itsm.model;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String chatId;

    @ManyToOne
    private User sender;
    @ManyToOne
    private User recipient;

    private String senderName;
    private String recipientName;
    private String content;
    private LocalDateTime timestamp;

    public ChatMessage(String name) {
        this.content = name;
    }
}
