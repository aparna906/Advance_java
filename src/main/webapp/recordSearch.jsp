<%@page import="java.sql.DriverManager" %>
  <%@page import="java.sql.ResultSet" %>
    <%@page import="java.sql.Statement" %>
      <%@page import="java.sql.Connection" %>
        <link rel="stylesheet" href="display.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
          id="bootstrap-css">

        <% String driver="com.mysql.cj.jdbc.Driver" ; String url="jdbc:mysql://localhost:3306/aparna" ; String
          username="root" ; String password="123456" ; String firstName=request.getParameter("firstName"); try {
          Class.forName(driver); } catch (ClassNotFoundException e) { e.printStackTrace(); } Connection connection=null;
          Statement statement=null; ResultSet resultSet=null; %>
          <!DOCTYPE html>
          <html>

          <body>
            <h1>Search Data</h1>
            <a href="search.jsp"><button type="button" class="btn btn-primary btn-sm">Back</button></a>
            <a href="login.jsp"><button type="button" class="btn btn-primary btn-sm">logout</button></a>
            <br><br>
            <table border="1">
              <tr>
                <td>firstName</td>
                <td>lastName</td>
                <td>address</td>
                <td>city</td>
                <td>zip</td>
                <td>state</td>
                <td>country</td>
                <td>phone</td>

              </tr>
              <% try{ connection=DriverManager.getConnection(url, username, password);
                statement=connection.createStatement(); String
                sql="SELECT * FROM party Natural Join userlogin where firstName = 'Monika' and lastName='Singh'" ;
                resultSet=statement.executeQuery(sql); while(resultSet.next()){ %>

                <tr>
                  <td>
                    <%=resultSet.getString("firstName") %>
                  </td>
                  <td>
                    <%=resultSet.getString("lastName") %>
                  </td>
                  <td>
                    <%=resultSet.getString("address") %>
                  </td>
                  <td>
                    <%=resultSet.getString("city") %>
                  </td>
                  <td>
                    <%=resultSet.getInt("zip") %>
                  </td>
                  <td>
                    <%=resultSet.getString("state") %>
                  </td>
                  <td>
                    <%=resultSet.getString("country") %>
                  </td>
                  <td>
                    <%=resultSet.getString("phone") %>
                  </td>

                </tr>
                <% } connection.close(); } catch (Exception e) { e.printStackTrace(); } %>
            </table>
          </body>

          </html>