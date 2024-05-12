package model;

public class Error {
	private int Error_ID;
	private String Error_type;
	private String descript;
	@Override
	public String toString() {
		return "Error [Error_ID=" + Error_ID + ", Error_type=" + Error_type + ", descript=" + descript + "]";
	}
	public int getError_ID() {
		return Error_ID;
	}
	public void setError_ID(int error_ID) {
		Error_ID = error_ID;
	}
	public String getError_type() {
		return Error_type;
	}
	public void setError_type(String error_type) {
		Error_type = error_type;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}

}
