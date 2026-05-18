package com.realestate.realestateportal.service;

import com.realestate.realestateportal.filehandler.ContactMessageFileHandler;
import com.realestate.realestateportal.model.ContactMessage;

import java.util.List;
import java.util.UUID;

public class ContactService {

    private final ContactMessageFileHandler fileHandler = new ContactMessageFileHandler();

    public void saveMessage(String name, String email, String subject, String message) {

        ContactMessage contactMessage = new ContactMessage(
                UUID.randomUUID().toString(),
                name,
                email,
                subject,
                message
        );

        fileHandler.save(contactMessage);
    }

    public List<ContactMessage> getAllMessages() {
        return fileHandler.findAll();
    }
}