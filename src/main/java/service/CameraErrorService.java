package service;

import java.util.List;

import model.CameraError;
import repository.CameraErrorRepository;

public class CameraErrorService {
	private CameraErrorRepository cameraErrorRepository = new CameraErrorRepository();
	
	public List<CameraError> getCameraError(String Camera_name,String Project_name){
		return cameraErrorRepository.getCameraAndError(Camera_name,Project_name);
	}
	


}
