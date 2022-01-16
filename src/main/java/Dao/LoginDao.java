package Dao;

import Model.LoginPojo;

import javax.servlet.http.HttpServlet;
import java.sql.*;

public class LoginDao extends HttpServlet {
    public boolean authorizeLogin(LoginPojo login) {
        String userId = login.getUserId();
        String password = login.getPassword();

        String url = "jdbc:mysql://localhost:3306/aparna" ;
        String username = "root" ;
        String passwrd = "123456" ;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, passwrd);

            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select userLoginId, password from userlogin");


            if (rs != null) {
                while (rs.next()) {
                    String dbuserid = rs.getString("userLoginId");
                    String dbpassword = rs.getString("password");

                    if (userId.equalsIgnoreCase(dbuserid) && password.equals(dbpassword)) {
                        return true;

                    }
                }
            }
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
}
