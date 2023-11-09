package com.example.Eshop.controller;

import com.example.Eshop.model.BusinessService;
import com.example.Eshop.model.TechnicalService;
import com.example.Eshop.repos.BusinessServiceRepository;
import com.example.Eshop.repos.TechnicalServiceRepository;
import com.example.Eshop.service.BusinessServiceService;
import com.example.Eshop.service.TechnicalServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    BusinessServiceRepository businessServiceRepository;

    @Autowired
    TechnicalServiceRepository technicalServiceRepository;

    @Autowired
    BusinessServiceService businessServiceService;

    @Autowired
    TechnicalServiceService technicalServiceService;

    @GetMapping
    public String showTables(Model model) {
        Iterable<BusinessService> businessServices = businessServiceRepository.findAllByOrderById();
        model.addAttribute("businessServices", businessServices);
        Iterable<TechnicalService> technicalServices = technicalServiceRepository.findAllByOrderById();
        model.addAttribute("technicalServices", technicalServices);
        return "services";
    }

    @PostMapping("/add")
    public String addBusinessService(@RequestParam String serviceLine, @RequestParam String name, @RequestParam String workComposition, @RequestParam Integer price) {
        businessServiceService.add(businessServiceRepository, serviceLine, name, workComposition, price);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String deleteBusinessService(@RequestParam Integer id) {
        businessServiceService.delete(businessServiceRepository, id);
        return "redirect:/";
    }

    @PostMapping("/update")
    public String updateBusinessService(@RequestParam Integer id, @RequestParam String serviceLine, @RequestParam String name, @RequestParam String workComposition, @RequestParam Integer price) {
        BusinessService businessService = businessServiceRepository.findById(id).get();
        if (!serviceLine.equals("")) {
            businessService.setServiceLine(serviceLine);
        }
        if (!name.equals("")) {
            businessService.setName(name);
        }
        if (!workComposition.equals("")) {
            businessService.setWorkComposition(workComposition);
        }
        if (!(price == null)) {
            businessService.setPrice(price);
        }
        businessServiceRepository.save(businessService);
        return "redirect:/";
    }




    @PostMapping("/addTechnicalService")
    public String addTechnicalService(@RequestParam String serviceLine, @RequestParam String name, @RequestParam String auxiliaryElement) {
        ArrayList<TechnicalService> technicalServices = (ArrayList<TechnicalService>) technicalServiceRepository.findAll();
        int id = technicalServices.size() + 1;
        TechnicalService technicalService = new TechnicalService(id, serviceLine, name, auxiliaryElement);
        technicalServiceRepository.save(technicalService);
        return "redirect:/";
    }

    @PostMapping("/deleteTechnicalService")
    public String deleteTechnicalService(@RequestParam int id) {
        technicalServiceRepository.deleteById(id);
        technicalServiceService.updateIndexOrder(id);
        return "redirect:/";
    }

    @PostMapping("/updateTechnicalService")
    public String updateTechnicalService(@RequestParam Integer id, @RequestParam String serviceLine, @RequestParam String name, @RequestParam String auxiliaryElements) {
        TechnicalService technicalService = technicalServiceRepository.findById(id).get();
        if (!serviceLine.equals("")) {
            technicalService.setServiceLine(serviceLine);
        }
        if (!name.equals("")) {
            technicalService.setName(name);
        }
        if (!auxiliaryElements.equals("")) {
            technicalService.setAuxiliaryElement(auxiliaryElements);
        }
        technicalServiceRepository.save(technicalService);
        return "redirect:/";
    }
}