package service;

import java.util.List;

import model.CameraProject;
import repository.CameraProjectRepository;

public class CameraProjectService {
	private CameraProjectRepository cameraProjectRepository = new CameraProjectRepository();
	
	public List<CameraProject> getCameraProject(){
		return cameraProjectRepository.getCameraAndProject();
	}
//	public List<CameraProject> getCameraProjectA(String Project_name){
//		return cameraProjectRepository.getCameraAndProjectByProjectName(Project_name);
//	}
	
	

}
