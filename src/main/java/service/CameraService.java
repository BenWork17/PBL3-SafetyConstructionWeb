package service;

import java.util.List;

import model.Camera;
import repository.CameraRepository;

public class CameraService {
	private CameraRepository cameraRepository = new CameraRepository();
	
	public List<Camera> getCamera(){
		return cameraRepository.getCamera();
	}
	

}
