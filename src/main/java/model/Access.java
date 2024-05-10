package model;

public class Access {
	private int Acess_ID;
	private int User_ID;
	private int Camera_ID;
	@Override
	public String toString() {
		return "Access [Acess_ID=" + Acess_ID + ", User_ID=" + User_ID + ", Camera_ID=" + Camera_ID + "]";
	}
	public int getAcess_ID() {
		return Acess_ID;
	}
	public void setAcess_ID(int acess_ID) {
		Acess_ID = acess_ID;
	}
	public int getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(int user_ID) {
		User_ID = user_ID;
	}
	public int getCamera_ID() {
		return Camera_ID;
	}
	public void setCamera_ID(int camera_ID) {
		Camera_ID = camera_ID;
	}

}
