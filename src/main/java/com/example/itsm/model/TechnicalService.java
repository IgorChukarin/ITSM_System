package com.example.itsm.model;

import javax.persistence.*;

@Entity
public class TechnicalService implements Comparable<TechnicalService>{

    @Id
    private int id;

    private String serviceLine;

    private String name;

    private String auxiliaryElement;

    @ManyToOne
    @JoinColumn(name = "businessService_id")
    private BusinessService businessService;

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

    @Override
    public int compareTo(TechnicalService o) {
        return Integer.compare(o.id, this.id);
    }
}
