package com.JavaProje.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.JavaProje.dto.DtoLogin;
import com.JavaProje.entities.Login;
import com.JavaProje.repository.LoginRepository;
import com.JavaProje.services.ILoginService;

@Service
public class LoginServiceImpl implements ILoginService {

    @Autowired
    private LoginRepository loginRepository;

    @Override
    public Integer authenticate(DtoLogin login) {
        Login storedLogin = loginRepository.findByEmail(login.getEmail());
        if (storedLogin != null && storedLogin.getPassword().equals(login.getPassword())) {
            return storedLogin.getUserId();
        }
        return 0;
    }
}
