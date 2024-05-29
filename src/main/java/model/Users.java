package model;

public class Users {
	@Override
	public String toString() {
		return "Users [Users_ID=" + Users_ID + ", Users_name=" + Users_name + ", Full_name=" + Full_name + ", Email="
				+ Email + ", Phone=" + Phone + ", Pass_word=" + Pass_word + ", Role_ID=" + Role_ID + "]";
	}

	private int Users_ID;
	private String Users_name;
	private String Full_name;
	private String Email;
	private String Phone;
	private String Pass_word;
	private int Role_ID;

	public int getUsers_ID() {
		return Users_ID;
	}

	public void setUsers_ID(int users_ID) {
		Users_ID = users_ID;
	}

	public String getUsers_name() {
		return Users_name;
	}

	public void setUsers_name(String users_name) {
		Users_name = users_name;
	}

	public String getFull_name() {
		return Full_name;
	}

	public void setFull_name(String full_name) {
		Full_name = full_name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getPass_word() {
		return Pass_word;
	}

	public void setPass_word(String pass_word) {
		Pass_word = pass_word;
	}

	public int getRole_ID() {
		return Role_ID;
	}

	public void setRole_ID(int role_ID) {
		Role_ID = role_ID;
	}
}
