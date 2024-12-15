package com.JavaProje.dto;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoTraveller {
    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;


    // Getter ve Setter'lar
}
