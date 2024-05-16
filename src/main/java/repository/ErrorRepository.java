package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.Error;

public class ErrorRepository {
	public List<Error> getAlertbyTimestamp(String cameraname, String Project_name, String Date_1, String Date_2) {
		List<Error> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "SELECT Error.Error_ID, Error.Error_type , Error.descript\r\n"
				+ "fROM Cameras\r\n"
				+ "INNER JOIN Project ON Project.Project_ID = Cameras.Project_ID\r\n"
				+ "INNER JOIN Alerts ON Cameras.Camera_ID = Alerts.Camera_ID\r\n"
				+ "INNER JOIN Error ON Error.Error_ID = Alerts.Error_ID \r\n"
				+ "where Cameras.Camera_name = ? AND Project.Project_name= ? AND ( Timestamp >= ? AND Timestamp <= ?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, cameraname);
			preparedStatement.setString(2, Project_name);
			preparedStatement.setString(3, Date_1);
			preparedStatement.setString(4, Date_2);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Error error = new Error();
				error.setError_ID(resultSet.getInt("Error_ID"));
				error.setError_type(resultSet.getString("Error_type"));
				error.setDescript(resultSet.getString("descript"));
				list.add(error);
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
	public static void main(String[] args) {
		ErrorRepository cam = new ErrorRepository();
		List<Error> list = cam.getAlertbyTimestamp("Camera1", "SiteA", "2023-05-01","2024-05-08");
		for(Error o : list) {
			System.out.println(o);
		}
	}

}
