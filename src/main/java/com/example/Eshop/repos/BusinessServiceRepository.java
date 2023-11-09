package com.example.Eshop.repos;

import com.example.Eshop.model.BusinessService;
import org.springframework.data.repository.CrudRepository;

public interface BusinessServiceRepository extends CrudRepository<BusinessService, Integer> {
    Iterable<BusinessService> findAllByOrderById();
}
