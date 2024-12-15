package com.JavaProje.services;

import com.JavaProje.dto.DtoGuide;
import com.JavaProje.dto.DtoGuideIU;

import java.util.List;
import java.util.UUID;

public interface IGuideService {
    DtoGuide saveGuide(DtoGuideIU dtoGuideIU);
    List<DtoGuide> getAllGuides();
    DtoGuide getGuideById(Integer id);
}
