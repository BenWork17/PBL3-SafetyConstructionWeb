package model;

public class Role {
	private int Role_ID;
	private String Role_name;
	private String depscription;

	public int getRole_ID() {
		return Role_ID;
	}

	public void setRole_ID(int role_ID) {
		Role_ID = role_ID;
	}

	public String getRole_name() {
		return Role_name;
	}

	public void setRole_name(String role_name) {
		Role_name = role_name;
	}

	public String getDepscription() {
		return depscription;
	}

	public void setDepscription(String depscription) {
		this.depscription = depscription;
	}
}
