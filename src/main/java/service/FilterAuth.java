package service;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class FilterAuth implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
       HttpServletRequest req = (HttpServletRequest) servletRequest;
       HttpSession httpSession = req.getSession();
       String user= (String) httpSession.getAttribute("userId");

       if( user != null ){
           filterChain.doFilter(servletRequest, servletResponse);
       }
       else{
           RequestDispatcher requestDispatcher = servletRequest.getRequestDispatcher("login.jsp");
           servletRequest.setAttribute("wrongLoginMsg", "Please login first");
           requestDispatcher.include(servletRequest, servletResponse);
       }
    }
}
