package com.JavaProje.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.JavaProje.entities.Users;


@Repository
public interface UserRepository extends JpaRepository<Users, Integer>{

}
