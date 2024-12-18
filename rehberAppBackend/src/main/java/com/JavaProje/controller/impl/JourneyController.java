package com.JavaProje.controller.impl;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JavaProje.dto.DtoJourneyIU;
import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import com.JavaProje.services.impl.JourneyService;
import com.JavaProje.dto.DtoJourney;

import lombok.RequiredArgsConstructor; 

@RestController
@RequestMapping("/api/journeys")
@RequiredArgsConstructor
public class JourneyController {

    private final JourneyService journeyService;

    // Seyahat oluşturma
    @PostMapping("/create")
    public Journey createJourney(@RequestBody DtoJourneyIU dtoJourney) {
        Guide guide = new Guide();
        guide.setId(Integer.parseInt(dtoJourney.getGuideId()));  // Guide ID'yi JSON'dan alıyoruz
        return journeyService.createJourney(guide, 
                                            dtoJourney.getDestination(), 
                                            dtoJourney.getDescription(), 
                                            dtoJourney.getStartDate().toString(), 
                                            dtoJourney.getEndDate().toString());
    }

 // Seyahat detaylarını görüntüleme
    @GetMapping("/{journeyId}")
    public DtoJourney getJourney(@PathVariable Integer journeyId) {
        Journey journey = journeyService.getJourneyById(journeyId);
        return new DtoJourney(
            journey.getId(),
            journey.getDestination(),
            journey.getStartDate(),
            journey.getEndDate(),
            journey.getDescription(),
            journey.getGuide().getId().toString(),
            journey.getMatches().stream().map(match -> match.getId().toString()).toList()
        );
    }

    // Tüm seyahatleri listele
    @GetMapping("/")
    public List<DtoJourney> getAllJourneys() {
        return journeyService.getAllJourneys().stream()
                .map(journey -> new DtoJourney(
                        journey.getId(),
                        journey.getDestination(),
                        journey.getStartDate(),
                        journey.getEndDate(),
                        journey.getDescription(),
                        journey.getGuide().getId().toString(),
                        journey.getMatches().stream().map(match -> match.getId().toString()).toList()
                ))
                .toList();
    }
}
