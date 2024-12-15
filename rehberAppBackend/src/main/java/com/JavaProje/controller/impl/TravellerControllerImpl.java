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

import com.JavaProje.controller.ITravellerController;
import com.JavaProje.dto.DtoTraveller;
import com.JavaProje.dto.DtoTravellerIU;
import com.JavaProje.services.ITravellerService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/rest/api/traveller")
public class TravellerControllerImpl implements ITravellerController {

    @Autowired
    private ITravellerService travellerService;

    @PostMapping(path = "/saveTraveller")
    @Override
    public DtoTraveller saveTraveller(@RequestBody @Valid DtoTravellerIU travellerIU) {
        return travellerService.saveTraveller(travellerIU);
    }

    @GetMapping(path = "/getAllTravellers")
    @Override
    public List<DtoTraveller> getAllTravellers() {
        return travellerService.getAllTravellers();
    }

    @GetMapping(path = "/getTravellerById/{id}")
    @Override
    public DtoTraveller getTravellerById(@PathVariable(name = "id") Integer id) {
        return travellerService.getTravellerById(id);
    }
}
