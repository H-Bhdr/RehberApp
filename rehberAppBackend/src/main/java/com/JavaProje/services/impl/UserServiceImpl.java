package com.JavaProje.services.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JavaProje.dto.DtoUser;
import com.JavaProje.dto.DtoUserIU;
import com.JavaProje.entities.Users;
import com.JavaProje.repository.UserRepository;
import com.JavaProje.services.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired 
	private UserRepository userRepository;

	@Override
	public DtoUser saveUsers(DtoUserIU dtoUserIU) {
		Users users = new Users();
		BeanUtils.copyProperties(dtoUserIU, users);
		users = userRepository.save(users);
		DtoUser dtoUser = new DtoUser();
		BeanUtils.copyProperties(users, dtoUser);
		return dtoUser;
	}

	@Override
	public List<DtoUser> getAllUsers() {
		List<Users> userList = userRepository.findAll();
		return userList.stream().map(user -> {
			DtoUser dtoUser = new DtoUser();
			BeanUtils.copyProperties(user, dtoUser);
			return dtoUser;
		}).collect(Collectors.toList());
	}

	@Override
	public DtoUser getUsersById(Integer id) {
		Optional<Users> optional = userRepository.findById(id);
		if (optional.isPresent()) {
			DtoUser dtoUser = new DtoUser();
			BeanUtils.copyProperties(optional.get(), dtoUser);
			return dtoUser;
		}
		return null;
	}
}
