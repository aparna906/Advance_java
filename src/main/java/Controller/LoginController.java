package Controller;

import Dao.LoginDao;
import Model.LoginPojo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static java.lang.System.out;


@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        LoginPojo login = new LoginPojo(userId, password);
        LoginDao logindao = new LoginDao();
        Boolean authorize = (logindao.authorizeLogin(login));

        if (authorize) {
            HttpSession session = request.getSession(true);
            session.setAttribute("userId", login.getUserId());

            RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            request.setAttribute("wrongLoginMsg", "userid or password not correct..try again!");
            rd.include(request, response);
        }

    }
}
