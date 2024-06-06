package service;

import java.util.List;

import model.Users;
import repository.CameraProjectRepository;
import repository.UsersRepository;

public class manageService {

	private UsersRepository usersRepository = new UsersRepository();
	private CameraProjectRepository CameraProjectRepository = new CameraProjectRepository();
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
	public boolean addCameraProject(String Camera_name, String IP_address,String Status,String Project_Name){
		return CameraProjectRepository.addCameraProject(Camera_name, IP_address , Status,Project_Name ) > 0 ? true :false;
	}
	public boolean deletCameraProjectByID(int id){
		return CameraProjectRepository.DeleteCameraProjectByID(id ) > 0 ? true :false;
	}

	
}
