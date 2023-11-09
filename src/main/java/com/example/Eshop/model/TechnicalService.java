package com.example.Eshop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TechnicalService {

    @Id
    private int id;

    private String serviceLine;

    private String name;

    private String auxiliaryElement;

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

    public String getAuxiliaryElement() {
        return auxiliaryElement;
    }

    public void setAuxiliaryElement(String auxiliaryElement) {
        this.auxiliaryElement = auxiliaryElement;
    }


    public TechnicalService() {
    }

    public TechnicalService(int id, String serviceLine, String name, String auxiliaryElement) {
        this.id = id;
        this.serviceLine = serviceLine;
        this.name = name;
        this.auxiliaryElement = auxiliaryElement;
    }
}
