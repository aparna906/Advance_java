package Dao;

import Model.LoginPojo;

import java.sql.*;

public class LoginDao {
    public boolean authorizeLogin(LoginPojo login) {
        String userId = login.getUserId();
        String password = login.getPassword();

        String url = "jdbc:mysql://localhost:3306/aparna";
        String username = "root";
        String passwrd = "123456";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, passwrd);

            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select userLoginId, password from userlogin");
            System.out.println(rs);

            if (rs != null) {
                while (rs.next()) {
                    String dbuserid = rs.getString("userLoginId");
                    String dbpassword = rs.getString("password");
                    System.out.println(dbuserid + dbpassword);

                    if (userId.equalsIgnoreCase(dbuserid) && password.equals(dbpassword)) {
                        System.out.println("Match Found");
                        return true;
                    }
                }
            }
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Match not found");
        return false;
    }
}
