package com.JavaProje.controller.impl;


import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import com.JavaProje.entities.Match;
import com.JavaProje.entities.Traveller;
import com.JavaProje.services.impl.MatchService;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/matches")
@RequiredArgsConstructor

public class MatchController {

    private final MatchService matchService;

    @PostMapping("/apply")
    public Match applyToJourney(@RequestParam Integer travellerId, @RequestParam Integer journeyId, 
                                @RequestParam Integer guideId) {
        Traveller traveller = new Traveller();
        traveller.setId(travellerId);
        
        Journey journey = new Journey();
        journey.setId(journeyId);
        
        Guide guide = new Guide();
        guide.setId(guideId); // Guide parametresini alıyoruz ve set ediyoruz
        
        return matchService.applyToJourney(traveller, journey, guide); // Guide'ı metodumuza geçiriyoruz
    }
}

