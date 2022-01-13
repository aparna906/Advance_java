<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.http.*" %>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Profile</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    </head>

    <body>
      <div class="col-lg-8 mx-auto p-3 py-md-5">
        <header class="d-flex align-items-center pb-3 mb-5 border-bottom">
          <span class="fs-4">Welcome to your Profile</span>
          <br>
        </header>

        <%
          String userId = (String) session.getAttribute("userId");
          String password = (String) session.getAttribute("password");
          String firstName = ""
          String lastName = ""
          String address = ""
          String city = ""
          String zip = ""
          String state = ""
          String country = ""
          String phone = ""
          try{
          Connection con = null;
            try{
              Class.forName("com.mysql.cj.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aparna", "root", "123456");
              System.out.println("Connecting...!!!");
              }catch (SQLException sqlException){
                sqlException.getMessage();
              }
          Statement st = con.createStatement();
          ResultSet result = st.executeQuery("select userLoginId, password from userlogin");

          while(result.next()){
          if(result.getString("userLoginId").equalsIgnoreCase(userId)
               && result.getString("paswword").equalsIgnoreCase(password)){
               String query = "select * from party natural join userlogin where userLoginId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(dbquery);
                preparedStatement.setString(1, userId);
                ResultSet resultSet = preparedStatement.executeQuery();

                if(resultSet1.next()){
                   firstName = resultSet1.getString("firstName");
                   lastName = resultSet1.getString("lastName");
                   city = resultSet1.getString("city");
                   zip = resultSet1.getString("zip");
                   state = resultSet1.getString("state");
                   country = resultSet1.getString("country");
                   phone = resultSet1.getString("phone");
                   partyId = resultSet1.getString("partyId");
                   }
                   request.getSession();
                   session.setAttribute("userId", userId);
                   session.setAttribute("password", password);
                   session.setAttribute("firstName", firstName);
                   session.setAttribute("lastName", lastName);
                   session.setAttribute("city", city);
                   session.setAttribute("zip", zip);
                   session.setAttribute("state", state);
                   session.setAttribute("country", country);
                   session.setAttribute("phone", phone);
                   session.setAttribute("partyId", partyId);
                  }
                }
              } catch (ClassNotFoundException | SQLException e) {
                   e.printStackTrace();
                 }
                %>



