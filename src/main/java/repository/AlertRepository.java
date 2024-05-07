package repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.Alert;

public class AlertRepository {

	public List<Alert> getCamera() {
		List<Alert> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Alert";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Alert alert = new Alert();
				alert.setAlert_ID(resultSet.getInt("Alert_ID"));
				alert.setCamera_ID(resultSet.getInt("Camera_ID"));
				alert.setTimestamp(resultSet.getString("Alert"));
				alert.setDescript(resultSet.getString("Descript"));
				list.add(alert);
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
	public List<Alert> getCameraAndProject(){
		List<Alert> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Alert";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Alert alert = new Alert();
				alert.setAlert_ID(resultSet.getInt("Alert_ID"));
				alert.setCamera_ID(resultSet.getInt("Camera_ID"));
				alert.setTimestamp(resultSet.getString("Alert"));
				alert.setDescript(resultSet.getString("Descript"));
				list.add(alert);
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
