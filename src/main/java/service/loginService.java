package service;

import java.util.List;

import model.Users;
import repository.UsersRepository;

public class loginService {
	private UsersRepository usersRepository = new UsersRepository();

	public boolean checkLogin(String username, String password) {
		List<Users> list = usersRepository.getUserByUsernameAndPassword(username, password);
		return list.size() > 0 ? true : false;
	}
}
