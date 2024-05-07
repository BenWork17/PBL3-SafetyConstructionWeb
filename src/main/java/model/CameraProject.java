package model;

public class CameraProject {
	private int Camera_ID;
	private String Camera_name;
	private String IP_address;
	private String Stastus;
	private int Project_ID;
	private String Project_name;
	public String getProject_name() {
		return Project_name;
	}

	public void setProject_name(String project_name) {
		Project_name = project_name;
	}

	public String getProject_address() {
		return Project_address;
	}

	public void setProject_address(String project_address) {
		Project_address = project_address;
	}

	private String Project_address;

	public int getCamera_ID() {
		return Camera_ID;
	}

	public void setCamera_ID(int camera_ID) {
		Camera_ID = camera_ID;
	}

	public String getCamera_name() {
		return Camera_name;
	}

	public void setCamera_name(String camera_name) {
		Camera_name = camera_name;
	}

	public String getIP_address() {
		return IP_address;
	}

	public void setIP_address(String iP_address) {
		IP_address = iP_address;
	}

	public String getStastus() {
		return Stastus;
	}

	public void setStastus(String stastus) {
		Stastus = stastus;
	}

	public int getProject_ID() {
		return Project_ID;
	}

	public void setProject_ID(int project_ID) {
		Project_ID = project_ID;
	}

}
