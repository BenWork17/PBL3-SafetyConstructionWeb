package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.Error;
import model.Users;

public class UsersRepository {
	public List<Users> getUserByUsernameAndPassword(String username, String password) {
		List<Users> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Users u where u.Users_name=? and u.Pass_word=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users users = new Users();
				users.setUsers_ID(resultSet.getInt("Users_ID"));
				users.setUsers_name(resultSet.getString("Users_name"));
				users.setFull_name(resultSet.getString("Full_name"));
				users.setEmail(resultSet.getString("Email"));
				users.setPhone(resultSet.getString("Phone"));
				users.setRole_ID(resultSet.getInt("Role_ID"));
				list.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<Users> getUser() {
		List<Users> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Users ";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users users = new Users();
				users.setUsers_ID(resultSet.getInt("Users_ID"));
				users.setUsers_name(resultSet.getString("Users_name"));
				users.setFull_name(resultSet.getString("Full_name"));
				users.setEmail(resultSet.getString("Email"));
				users.setPhone(resultSet.getString("Phone"));
				users.setRole_ID(resultSet.getInt("Role_ID"));
				list.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public int DeleteUserByID(int id) {
		Connection connection = sqlseverConnection.getConnection();
		String query = "DELETE FROM Users WHERE Users_ID = ?";
		
		int isDelete =0;
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			isDelete = preparedStatement.executeUpdate();


			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return isDelete;
		
	}
	public int addUser(String username, String fullname, String email , String phone , String password, int role_id) {
		Connection connection = sqlseverConnection.getConnection();
		String query = "INSERT INTO Users (Users_name, Full_name,Email,Phone,Pass_word,Role_ID) VALUES(? , ?, ?, ?, ? , ?)";
		int isAdd =0;
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, fullname);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, phone);
			preparedStatement.setString(5, password);
			preparedStatement.setInt(6, role_id);
			isAdd = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isAdd;
		
	}
	
//	public static void main(String[] args) {
//		UsersRepository cam = new UsersRepository();
//		List<Users> list = cam.getUser();
//		for(Users o : list) {
//			System.out.println(o);
//		}
//	}
	public static void main(String[] args) {
		UsersRepository cam = new UsersRepository();
		cam.DeleteUserByID(11);
		System.out.println("hello");

	}

}
