package com.config;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class sqlseverconnection {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://LAPTOP-B13JTCSN\\BAOPC:1433;databaseName=PBL3;encrypt=true;trustServerCertificate=true";
			String username="sa";
			String password="123456789";
			return DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

}
