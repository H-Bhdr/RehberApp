package com.JavaProje.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoLogin {
    private String email;
    private String password;
    private Integer userId;
}