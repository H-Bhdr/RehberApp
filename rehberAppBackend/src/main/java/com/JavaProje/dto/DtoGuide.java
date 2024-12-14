package com.JavaProje.dto;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoGuide {
    private UUID id;
    private String name;
    private String email;
    private String phoneNumber;
    private String profilePicture;
    private String bio;
    private Integer rating;

    // Getter ve Setter'lar
}
