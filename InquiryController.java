package com.realestate.backend.controller;


import com.realestate.backend.model.Inquiry;
import com.realestate.backend.service.InquiryService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/inquiries")
@CrossOrigin
public class InquiryController
{
    private final InquiryService inquiryService;

    public InquiryController(InquiryService inquiryService) {
        this.inquiryService = inquiryService;
    }

    @PostMapping
    public Inquiry createInquiry(@RequestBody Inquiry inquiry) {
        return inquiryService.createInquiry(inquiry);
    }

    @GetMapping
    public List<Inquiry> getAllInquiries() {
        return inquiryService.getAllInquiries();
    }

    @GetMapping("/{id}")
    public Inquiry getInquiry(@PathVariable Long id) {
        return inquiryService.getInquiryById(id);
    }

    @GetMapping("/user/{userId}")
    public List<Inquiry> getByUser(@PathVariable Long userId) {
        return inquiryService.getInquiriesByUser(userId);
    }

    @GetMapping("/property/{propertyId}")
    public List<Inquiry> getByProperty(@PathVariable Long propertyId) {
        return inquiryService.getInquiriesByProperty(propertyId);
    }

    @PutMapping("/{id}/status")
    public Inquiry updateStatus(@PathVariable Long id, @RequestParam String status) {
        return inquiryService.updateStatus(id, status);
    }

    @DeleteMapping("/{id}")
    public void deleteInquiry(@PathVariable Long id) {
        inquiryService.deleteInquiry(id);
    }
}
