package com.example.itsm.repos;

import com.example.itsm.model.BusinessService;
import org.springframework.data.repository.CrudRepository;

public interface BusinessServiceRepository extends CrudRepository<BusinessService, Integer> {
    Iterable<BusinessService> findAllByOrderById();
}
