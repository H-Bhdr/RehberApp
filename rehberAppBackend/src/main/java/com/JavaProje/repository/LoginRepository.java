package com.JavaProje.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.JavaProje.entities.Login;

public interface LoginRepository extends JpaRepository<Login, Integer> {
    Login findByEmail(String email);
}
