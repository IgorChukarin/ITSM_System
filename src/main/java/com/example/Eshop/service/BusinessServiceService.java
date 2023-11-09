package com.example.Eshop.service;

import com.example.Eshop.model.BusinessService;
import com.example.Eshop.repos.BusinessServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

@Service
public class BusinessServiceService {


    public void updateIndexOrder(int id) {
        String url = "jdbc:mysql://localhost:3306/eshop?useUnicode=true&serverTimezone=UTC";
        String username = "root";
        String password = "Sendy260108";
        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            Statement statement = connection.createStatement();
            String sql = "UPDATE business_service SET id = id - 1 WHERE id > " + id;
            statement.executeUpdate(sql);
            System.out.println("Order index updated successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void add(BusinessServiceRepository businessServiceRepository, String serviceLine, String name, String workComposition, int price) {
        ArrayList<BusinessService> businessServices = (ArrayList<BusinessService>) businessServiceRepository.findAll();
        int id = businessServices.size() + 1;
        BusinessService businessService = new BusinessService(id, serviceLine, name, workComposition, price);
        businessServiceRepository.save(businessService);
    }


    public void delete(BusinessServiceRepository businessServiceRepository, int id) {
        businessServiceRepository.deleteById(id);
        new BusinessServiceService().updateIndexOrder(id);
    }
}
