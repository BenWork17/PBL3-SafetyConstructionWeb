package service;

import java.util.List;

import model.Users;
import repository.UsersRepository;

public class profileService {

	private UsersRepository usersRepository = new UsersRepository();
	public List<Users> getUserbyUsernameAndPassword(String username, String password) {
		return usersRepository.getUserByUsernameAndPassword(username, password);
	}


}
