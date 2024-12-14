package com.JavaProje.repository;

import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import com.JavaProje.entities.Guide;

public interface GuideRepository extends JpaRepository<Guide, UUID> {
}
