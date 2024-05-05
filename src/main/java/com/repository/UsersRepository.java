package com.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.config.sqlseverconnection;
import com.model.Users;

public class UsersRepository {
	public List<Users> getUserByUsernameAndPassWork(String username, String password) {
		List<Users> list = new ArrayList<>();
		Connection connection = sqlseverconnection.getConnection();
		String query = "Select * from Users u where u.Users_name = ? and u.Pass_word = ? ";
		try {
			PreparedStatement prepareStatment = connection.prepareStatement(query);
			prepareStatment.setString(1, username);
			prepareStatment.setString(2, password);
			ResultSet resultSet = prepareStatment.executeQuery();
			while(resultSet.next() ){
				Users user = new Users();
				user.setUsers_ID(resultSet.getInt("Users_ID"));
				user.setUsers_name(resultSet.getString("Users_name"));
				user.setEmail(resultSet.getString("Email"));
				user.setPhone(resultSet.getString("Phone"));
				user.setPass_word(resultSet.getString("Pass_word"));
				user.setUser_Role(resultSet.getString("User_Role"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}

}
