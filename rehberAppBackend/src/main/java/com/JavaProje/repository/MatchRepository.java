package com.JavaProje.repository;

import com.JavaProje.entities.Match;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MatchRepository extends JpaRepository<Match, Integer> {

    // Seyahat ile ilişkili tüm başvuruları listele
    List<Match> findByJourneyId(Integer journeyId);

    // Seyahat ve guide'a göre eşleşmeleri listele
    List<Match> findByGuideId(Integer guideId);

    // Traveller'a göre yapılan başvuruları listele
    List<Match> findByTravellerId(Integer travellerId);

    // Seyahat, guide ve traveller'a göre eşleşme kontrolü
    Match findByJourneyIdAndGuideIdAndTravellerId(Integer journeyId, Integer guideId, Integer travellerId);
}
