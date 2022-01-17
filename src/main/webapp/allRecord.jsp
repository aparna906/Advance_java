
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
 <!DOCTYPE html>
            <html lang="en">

            <head>
              <meta charset="UTF-8">
              <meta http-equiv="X-UA-Compatible" content="IE=edge">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Records</title>

              <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
                id="bootstrap-css">
          </head>
<%
 String firstName = request.getParameter("firstName");
 String lastName = request.getParameter("lastName");

 String driver = "com.mysql.cj.jdbc.Driver";
 String url = "jdbc:mysql://localhost:3306/aparna" ;
 String username = "root" ;
 String password = "123456" ;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h1>All User Records</h1>
<br>
 <a href="search.jsp"><button type="button" class="btn btn-primary btn-sm">Back</button></a>
  <a href="login.jsp"><button type="button" class="btn btn-primary btn-sm">Logout</button></a>
  <br><br>


<table border="1">
<tr>
<td> First name </td>
<td> last name </td>
<td> Address </td>
<td> City </td>
<td> Zip </td>
<td> State </td>
<td> Country </td>
<td> Phone </td>
</tr>

<%
try{
con = DriverManager.getConnection(url, username, password);
statement=con.createStatement();
String sql ="select * from party ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("firstName") %></td>
<td><%=resultSet.getString("lastName") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("zip") %></td>
<td><%=resultSet.getString("state") %></td>
<td><%=resultSet.getString("country") %></td>
<td><%=resultSet.getString("phone") %></td>


</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>


</body>
</html>