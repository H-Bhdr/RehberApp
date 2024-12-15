package com.JavaProje.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoJourneyIU {

    private String destination;  // Seyahatin hedef noktası

    private LocalDate startDate;  // Başlangıç tarihi

    private LocalDate endDate;  // Bitiş tarihi

    private String description;  // Seyahatin açıklaması

    private String guideId;  // Rehberin ID'si (Guide'a referans)
}
