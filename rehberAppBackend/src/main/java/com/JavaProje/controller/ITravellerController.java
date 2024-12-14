package com.JavaProje.controller;

import com.JavaProje.dto.DtoTraveller;
import com.JavaProje.dto.DtoTravellerIU;

import java.util.List;
import java.util.UUID;

public interface ITravellerController {
    DtoTraveller saveTraveller(DtoTravellerIU dtoTravellerIU);
    List<DtoTraveller> getAllTravellers();
    DtoTraveller getTravellerById(UUID id);
}
