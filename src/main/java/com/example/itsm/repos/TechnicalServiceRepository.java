package com.example.itsm.repos;

import com.example.itsm.model.TechnicalService;
import org.springframework.data.repository.CrudRepository;

public interface TechnicalServiceRepository extends CrudRepository<TechnicalService, Integer> {
    Iterable<TechnicalService> findAllByOrderById();
}
