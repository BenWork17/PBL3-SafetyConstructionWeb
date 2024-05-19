package model;

public class Detective {
	private int Alert_ID;
	private String Camera_name;
	private String Project_name;
	private String Timestamp;
	private String Error_type;
	private String Descripts;
	@Override
	public String toString() {
		return "Detective [Alert_ID=" + Alert_ID + ", Camera_name=" + Camera_name + ", Project_name=" + Project_name
				+ ", Timestamp=" + Timestamp + ", Error_type=" + Error_type + ", Descripts=" + Descripts + "]";
	}
	public int getAlert_ID() {
		return Alert_ID;
	}
	public void setAlert_ID(int alert_ID) {
		Alert_ID = alert_ID;
	}
	public String getCamera_name() {
		return Camera_name;
	}
	public void setCamera_name(String camera_name) {
		Camera_name = camera_name;
	}
	public String getProject_name() {
		return Project_name;
	}
	public void setProject_name(String project_name) {
		Project_name = project_name;
	}
	public String getTimestamp() {
		return Timestamp;
	}
	public void setTimestamp(String timestamp) {
		Timestamp = timestamp;
	}
	public String getError_type() {
		return Error_type;
	}
	public void setError_type(String error_type) {
		Error_type = error_type;
	}
	public String getDescripts() {
		return Descripts;
	}
	public void setDescripts(String descripts) {
		Descripts = descripts;
	}

}
