package com.JavaProje.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoTravellerIU {
    private String name;
    private String email;
    private String phoneNumber;
    private String profilePicture;
    private String bio;
    private Integer age;

    // Getter ve Setter'lar
}
