package Dao;

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
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/delete")
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("userId") != null) {
            String userId = (String) session.getAttribute("userId");
            System.out.println(userId);

            try {

                Connection con = DbConnection.createConnection();
                Statement statement = con.createStatement();
                String query= "DELETE userlogin,party FROM userlogin INNER JOIN party ON party.partyId = userlogin.partyId " +
                "WHERE  userlogin.userLoginId ='" + userId + "'";
                System.out.println(query);
                statement.executeUpdate(query);
                session.invalidate();

                req.setAttribute("error", "Deleted Your Record");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("signup.jsp");
                requestDispatcher.forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            resp.sendRedirect("/login.jsp");
        }
    }
}

