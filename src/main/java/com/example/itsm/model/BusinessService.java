package com.example.itsm.model;

import javax.persistence.*;
import java.util.Set;

@Entity
public class BusinessService {

    @Id
    private int id;

    private String serviceLine;

    private String name;

    private String workComposition;

    private int price;

    @ManyToMany
    @OrderBy
    private Set<TechnicalService> relatedTechnicalServices;


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

    public Set<TechnicalService> getRelatedTechnicalServices() {
        return relatedTechnicalServices;
    }

    public void setRelatedTechnicalServices(Set<TechnicalService> relatedTechnicalServices) {
        this.relatedTechnicalServices = relatedTechnicalServices;
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
