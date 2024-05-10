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

	public List<Alert> getCameraAndProject() {
		List<Alert> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "SELECT Error.Error_ID, Error.Error_type , Error.descript\r\n"
				+ "fROM Cameras\r\n"
				+ "INNER JOIN Project ON Project.Project_ID = Cameras.Project_ID\r\n"
				+ "INNER JOIN Alerts ON Cameras.Camera_ID = Alerts.Camera_ID\r\n"
				+ "INNER JOIN Error ON Error.Error_ID = Alerts.Error_ID \r\n"
				+ "where Cameras.Camera_ID = ? AND Project.Project_name= ? AND ( Timestamp >= ? AND Timestamp <= ?)";
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

	public List<Alert> getAlertbyTimestamp(String camera_name, String Project_name, String Date_1, String Date_2) {
		List<Alert> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Alert";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, camera_name);
			preparedStatement.setString(2, Project_name);
			preparedStatement.setString(3, Date_1);
			preparedStatement.setString(4, Date_2);
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
