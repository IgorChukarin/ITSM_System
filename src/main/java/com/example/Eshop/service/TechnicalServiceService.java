package com.example.Eshop.service;

import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@Service
public class TechnicalServiceService {

    public void updateIndexOrder(int id) {
        String url = "jdbc:mysql://localhost:3306/eshop?useUnicode=true&serverTimezone=UTC";
        String username = "root";
        String password = "Sendy260108";
        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            Statement statement = connection.createStatement();
            String sql = "UPDATE technical_service SET id = id - 1 WHERE id > " + id;
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
