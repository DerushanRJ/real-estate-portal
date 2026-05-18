package com.realestate.realestateportal.model;

public class ContactMessage extends BaseEntity {

    private String name;
    private String email;
    private String subject;
    private String message;

    public ContactMessage(String id, String name, String email, String subject, String message) {
        super(id);
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toFileString() {
        return getId() + "|" + name + "|" + email + "|" + subject + "|" + message;
    }

    public static ContactMessage fromFileString(String line) {
        String[] parts = line.split("\\|");
        return new ContactMessage(parts[0], parts[1], parts[2], parts[3], parts[4]);
    }
}