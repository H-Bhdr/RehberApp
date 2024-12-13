package com.JavaProje.controller;

import java.util.List;

import com.JavaProje.entities.Users;

public interface IUserController {
	
	public Users saveUsers(Users users);
	
	public List<Users> getAllUsers();

	public Users getUsersById(Integer id);
}
