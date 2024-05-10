package repository;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.CameraProject;

public class CameraProjectRepository {
	public List<CameraProject> getCameraAndProject() {
		List<CameraProject> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "SELECT Cameras.Camera_ID, Cameras.Camera_name, Cameras.IP_address, Cameras.Status, Project.Project_name, Project.Project_address\r\n"
				+ "FROM Cameras\r\n"
				+ "INNER JOIN Project ON Cameras.Project_ID = Project.Project_ID;";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				CameraProject cameraproject = new CameraProject();
				cameraproject.setCamera_ID(resultSet.getInt("Camera_ID"));
				cameraproject.setCamera_name(resultSet.getString("Camera_name"));
				cameraproject.setIP_address(resultSet.getString("IP_address"));
				cameraproject.setStastus(resultSet.getString("Status"));
				cameraproject.setProject_name(resultSet.getString("Project_name"));
				cameraproject.setProject_address(resultSet.getString("Project_address"));
				list.add(cameraproject);
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
//	public static void main(String[] args) {
//		CameraProjectRepository cam = new CameraProjectRepository();
//		List<CameraProject> list = cam.getCameraAndProject();
//		for (CameraProject o : list) {
//			System.out.println(o);
//		}
//	}
	

}
