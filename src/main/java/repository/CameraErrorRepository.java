package repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.CameraError;

public class CameraErrorRepository {
	public List<CameraError> getCameraAndError(String Camera_name,String Projet_Name) {
		List<CameraError> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "SELECT Cameras.Camera_ID,Cameras.Camera_name,Cameras.IP_address,Status,Cameras.Project_ID,Error_type, descript\r\n"
				+ "FROM Cameras\r\n"
				+ "INNER JOIN Alerts ON Cameras.Camera_ID = Alerts.Camera_ID\r\n"
				+ "INNER JOIN Error ON Alerts.Error_ID = Error.Error_ID\r\n"
				+ "INNER JOIN Project ON Project.Project_ID = Cameras.Project_ID\r\n"
				+ "WHERE Camera_name = ? AND Project_name = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, Camera_name);
			preparedStatement.setString(2, Projet_Name);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				CameraError cameraError = new CameraError();
				cameraError.setCamera_ID(resultSet.getInt("Camera_ID"));
				cameraError.setCamera_name(resultSet.getString("Camera_name"));
				cameraError.setIP_address(resultSet.getString("IP_address"));
				cameraError.setStastus(resultSet.getString("Status"));
				cameraError.setProject_ID(resultSet.getInt("Project_ID"));
				cameraError.setError_type(resultSet.getString("Error_type"));
				cameraError.setdescript(resultSet.getString("descript"));
				list.add(cameraError);
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
		CameraErrorRepository cam = new CameraErrorRepository();
		List<CameraError> list = cam.getCameraAndError("Camera1" , "SiteA");
		for(CameraError o : list) {
			System.out.println(o);
		}
	}

}
