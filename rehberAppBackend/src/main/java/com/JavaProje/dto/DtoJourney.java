package com.JavaProje.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoJourney {

    private Integer id;  // Seyahatin ID'si

    private String destination;  // Seyahatin hedef noktası

    private LocalDate startDate;  // Başlangıç tarihi

    private LocalDate endDate;  // Bitiş tarihi

    private String description;  // Seyahatin açıklaması

    private String guideId;  // Rehberin ID'si (Guide'a referans)

    private List<String> matchIds;  // Seyahate başvuran Traveller'ların ID'leri (eşleşmeler)
}

