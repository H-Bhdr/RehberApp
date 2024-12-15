package com.JavaProje.services.impl;

import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import com.JavaProje.repository.JourneyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class JourneyService {

    private final JourneyRepository journeyRepository;

    // Seyahat oluşturma
    public Journey createJourney(Guide guide, String destination, String description, 
                                 String startDate, String endDate) {
        Journey journey = new Journey(); 
        journey.setGuide(guide);
        journey.setDestination(destination);
        journey.setDescription(description);
        journey.setStartDate(LocalDate.parse(startDate));
        journey.setEndDate(LocalDate.parse(endDate));
        return journeyRepository.save(journey);
    }

    // Guide tarafından oluşturulan tüm seyahatleri listele
    public List<Journey> getJourneysByGuide(Guide guide) {
        return journeyRepository.findByGuide(guide);
    }

    // Seyahat detayları
    public Journey getJourneyById(Integer journeyId) {
        return journeyRepository.findById(journeyId).orElseThrow(() -> 
            new RuntimeException("Journey not found"));
    }

    // Tüm seyahatleri listele
    public List<Journey> getAllJourneys() {
        return journeyRepository.findAll();  // Tüm seyahatleri alıyoruz
    }
}
