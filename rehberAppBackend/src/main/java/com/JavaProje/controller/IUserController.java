package com.JavaProje.controller;

import java.util.List;
import com.JavaProje.dto.DtoUser;
import com.JavaProje.dto.DtoUserIU;

public interface IUserController {
	
	public DtoUser saveUsers(DtoUserIU users);
	
	public List<DtoUser> getAllUsers();
 
	public DtoUser getUsersById(Integer id);
}
