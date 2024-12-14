package com.JavaProje.services;

import java.util.List;
import com.JavaProje.dto.DtoUser;
import com.JavaProje.dto.DtoUserIU;

public interface IUserService {
	
	public DtoUser saveUsers(DtoUserIU users);
	
	public List<DtoUser> getAllUsers();
	
	public DtoUser getUsersById(Integer id);
}
