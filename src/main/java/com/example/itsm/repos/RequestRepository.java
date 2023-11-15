package com.example.itsm.repos;

import com.example.itsm.model.Request;
import org.springframework.data.repository.CrudRepository;

import javax.persistence.criteria.CriteriaBuilder;

public interface RequestRepository extends CrudRepository<Request, Integer> {
}
