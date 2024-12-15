package com.JavaProje.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DtoMatchIU {
    private Integer guideId;
    private Integer travellerId;
    private Integer journeyId;
    private String status;
}
