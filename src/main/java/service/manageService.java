package service;

import java.util.List;

import model.Users;
import repository.UsersRepository;

public class manageService {

	private UsersRepository usersRepository = new UsersRepository();
	public List<Users> getUser() {
		return usersRepository.getUser();
	}
	public boolean deleteUserById(int id) {
		return usersRepository.DeleteUserByID(id) > 0 ? true :false;
	}
	public boolean addUser(String username, String fullname, String email , String phone , String password, int role_id ){
		return usersRepository.addUser(username, fullname , email,phone,password,role_id ) > 0 ? true :false;
	}
	public boolean modifyUser(int userid,String username, String fullname, String email , String phone , String password, int role_id ){
		return usersRepository.modifyuser(userid,username, fullname , email,phone,password,role_id ) > 0 ? true :false;
	}


}
