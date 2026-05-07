package com.realestate.backend.controller;

import com.realestate.backend.model.Property;
import com.realestate.backend.model.PropertyType;
import com.realestate.backend.service.PropertyService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/properties")
@CrossOrigin
public class PropertyController {

    private final PropertyService service;

    public PropertyController(PropertyService service) {
        this.service = service;
    }

    @PostMapping
    public Property add(@RequestBody Property property) {
        return service.addProperty(property);
    }

    @GetMapping
    public List<Property> getAll() {
        return service.getAllProperties();
    }

    @GetMapping("/search")
    public List<Property> searchProperties(
            @RequestParam(required = false) PropertyType type,
            @RequestParam(required = false) String city,
            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice
    ) {
        return service.searchProperties(type, city, minPrice, maxPrice);
    }

    @PutMapping("/{id}")
    public Property update(@PathVariable Long id, @RequestBody Property property) {
        return service.updateProperty(id, property);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        service.deleteProperty(id);
    }
}