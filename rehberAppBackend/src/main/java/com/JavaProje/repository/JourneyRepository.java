package com.JavaProje.repository;

import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface JourneyRepository extends JpaRepository<Journey, Integer> {
    
    // Guide'ın oluşturduğu seyahatleri listele
    List<Journey> findByGuide(Guide guide);
}
