package com.JavaProje.services.impl;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JavaProje.dto.DtoGuide;
import com.JavaProje.dto.DtoGuideIU;
import com.JavaProje.entities.Guide;
import com.JavaProje.entities.Login;
import com.JavaProje.repository.GuideRepository;
import com.JavaProje.repository.LoginRepository;
import com.JavaProje.services.IGuideService;

@Service
public class GuideServiceImpl implements IGuideService {

    @Autowired
    private GuideRepository guideRepository;
    
    @Autowired
    private LoginRepository loginRepository;

    @Override
    public DtoGuide saveGuide(DtoGuideIU dtoGuideIU) {
        Guide guide = new Guide();
        BeanUtils.copyProperties(dtoGuideIU, guide);
        guide = guideRepository.save(guide);
        
        Login login = new Login();
        login.setEmail(dtoGuideIU.getEmail());
        login.setPassword(dtoGuideIU.getPassword());
        login.setUserId(guide.getId()); // Traveller'ın ID'sini Login tablosuna kaydet

        loginRepository.save(login);
        DtoGuide dtoGuide = new DtoGuide();
        BeanUtils.copyProperties(guide, dtoGuide);
        return dtoGuide;
    }

    @Override
    public List<DtoGuide> getAllGuides() {
        List<Guide> guideList = guideRepository.findAll();
        return guideList.stream().map(guide -> {
            DtoGuide dtoGuide = new DtoGuide();
            BeanUtils.copyProperties(guide, dtoGuide);
            return dtoGuide;
        }).collect(Collectors.toList());
    }

    @Override
    public DtoGuide getGuideById(Integer id) {
        Optional<Guide> optional = guideRepository.findById(id);
        if (optional.isPresent()) {
            DtoGuide dtoGuide = new DtoGuide();
            BeanUtils.copyProperties(optional.get(), dtoGuide);
            return dtoGuide;
        }
        return null;
    }
}
