package com.JavaProje.services;

import com.JavaProje.dto.DtoTraveller;
import com.JavaProje.dto.DtoTravellerIU;

import java.util.List;
import java.util.UUID;

public interface ITravellerService {
    DtoTraveller saveTraveller(DtoTravellerIU dtoTravellerIU);
    List<DtoTraveller> getAllTravellers();
    DtoTraveller getTravellerById(Integer id);
}
