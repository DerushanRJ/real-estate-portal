package com.realestate.backend.service;

import com.realestate.backend.model.Agent;
import com.realestate.backend.model.Location;
import com.realestate.backend.model.Property;
import com.realestate.backend.model.PropertyType;
import com.realestate.backend.repository.AgentRepository;
import com.realestate.backend.repository.LocationRepository;
import com.realestate.backend.repository.PropertyRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyService {

    private final PropertyRepository propertyRepository;
    private final AgentRepository agentRepository;
    private final LocationRepository locationRepository;

    public PropertyService(PropertyRepository propertyRepository,
                           AgentRepository agentRepository,
                           LocationRepository locationRepository) {
        this.propertyRepository = propertyRepository;
        this.agentRepository = agentRepository;
        this.locationRepository = locationRepository;
    }

    public Property addProperty(Property property) {

        if (property.getAgent() == null || property.getAgent().getUserID() == null) {
            throw new RuntimeException("Agent is required");
        }

        Agent agent = agentRepository.findById(property.getAgent().getUserID())
                .orElseThrow(() -> new RuntimeException("Agent not found"));

        property.setAgent(agent);

        if (property.getLocation() == null) {
            throw new RuntimeException("Location is required");
        }

        Location location = property.getLocation();

        Location finalLocation;

        if (location.getId() != null) {
            finalLocation = locationRepository.findById(location.getId())
                    .orElseThrow(() -> new RuntimeException("Location not found"));
        } else {
            finalLocation = locationRepository.save(location);
        }

        property.setLocation(finalLocation);

        return propertyRepository.save(property);
    }

    public List<Property> getAllProperties() {
        return propertyRepository.findAll();
    }

    public Property getPropertyById(Long id) {
        return propertyRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Property not found"));
    }

    public List<Property> getHouses() {
        return propertyRepository.findByType(PropertyType.HOUSE);
    }

    public List<Property> getLands() {
        return propertyRepository.findByType(PropertyType.LAND);
    }

    public List<Property> getApartments() {
        return propertyRepository.findByType(PropertyType.APARTMENT);
    }

    public List<Property> searchProperties(
            PropertyType type,
            String city,
            Double minPrice,
            Double maxPrice
    ) {

        List<Property> properties = propertyRepository.findAll();

        if (type != null) {
            properties = properties.stream()
                    .filter(p -> p.getType() == type)
                    .toList();
        }

        if (city != null && !city.isEmpty()) {
            properties = properties.stream()
                    .filter(p -> p.getLocation() != null &&
                            p.getLocation().getCity().equalsIgnoreCase(city))
                    .toList();
        }

        if (minPrice != null && maxPrice != null) {
            properties = properties.stream()
                    .filter(p -> p.getPrice() >= minPrice &&
                            p.getPrice() <= maxPrice)
                    .toList();
        }

        return properties;
    }

    public Property updateProperty(Long id, Property updatedProperty) {

        Property existing = getPropertyById(id);

        existing.setTitle(updatedProperty.getTitle());
        existing.setPrice(updatedProperty.getPrice());
        existing.setDescription(updatedProperty.getDescription());
        existing.setType(updatedProperty.getType());

        if (updatedProperty.getAgent() != null &&
                updatedProperty.getAgent().getUserID() != null) {

            Agent agent = agentRepository.findById(updatedProperty.getAgent().getUserID())
                    .orElseThrow(() -> new RuntimeException("Agent not found"));

            existing.setAgent(agent);
        }

        if (updatedProperty.getLocation() != null) {

            Location loc = updatedProperty.getLocation();

            Location finalLocation;

            if (loc.getId() != null) {
                finalLocation = locationRepository.findById(loc.getId())
                        .orElseThrow(() -> new RuntimeException("Location not found"));
            } else {
                finalLocation = locationRepository.save(loc);
            }

            existing.setLocation(finalLocation);
        }

        return propertyRepository.save(existing);
    }

    public void deleteProperty(Long id) {
        propertyRepository.deleteById(id);
    }
}