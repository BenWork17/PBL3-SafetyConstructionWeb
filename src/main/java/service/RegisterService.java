package service;

import repository.RegisterRepository;
import model.Users;

public class RegisterService {
	private RegisterRepository registerRepository = new RegisterRepository();

	public boolean registerCheck(String username, String fullname, String email, String phone, String password) {
		Users newUser = new Users();
		newUser.setUsers_name(username);
		newUser.setFull_name(fullname);
		newUser.setEmail(email);
		newUser.setPhone(phone);
		newUser.setPass_word(password);

		return registerRepository.addUser(newUser);
	}
}
