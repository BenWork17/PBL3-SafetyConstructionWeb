package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.Role;

public class RolesRepository {
	public List<Role> getRole() {
		List<Role> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Role";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Role role = new Role();
				role.setRole_ID(resultSet.getInt("Role_ID"));
				role.setRole_name(resultSet.getString("Role_name"));
				role.setDepscription(resultSet.getString("depscription"));
				list.add(role);
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
