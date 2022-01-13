package Controller;

import service.DbConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/search")
public class Search extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        try {
            Connection con = DbConnection.createConnection();
            Statement statement = con.createStatement();
            //ResultSet resultSet = statement.executeQuery("select firstName,lastName from party");
            ResultSet resultSet = statement.executeQuery("select firstName, lastName from party");
            System.out.println();
            ArrayList<String>search = new ArrayList<>();

            while (resultSet.next()){
                if(resultSet.getString("firstName").equalsIgnoreCase(firstName)
                        && resultSet.getString("lastName").equalsIgnoreCase(lastName)){

                    ResultSet resultSet1 = statement.executeQuery("query");
                    System.out.println("Query executed");

                    if(resultSet1.next()){
                        String userId = resultSet1.getString("userLoginId");
                        // String address = resultSet1.getString("address");
                        String city = resultSet1.getString("city");
                        int zip = resultSet1.getInt("zip");
                        String state = resultSet1.getString("state");
                        String country = resultSet1.getString("country");
                        int phone = resultSet1.getInt("phone");

                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("userLoginId",userId);
                        //httpSession.setAttribute("address",address);
                        httpSession.setAttribute("firstName",firstName);
                        httpSession.setAttribute("LastName",lastName);
                        httpSession.setAttribute("city",city);
                        httpSession.setAttribute("zip",zip);
                        httpSession.setAttribute("state", state);
                        httpSession.setAttribute("country", country);
                        httpSession.setAttribute("phone",phone);
                    }

                    RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
                    rd.forward(request,response);
                }
            }
            request.setAttribute("search",search);
            request.getRequestDispatcher("/data.jsp").forward(request,response);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}