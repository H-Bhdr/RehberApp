package com.JavaProje.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JavaProje.entities.Users;
import com.JavaProje.repository.UserRepository;
import com.JavaProje.services.IUserService;


@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public Users saveUsers(Users users) {
		return userRepository.save(users);
	}

	@Override
	public List<Users> getAllUsers() {
		 List<Users> userList= userRepository.findAll();
		 return userList;
	}

	@Override
	public Users getUsersById(Integer id) {
		Optional<Users> optional=  userRepository.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

}
