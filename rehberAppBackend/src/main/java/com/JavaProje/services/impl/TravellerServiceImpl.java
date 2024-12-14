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
import com.JavaProje.entities.Traveller;
import com.JavaProje.repository.TravellerRepository;
import com.JavaProje.services.ITravellerService;

@Service
public class TravellerServiceImpl implements ITravellerService {

    @Autowired
    private TravellerRepository travellerRepository;

    @Override
    public DtoTraveller saveTraveller(DtoTravellerIU dtoTravellerIU) {
        Traveller traveller = new Traveller();
        BeanUtils.copyProperties(dtoTravellerIU, traveller);
        traveller = travellerRepository.save(traveller);
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
	public DtoTraveller getTravellerById(UUID id) {
		   Optional<Traveller> optional = travellerRepository.findById(id);
	        if (optional.isPresent()) {
	            DtoTraveller dtoTraveller = new DtoTraveller();
	            BeanUtils.copyProperties(optional.get(), dtoTraveller);
	            return dtoTraveller;
	        }
	        return null;
	}
}
