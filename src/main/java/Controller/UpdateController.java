package Controller;

import service.DbConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/Update")
public class UpdateController extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            Connection con = DbConnection.createConnection();
            int partyId = Integer.parseInt(req.getParameter("partyId"));

            String query = "UPDATE party SET  firstName = ?, lastName = ?, city = ?, state = ?, " + "country = ?, phone = ? WHERE partyId =" + partyId;

            PreparedStatement statement = con.prepareStatement(query);
            System.out.println(req.getParameter("partyId"));


            statement.setString(1, req.getParameter("firstName"));
            statement.setString(2, req.getParameter("lastName"));
            statement.setString(3, req.getParameter("city"));
            System.out.println(req.getParameter("city"));
            // statement.setInt(4, Integer.parseInt(req.getParameter("zip")));
            statement.setString(4, req.getParameter("state"));
            System.out.println(req.getParameter("state"));
            statement.setString(5, req.getParameter("country"));
            System.out.println(req.getParameter("country"));
            statement.setString(6, req.getParameter("phone"));
            System.out.println(req.getParameter("phone"));
            statement.executeUpdate();
            con.close();

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("display.jsp");
            requestDispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
