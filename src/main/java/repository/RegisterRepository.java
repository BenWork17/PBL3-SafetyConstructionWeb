package repository;

import config.sqlseverConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Users;

public class RegisterRepository {
	public boolean addUser(Users user) {
		Connection connection = sqlseverConnection.getConnection();
		String query = "INSERT INTO Users (Users_name, Full_name, Email, Phone, Pass_word, Role_ID) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getUsers_name());
			preparedStatement.setString(2, user.getFull_name());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPhone());
			preparedStatement.setString(5, user.getPass_word());
			preparedStatement.setInt(6, 2);
			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
