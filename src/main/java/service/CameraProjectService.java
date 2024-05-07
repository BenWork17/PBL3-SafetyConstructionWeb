package service;

import java.util.List;

import model.CameraProject;
import repository.CameraProjectRepository;

public class CameraProjectService {
	private CameraProjectRepository cameraProjectRepository = new CameraProjectRepository();
	
	public List<CameraProject> getCameraProject(){
		return cameraProjectRepository.getCameraAndProject();
	}
	

}
