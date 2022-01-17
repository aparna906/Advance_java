<%@page import="java.sql.DriverManager" %>
    <%@page import="java.sql.ResultSet" %>
        <%@page import="java.sql.Statement" %>
            <%@page import="java.sql.Connection" %>

                <head>
                    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
                        id="bootstrap-css">
                    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
                    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                        crossorigin="anonymous">
                    <title>search</title>
                </head>
            <html>
              <body>
                 <center><h3>You Search User<h3></center>

                    <center>
                    <% String name1=request.getParameter("name1");
                       String name2=request.getParameter("name2");
                       out.println(""+name1+ " " +name2);
                        session.setAttribute(" user1",name1);
                        session.setAttribute("user2",name2);
                         %>
                   </center>
                                <% 
                                    String driver="com.mysql.cj.jdbc.Driver" ; 
                                    String url="jdbc:mysql://localhost:3306/aparna" ;
                                    String username="root" ; String password="123456" ; 
                                    try { Class.forName(driver); } catch
                                    (ClassNotFoundException e) { e.printStackTrace();
                                    } 
                                    Connection connection=null; Statement
                                    statement=null; ResultSet resultSet=null;
                                %>
                        <div>
                        </div>
                        
                        
                        <header class="card-header">
                            <a href="login.jsp" class="float-right btn btn-outline-secondary mt-1">Log out</a>
                            <a href="search.jsp" class="float-right btn btn-outline-secondary mt-1">Back</a>
                            <h4 class="card-title mt-5"></h4>
                        </header>
                        <br>


                                    <%
                                     try{ connection=DriverManager.getConnection(url, username, password);
                                        statement=connection.createStatement();
                                        System.out.println(request.getParameter("name1"));
                                        System.out.println(request.getParameter("name2")); 
                                        fname=request.getParameter("name1"); 
                                        String lname=request.getParameter("name2");
                                        String sql="SELECT * FROM party p join userlogin ul on p.partyId = ul.partyId WHERE firstName ='"
                                        + fname + "' AND lastName='" + lname + "'" ;
                                        resultSet=statement.executeQuery(sql);
                                        while(resultSet.next()){
                                     %>
                    <center>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <table border="4">
                    <tbody>
                        <tr class="table-warning">
                            <th scope="row">First Name : </th>
                            <td>
                                <%=resultSet.getString("firstName") %>
                            </td>
                        </tr>

                        <tr class="table-secondary">
                            <th scope="row">Last Name : </th>
                            <td>
                                <%=resultSet.getString("lastName") %>
                            </td>
                        <tr class="table-info">

                        <tr class="table-success">
                            <th scope="row">Address : </th>
                            <td>
                                <%=resultSet.getString("address") %>
                            </td>
                        </tr>


                        <tr class="table-danger">
                            <th scope="row">City : </th>
                            <td>
                                <%=resultSet.getString("city") %>
                            </td>
                        </tr>


                        <tr class="table-light">
                            <th scope="row">Zip : </th>
                            <td>
                                <%=resultSet.getInt("zip") %>
                            </td>
                        </tr>


                        <tr class="table-secondary">
                            <th scope="row">State : </th>
                            <td>
                                <%=resultSet.getString("state") %>
                            </td>
                        </tr>


                        <tr class="table-warning">
                            <th scope="row">Country : </th>
                            <td>
                                <%=resultSet.getString("country") %>
                            </td>
                        </tr>


                        <tr class="table-danger">
                            <th scope="row">Phone : </th>
                            <td>
                                <%=resultSet.getString("phone") %>
                            </td>
                        </tr>


                        <tr class="table-primary">
                            <th scope="row">Email Id : </th>
                            <td>
                                <%=resultSet.getString("userLoginId") %>
                            </td>

                        </tr>


                    </tbody>
                </table>
                </center>
            </div>
        </div>

<%}
  connection.close();
   } catch (Exception e) {
    e.printStackTrace();
    } %>
     </table>
   </body>
</html>