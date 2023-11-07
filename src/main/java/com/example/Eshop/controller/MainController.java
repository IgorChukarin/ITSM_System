package com.example.Eshop.controller;

import com.example.Eshop.model.BusinessService;
import com.example.Eshop.model.TechnicalService;
import com.example.Eshop.repos.BusinessServiceRepository;
import com.example.Eshop.repos.TechnicalServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Map;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    BusinessServiceRepository businessServiceRepository;

    @Autowired
    TechnicalServiceRepository technicalServiceRepository;

    @GetMapping
    public String showTables(Model model) {
        Iterable<BusinessService> businessServices = businessServiceRepository.findAll();
        model.addAttribute("businessServices", businessServices);
        Iterable<TechnicalService> technicalServices = technicalServiceRepository.findAll();
        model.addAttribute("technicalServices", technicalServices);
        return "services";
    }

    @PostMapping("/add")
    public String addBusinessService(@RequestParam String serviceLine, @RequestParam String name, @RequestParam String workComposition, @RequestParam Integer price) {
        ArrayList<BusinessService> businessServices = (ArrayList<BusinessService>) businessServiceRepository.findAll();
        int id = businessServices.size() + 1;
        BusinessService businessService = new BusinessService(id, serviceLine, name, workComposition, price);
        businessServiceRepository.save(businessService);
        return "redirect:/";
    }

    @PostMapping("/delete")
    public String deleteBusinessService(@RequestParam Integer id) {
        businessServiceRepository.deleteById(id);
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
}
