package Controller;

import Dao.RegistrationDao;
import Model.LoginPojo;
import Model.RegistrationPojo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/registration")
public class RegistrationController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        int zip = Integer.parseInt(request.getParameter("zip"));
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String phone = request.getParameter("phone");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        RegistrationPojo registrationPojo = new RegistrationPojo();
        LoginPojo loginPojo = new LoginPojo();

        registrationPojo.setFirstName(firstName);
        registrationPojo.setLastName(lastName);
        registrationPojo.setAddress(address);
        registrationPojo.setCity(city);
        registrationPojo.setZip(zip);
        registrationPojo.setState(state);
        registrationPojo.setCountry(country);
        registrationPojo.setPhone(phone);

        loginPojo.setUserId(userId);
        loginPojo.setPassword(password);

        boolean registerValidate = false;
        registerValidate = RegistrationDao.saveData(registrationPojo, loginPojo);
        if (registerValidate) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
            HttpSession httpSession = request.getSession(true);
            httpSession.setAttribute("userId", userId);
            httpSession.setAttribute("password", password);
            httpSession.setAttribute("firstName", registrationPojo.getFirstName());
            httpSession.setAttribute("lastName", registrationPojo.getLastName());
            httpSession.setAttribute("address", address);
            httpSession.setAttribute("city", registrationPojo.getCity());
            httpSession.setAttribute("zip", registrationPojo.getZip());
            httpSession.setAttribute("state", registrationPojo.getState());
            httpSession.setAttribute("country", registrationPojo.getCountry());
            httpSession.setAttribute("phone", registrationPojo.getPhone());
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher rd1 = request.getRequestDispatcher("signup.jsp");
            request.setAttribute("wrongLoginMsg", "Already Exist");
            rd1.forward(request, response);

        }
    }
}

