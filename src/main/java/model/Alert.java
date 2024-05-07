package model;

public class Alert {
	private int Alert_ID;
	private int Camera_ID;
	private String Timestamp;
	private String Descript;

	public int getAlert_ID() {
		return Alert_ID;
	}

	public void setAlert_ID(int alert_ID) {
		Alert_ID = alert_ID;
	}

	public int getCamera_ID() {
		return Camera_ID;
	}

	public void setCamera_ID(int camera_ID) {
		Camera_ID = camera_ID;
	}

	public String getTimestamp() {
		return Timestamp;
	}

	public void setTimestamp(String timestamp) {
		Timestamp = timestamp;
	}

	public String getDescript() {
		return Descript;
	}

	public void setDescript(String descript) {
		Descript = descript;
	}

}
