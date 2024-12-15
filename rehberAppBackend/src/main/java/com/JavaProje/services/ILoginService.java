package com.JavaProje.services;

import com.JavaProje.dto.DtoLogin;

public interface ILoginService {
    Integer authenticate(DtoLogin login);
}
