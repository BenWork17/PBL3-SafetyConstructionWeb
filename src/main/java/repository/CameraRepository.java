package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.sqlseverConnection;
import model.Camera;

public class CameraRepository {

	public List<Camera> getCamera() {
		List<Camera> list = new ArrayList<>();
		Connection connection = sqlseverConnection.getConnection();
		String query = "select * from Camera";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Camera camera = new Camera();
				camera.setCamera_ID(resultSet.getInt("Camera_IB"));
				camera.setCamera_name(resultSet.getString("Camera_name"));
				camera.setIP_address(resultSet.getString("IP_address"));
				camera.setStastus(resultSet.getString("Status"));
				camera.setProject_ID(resultSet.getInt("Project_ID"));
				list.add(camera);
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
