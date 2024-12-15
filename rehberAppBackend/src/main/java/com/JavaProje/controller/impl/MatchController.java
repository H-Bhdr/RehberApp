package com.JavaProje.controller.impl;


import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Journey;
import com.JavaProje.entities.Match;
import com.JavaProje.entities.Traveller;
import com.JavaProje.services.impl.MatchService;
import com.JavaProje.dto.DtoMatch;
import com.JavaProje.dto.DtoMatchIU;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/matches")
@RequiredArgsConstructor

public class MatchController {

    private final MatchService matchService;

    @PostMapping("/apply")
    public DtoMatch applyToJourney(@RequestBody DtoMatchIU dtoMatchIU) {
        return matchService.applyToJourney(dtoMatchIU);
    }

    @GetMapping("/list")
    public List<DtoMatch> listAllMatches() {
        return matchService.listAllMatches();
    }

    @GetMapping("/listByTraveller")
    public List<DtoMatch> listMatchesByTraveller(@RequestParam Integer travellerId) {
        return matchService.listMatchesByTraveller(travellerId);
    }

    @GetMapping("/listByGuide")
    public List<DtoMatch> listMatchesByGuide(@RequestParam Integer guideId) {
        return matchService.listMatchesByGuide(guideId);
    }
}

