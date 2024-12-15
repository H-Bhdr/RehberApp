package com.JavaProje.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import com.JavaProje.entities.Traveller;

public interface TravellerRepository extends JpaRepository<Traveller, Integer> {
}
