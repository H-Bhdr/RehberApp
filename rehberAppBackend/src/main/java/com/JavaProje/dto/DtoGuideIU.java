package com.JavaProje.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoGuideIU {
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String profilePicture;
    private String bio;
    private Integer rating;
    private String description;
    private String expertiseArea;
    private String password;
    

    }
