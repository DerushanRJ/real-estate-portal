package com.realestate.backend.service;

import com.realestate.backend.model.Inquiry;
import com.realestate.backend.repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class InquiryService
{
    @Autowired
    private final InquiryRepository inquiryRepository;

    public InquiryService(InquiryRepository inquiryRepository)
    {
        this.inquiryRepository = inquiryRepository;
    }

    public Inquiry createInquiry(Inquiry inquiry)
    {
        inquiry.setStatus("PENDING");
        inquiry.setCreatedAt(LocalDateTime.now());

        return inquiryRepository.save(inquiry);
    }

    public List<Inquiry> getAllInquiries()
    {
        return inquiryRepository.findAll();
    }

    public Inquiry getInquiryById(Long id)
    {
        return inquiryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Inquiry not found"));
    }

    public List<Inquiry> getInquiriesByUser(Long userId) {
        return inquiryRepository.findByUserUserID(userId);
    }

    public List<Inquiry> getAllInquiriesByUser(Long userID)
    {
        return inquiryRepository.findByUserUserID(userID);
    }

    public List<Inquiry> getInquiriesByProperty(Long propertyId) {
        return inquiryRepository.findByPropertyId(propertyId);
    }

    public Inquiry updateStatus(Long id, String status) {
        Inquiry inquiry = getInquiryById(id);
        inquiry.setStatus(status);
        return inquiryRepository.save(inquiry);
    }

    public void deleteInquiry(Long id) {
        inquiryRepository.deleteById(id);
    }


}
