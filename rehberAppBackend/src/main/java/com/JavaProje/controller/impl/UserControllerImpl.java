package com.JavaProje.controller.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.JavaProje.controller.IUserController;
import com.JavaProje.entities.Users;
import com.JavaProje.services.IUserService;


@RestController
@RequestMapping("/rest/api/user")
public class UserControllerImpl implements IUserController {
	
	@Autowired
	private IUserService userService;
	
	@PostMapping(path = "/saveUser")
	@Override
	public Users saveUsers( @RequestBody Users users) {
		return userService.saveUsers(users);
	
	}
	
	
	@GetMapping(path = "/getAllUsers")
	@Override
	public List<Users> getAllUsers() {
			return userService.getAllUsers();
	}

	
	
	@GetMapping(path =  "/getAllUsersById/{id}" )
	@Override
	public Users getUsersById( @PathVariable(name = "id") Integer id) {
		return userService.getUsersById(id);
	}

}
