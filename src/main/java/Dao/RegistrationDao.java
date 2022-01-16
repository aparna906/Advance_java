package Dao;

import Model.LoginPojo;
import Model.RegistrationPojo;
import service.DbConnection;

import java.sql.*;

public class RegistrationDao {
    public static boolean saveData(RegistrationPojo registrationPojo, LoginPojo loginPojo) {

        try {
            Connection con = DbConnection.createConnection();

            String UserId = loginPojo.getUserId();
            String password = loginPojo.getPassword();

            String checkEmail = "select userLoginId from userlogin" ;
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(checkEmail);

            boolean flag = true;
            while (resultSet.next()) {
                if (resultSet.getString("userLoginId").equalsIgnoreCase(UserId)) {
                    flag = false;
                    return false;
                }
            }

            if (flag) {
                Statement statement1 = con.createStatement();
                ResultSet resultSet1 = statement1.executeQuery("select MAX(partyId) as partyId from party");
                int partyId = -1;

                if (resultSet1 != null) {
                    while (resultSet1.next()) {
                        partyId = (resultSet1.getInt("partyId")) + 1;
                    }
                }
                statement1.close();

                PreparedStatement ps = con.prepareStatement("INSERT INTO `aparna`.`party` " + "(partyId, firstName, lastName, address, city, zip, state, country, phone) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);\n");
                ps.setInt(1, partyId);
                ps.setString(2, registrationPojo.getFirstName());
                ps.setString(3, registrationPojo.getLastName());
                ps.setString(4, registrationPojo.getAddress());
                ps.setString(5, registrationPojo.getCity());
                ps.setInt(6, registrationPojo.getZip());
                ps.setString(7, registrationPojo.getState());
                ps.setString(8, registrationPojo.getCountry());
                ps.setString(9, registrationPojo.getPhone());

                PreparedStatement ps1 = con.prepareStatement("INSERT INTO `aparna`.`userlogin` " + "(`userLoginId`, `password`, `partyId`) VALUES (?,?,?);");
                ps1.setString(1, UserId);
                ps1.setString(2, password);
                ps1.setInt(3, partyId);

                ps.executeUpdate();
                ps.close();

                ps1.executeUpdate();
                ps1.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
