package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import config.sqlseverConnection;
import model.Detective;
import model.Error;


public class DetectiveRepository {
	public List<Detective> getDetective() {
		List<Detective> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "SELECT a.Alerts_ID, c.Camera_name,p.Project_name, a.Timestamp, e.Error_type, e.Descript\r\n"
				+ "FROM Alerts a\r\n"
				+ "JOIN Cameras c ON a.Camera_ID = c.Camera_ID\r\n"
				+ "JOIN Error e ON a.Error_ID = e.Error_ID\r\n"
				+ "JOIN Project p ON c.Project_ID = p.Project_ID";
				
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Detective detective = new Detective();
				detective.setAlert_ID(resultSet.getInt("Alerts_ID"));
				detective.setCamera_name(resultSet.getString("Camera_name"));
				detective.setProject_name("Project_name");
				detective.setTimestamp(resultSet.getString("Timestamp"));
				detective.setError_type(resultSet.getString("Error_type"));
				detective.setDescripts(resultSet.getString("Descript"));
				list.add(detective);
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
		DetectiveRepository cam = new DetectiveRepository();
		List<Detective> detectives  = cam.getDetective();
		List<Detective> list = cam.getDetective();
		for(Detective o : list) {
			System.out.println(o);
		}
}
}
