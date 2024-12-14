package com.JavaProje.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DtoUserIU {
	
	@NotEmpty(message = "first name boş olamaz")
	private String firstName;
	private String lastName;
}
