package com.service;

import java.util.List;
import com.model.Users;
import com.repository.UsersRepository;

public class loginservice {
	private UsersRepository userepository = new UsersRepository();
	public boolean checklogin(String username, String password) {
		List<Users> list = userepository.getUserByUsernameAndPassWork(username, password);
		return list.size() > 0 ? true : false;
		
	}

}
