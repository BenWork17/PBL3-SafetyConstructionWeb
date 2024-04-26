package vidu;


import java.sql.Connection;
import java.sql.DriverManager;


public class application {
    public static void main(String[] args){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://SQLEXPRESS:1433:databaseName:pbl3";
            String username="sa";
            String password="0282580";
            Connection con=DriverManager.getConnection(url,username,password);
            System.out.println("ok");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}