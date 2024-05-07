package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
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
}
