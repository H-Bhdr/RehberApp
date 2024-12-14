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
import com.JavaProje.dto.DtoUser;
import com.JavaProje.dto.DtoUserIU;
import com.JavaProje.services.IUserService;

import jakarta.validation.Valid; 


@RestController
@RequestMapping("/rest/api/user")
public class UserControllerImpl implements IUserController {
	
	@Autowired
	private IUserService userService;
	
	@PostMapping(path = "/saveUser")
	@Override
	public DtoUser saveUsers(@RequestBody @Valid DtoUserIU users) {
		return userService.saveUsers(users);
	}
	
	
	@GetMapping(path = "/getAllUsers")
	@Override
	public List<DtoUser> getAllUsers() {
			return userService.getAllUsers();
	}

	
	
	@GetMapping(path =  "/getAllUsersById/{id}" )
	@Override
	public DtoUser getUsersById( @PathVariable(name = "id") Integer id) {
		return userService.getUsersById(id);
	}

}
