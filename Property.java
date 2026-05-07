package com.realestate.backend.model;

import jakarta.persistence.*;

@Entity
public class Property {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String propertyID;
    private String title;
    private double price;

    @Enumerated(EnumType.STRING)
    private PropertyType type;

    private String description;

    @ManyToOne
    @JoinColumn(name = "agent_id")
    private Agent agent;

    @ManyToOne
    @JoinColumn(name = "location_id")
    private Location location;

    public Property() {}

    public Property(String propertyID, String title, double price, PropertyType type,
                    String description, Location location, Agent agent)
    {
        this.propertyID = propertyID;
        this.title = title;
        this.price = price;
        this.type = type;
        this.description = description;
        this.location = location;
        this.agent = agent;
    }

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    public String getPropertyID() {
        return propertyID;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public PropertyType getType() {
        return type;
    }

    public void setType(PropertyType type) {
        this.type = type;
    }
}