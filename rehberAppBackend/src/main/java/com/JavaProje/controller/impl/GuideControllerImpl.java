package com.JavaProje.controller.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JavaProje.controller.IGuideController;
import com.JavaProje.dto.DtoGuide;
import com.JavaProje.dto.DtoGuideIU;
import com.JavaProje.services.IGuideService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/rest/api/guide")
public class GuideControllerImpl implements IGuideController {

    @Autowired
    private IGuideService guideService;

    @PostMapping(path = "/saveGuide")
    @Override
    public DtoGuide saveGuide(@RequestBody @Valid DtoGuideIU guideIU) {
        return guideService.saveGuide(guideIU);
    }

    @GetMapping(path = "/getAllGuides")
    @Override
    public List<DtoGuide> getAllGuides() {
        return guideService.getAllGuides();
    }

    @GetMapping(path = "/getGuideById/{id}")
    @Override
    public DtoGuide getGuideById(@PathVariable(name = "id") UUID id) {
        return guideService.getGuideById(id);
    }
}
