package com.JavaProje.services;

import java.util.List;

import com.JavaProje.entities.Users;

public interface IUserService {
	
	public Users saveUsers(Users users);
	
	public List<Users> getAllUsers();
	
	public Users getUsersById(Integer id);
	

}
