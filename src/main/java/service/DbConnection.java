package service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
    public static Connection createConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/aparna" ;
        String username = "root" ;
        String password = "123456" ;

        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            con = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;

    }
}
