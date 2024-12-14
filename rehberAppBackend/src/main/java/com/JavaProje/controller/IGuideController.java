package com.JavaProje.controller;

import com.JavaProje.dto.DtoGuide;
import com.JavaProje.dto.DtoGuideIU;

import java.util.List;
import java.util.UUID;

public interface IGuideController {
    DtoGuide saveGuide(DtoGuideIU dtoGuideIU);
    List<DtoGuide> getAllGuides();
    DtoGuide getGuideById(UUID id);
}
