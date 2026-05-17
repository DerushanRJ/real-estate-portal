package com.realestate.realestateportal.service;

import com.realestate.realestateportal.filehandler.PropertyFileHandler;
import com.realestate.realestateportal.model.Property;

import java.util.List;
import java.util.UUID;

public class PropertyService {

    private PropertyFileHandler fileHandler = new PropertyFileHandler();

    public void addProperty(String title, String description, double price, String type, String location, String sellerId) {
        String id = UUID.randomUUID().toString().substring(0, 8);
        Property property = new Property(id, title, description, price, type, location, sellerId);
        fileHandler.save(property);
    }

    public List<Property> getPropertiesBySeller(String sellerId) {
        return fileHandler.findBySellerId(sellerId);
    }

    public Property getPropertyById(String id) {
        return fileHandler.findById(id);
    }

    public void updateProperty(String id, String title, String description, double price, String type, String location, String sellerId) {
        Property property = new Property(id, title, description, price, type, location, sellerId);
        fileHandler.update(property);
    }

    public void deleteProperty(String id) {
        fileHandler.delete(id);
    }

    public List<Property> getAllProperties() {
        return fileHandler.findAll();
    }
}
