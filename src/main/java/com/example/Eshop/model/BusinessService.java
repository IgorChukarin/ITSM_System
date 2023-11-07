package com.example.Eshop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BusinessService {

    @Id
    private int id;

    private String serviceLine;

    private String name;

    private String workComposition;

    private int price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServiceLine() {
        return serviceLine;
    }

    public void setServiceLine(String serviceLine) {
        this.serviceLine = serviceLine;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWorkComposition() {
        return workComposition;
    }

    public void setWorkComposition(String workComposition) {
        this.workComposition = workComposition;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public BusinessService() {
    }

    public BusinessService(int id, String serviceLine, String name, String workComposition, int price) {
        this.id = id;
        this.serviceLine = serviceLine;
        this.name = name;
        this.workComposition = workComposition;
        this.price = price;
    }
}
