package com.realestate.realestateportal.filehandler;

import com.realestate.realestateportal.model.ContactMessage;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ContactMessageFileHandler implements FileHandler<ContactMessage> {

    private static final String FILE_PATH = "data/contact_messages.txt";

    @Override
    public void save(ContactMessage message) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(message.toFileString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ContactMessage findById(String id) {
        for (ContactMessage message : findAll()) {
            if (message.getId().equals(id)) {
                return message;
            }
        }
        return null;
    }

    @Override
    public List<ContactMessage> findAll() {
        List<ContactMessage> messages = new ArrayList<>();

        File file = new File(FILE_PATH);
        if (!file.exists()) {
            return messages;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                messages.add(ContactMessage.fromFileString(line));
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return messages;
    }

    @Override
    public void update(ContactMessage entity) {
    }

    @Override
    public void delete(String id) {
    }
}