package com.realestate.backend.repository;

import com.realestate.backend.model.Property;
import com.realestate.backend.model.PropertyType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PropertyRepository extends JpaRepository<Property, Long>
{
    List<Property> findByType(PropertyType type);

    List<Property> findByLocation_City(String city);

    List<Property> findByPriceBetween(double minPrice, double maxPrice);

    List<Property> findByTypeAndPriceBetween(PropertyType type, double min, double max);

}
