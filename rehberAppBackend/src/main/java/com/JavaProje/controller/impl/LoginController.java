package com.JavaProje.controller.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.JavaProje.dto.DtoLogin;
import com.JavaProje.services.ILoginService;

@RestController
@RequestMapping("/rest/api/login")
public class LoginController {

    @Autowired
    private ILoginService loginService;

    @PostMapping(path = "/authenticate")
    public Integer authenticate(@RequestBody DtoLogin login) {
        return loginService.authenticate(login);
    }
}
