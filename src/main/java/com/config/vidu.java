package com.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class vidu {
	public static void main (String[] args) {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://LAPTOP-B13JTCSN\\BAOPC:1433;databaseName=PBL3;encrypt=true;trustServerCertificate=true";
			String username="sa";
			String password="123456789";
			Connection connection =DriverManager.getConnection(url,username,password);
			System.out.print("ok");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
