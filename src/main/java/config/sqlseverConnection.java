
package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class sqlseverConnection {
	public static Connection getConnection() {
		Connection connection= null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://LAPTOP-B13JTCSN\\BAOPC:1433;databaseName=PBL3;encrypt=true;trustServerCertificate=true";
            String username="sa";
            String password="123456789";
            return DriverManager.getConnection(url,username,password);
        }catch(Exception e){
            e.printStackTrace();
        }
		return connection;
	}
}