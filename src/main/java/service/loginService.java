package service;

import java.util.List;

import model.CameraError;
import model.Users;
import repository.CameraErrorRepository;
import repository.UsersRepository;

public class loginService {
	private UsersRepository usersRepository = new UsersRepository();
	private CameraErrorRepository cameraErrorRepository = new CameraErrorRepository();
	public boolean checkLogin(String username, String password) {
		List<Users> list = usersRepository.getUserByUsernameAndPassword(username, password);
		return list.size() > 0 ? true : false;
	}

	public List<Users> getUserByUsernamAndPassword(String username,String password) {
		return usersRepository.getUserByUsernameAndPassword(username, password);
	}
	
	public List<CameraError> getTop10CameraError() {
		return cameraErrorRepository.getTop10CameraAndError();
	}
	
	
}
