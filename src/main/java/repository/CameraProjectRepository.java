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
	public int addCameraProject(String Camera_name, String IP_address,String Status,String Project_Name) {
		Connection connection = sqlseverConnection.getConnection();
		String query = "DECLARE @site_id INT"
				+ "SET @siteB_id = (SELECT Project_ID FROM Project WHERE Project_name = ?)\r\n"
				+ "INSERT INTO Cameras (Camera_name, IP_address, Status, Project_ID) VALUES\r\n"
				+ "(?, ?, ?, @siteA_id)";
		int isAdd =0;
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, Project_Name);
			preparedStatement.setString(2, Camera_name);
			preparedStatement.setString(3, IP_address);
			preparedStatement.setString(4, Status);

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
	public int DeleteCameraProjectByID(int id) {
		Connection connection = sqlseverConnection.getConnection();
		String query = "DELETE FROM Cameras WHERE Camera_ID = ?";
		
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
//	public List<CameraProject> getCameraAndProjectByProjectName(String Project_name) {
//		List<CameraProject> list = new ArrayList<>();
//		Connection connection = sqlseverConnection.getConnection();
//		String query = "SELECT Cameras.Camera_ID, Cameras.Camera_name, Cameras.IP_address, Cameras.Status, Project.Project_name, Project.Project_address\r\n"
//				+ "FROM Cameras\r\n"
//				+ "INNER JOIN Project ON Cameras.Project_ID = Project.Project_ID\r\n"
//				+ "WHERE Project.Project_name = ?"
//				;
//		try {
//			PreparedStatement preparedStatement = connection.prepareStatement(query);
//			preparedStatement.setString(1, Project_name);
//			ResultSet resultSet = preparedStatement.executeQuery();
//			while (resultSet.next()) {
//				CameraProject cameraproject = new CameraProject();
//				cameraproject.setCamera_ID(resultSet.getInt("Camera_ID"));
//				cameraproject.setCamera_name(resultSet.getString("Camera_name"));
//				cameraproject.setIP_address(resultSet.getString("IP_address"));
//				cameraproject.setStastus(resultSet.getString("Status"));
//				cameraproject.setProject_name(resultSet.getString("Project_name"));
//				cameraproject.setProject_address(resultSet.getString("Project_address"));
//				list.add(cameraproject);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (connection != null) {
//					connection.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return list;
//	}
	
	public static void main(String[] args) {
		CameraProjectRepository cam = new CameraProjectRepository();
		List<CameraProject> list = cam.getCameraAndProject();
		for (CameraProject o : list) {
			System.out.println(o);
		}
	}


}
