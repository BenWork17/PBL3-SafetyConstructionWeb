package service;

import java.util.List;

import model.Users;
import repository.UsersRepository;

public class manageService {

	private UsersRepository usersRepository = new UsersRepository();
	public List<Users> getUser() {
		return usersRepository.getUser();
	}


}
