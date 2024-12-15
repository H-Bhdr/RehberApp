package com.JavaProje.services.impl;


import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import com.JavaProje.entities.Match;
import com.JavaProje.entities.Traveller;
import com.JavaProje.repository.MatchRepository;
import com.JavaProje.dto.DtoMatch;
import com.JavaProje.dto.DtoMatchIU;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MatchService {

    private final MatchRepository matchRepository;

    // Seyahate başvuru yap
    public DtoMatch applyToJourney(DtoMatchIU dtoMatchIU) {
        Traveller traveller = new Traveller();
        traveller.setId(dtoMatchIU.getTravellerId());
        
        Journey journey = new Journey();
        journey.setId(dtoMatchIU.getJourneyId());
        
        Guide guide = new Guide();
        guide.setId(dtoMatchIU.getGuideId());
        
        Match match = new Match();
        match.setTraveller(traveller);
        match.setJourney(journey);
        match.setGuide(guide);
        match.setStatus(Match.MatchStatus.valueOf(dtoMatchIU.getStatus().toUpperCase())); // Ensure status is valid
        
        Match savedMatch = matchRepository.save(match);
        
        return convertToDto(savedMatch);
    }

    // Tüm eşleşmeleri listele
    public List<DtoMatch> listAllMatches() {
        return matchRepository.findAll().stream()
                .map(this::convertToDto)
                .toList();
    }

    // Traveller'a göre eşleşmeleri listele
    public List<DtoMatch> listMatchesByTraveller(Integer travellerId) {
        return matchRepository.findByTravellerId(travellerId).stream()
                .map(this::convertToDto)
                .toList();
    }

    // Guide'a göre eşleşmeleri listele
    public List<DtoMatch> listMatchesByGuide(Integer guideId) {
        return matchRepository.findByGuideId(guideId).stream()
                .map(this::convertToDto)
                .toList();
    }

    private DtoMatch convertToDto(Match match) {
        DtoMatch dtoMatch = new DtoMatch();
        dtoMatch.setId(match.getId());
        dtoMatch.setGuideId(match.getGuide().getId());
        dtoMatch.setTravellerId(match.getTraveller().getId());
        dtoMatch.setJourneyId(match.getJourney().getId());
        dtoMatch.setStatus(match.getStatus().name());
        return dtoMatch;
    }
}
