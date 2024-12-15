package com.JavaProje.services.impl;


import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import com.JavaProje.entities.Match;
import com.JavaProje.entities.Traveller;
import com.JavaProje.repository.MatchRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MatchService {

    private final MatchRepository matchRepository;

    // Seyahate başvuru yap
    public Match applyToJourney(Traveller traveller, Journey journey, Guide guide) {
        Match match = new Match();
        match.setTraveller(traveller);
        match.setJourney(journey);
        match.setGuide(guide); // Burada Guide nesnesi set ediliyor
        match.setStatus("ACTIVE"); // Varsayılan olarak aktif durum

        return matchRepository.save(match); // Eşleşmeyi kaydediyoruz
    }

}
