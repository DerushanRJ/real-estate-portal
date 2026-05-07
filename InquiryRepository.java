package com.realestate.backend.repository;

import com.realestate.backend.model.Inquiry;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InquiryRepository extends JpaRepository<Inquiry,Long>
{
    List<Inquiry> findByUserUserID(Long userId);

    List<Inquiry> findByPropertyId(Long propertyId);
}
