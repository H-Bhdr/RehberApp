package com.JavaProje.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoTravellerIU {
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String password;

    // Getter ve Setter'lar
}
