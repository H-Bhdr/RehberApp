package com.JavaProje.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DtoMatch {
    private Integer id;
    private Integer guideId;
    private Integer travellerId;
    private Integer journeyId;
    private String status;
}
