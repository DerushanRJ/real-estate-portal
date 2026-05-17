package com.realestate.realestateportal.model;

public class Property extends BaseEntity {

    private String title;
    private String description;
    private double price;
    private String type; // e.g., Apartment, Villa, Land
    private String location;
    private String sellerId; // ID of the User who owns this property

    public Property(String id, String title, String description, double price, String type, String location, String sellerId) {
        super(id);
        this.title = title;
        this.description = description;
        this.price = price;
        this.type = type;
        this.location = location;
        this.sellerId = sellerId;
    }

    // Getters
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }
    public String getType() { return type; }
    public String getLocation() { return location; }
    public String getSellerId() { return sellerId; }

    // Setters
    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) { this.description = description; }
    public void setPrice(double price) { this.price = price; }
    public void setType(String type) { this.type = type; }
    public void setLocation(String location) { this.location = location; }
    public void setSellerId(String sellerId) { this.sellerId = sellerId; }

    @Override
    public String toFileString() {
        return getId() + "|" + title + "|" + description + "|" + price + "|" + type + "|" + location + "|" + sellerId;
    }

    public static Property fromFileString(String line) {
        String[] parts = line.split("\\|");
        return new Property(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]), parts[4], parts[5], parts[6]);
    }
}
