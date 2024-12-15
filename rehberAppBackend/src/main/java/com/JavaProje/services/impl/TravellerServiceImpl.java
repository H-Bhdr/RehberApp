package com.JavaProje.services.impl;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JavaProje.dto.DtoTraveller;
import com.JavaProje.dto.DtoTravellerIU;
import com.JavaProje.entities.Login;
import com.JavaProje.entities.Traveller;
import com.JavaProje.repository.LoginRepository;
import com.JavaProje.repository.TravellerRepository;
import com.JavaProje.services.ITravellerService;

@Service
public class TravellerServiceImpl implements ITravellerService {

    @Autowired
    private TravellerRepository travellerRepository;
    
    @Autowired
    private LoginRepository loginRepository;

    @Override
    public DtoTraveller saveTraveller(DtoTravellerIU dtoTravellerIU) {
        Traveller traveller = new Traveller();
        BeanUtils.copyProperties(dtoTravellerIU, traveller);
        traveller = travellerRepository.save(traveller);
        
        Login login = new Login();
        login.setEmail(dtoTravellerIU.getEmail());
        login.setPassword(dtoTravellerIU.getPassword());
        login.setUserId(traveller.getId()); // Traveller'ın ID'sini Login tablosuna kaydet

        loginRepository.save(login);
        DtoTraveller dtoTraveller = new DtoTraveller();
        BeanUtils.copyProperties(traveller, dtoTraveller);
        return dtoTraveller;
    }

    @Override
    public List<DtoTraveller> getAllTravellers() {
        List<Traveller> travellerList = travellerRepository.findAll();
        return travellerList.stream().map(traveller -> {
            DtoTraveller dtoTraveller = new DtoTraveller();
            BeanUtils.copyProperties(traveller, dtoTraveller);
            return dtoTraveller;
        }).collect(Collectors.toList());
    }



	@Override
	public DtoTraveller getTravellerById(Integer id) {
		   Optional<Traveller> optional = travellerRepository.findById(id);
	        if (optional.isPresent()) {
	            DtoTraveller dtoTraveller = new DtoTraveller();
	            BeanUtils.copyProperties(optional.get(), dtoTraveller);
	            return dtoTraveller;
	        }
	        return null;
	}
}
