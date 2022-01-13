<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
    <title>Search Result</title>
</head>

<body>
  <nav class="navbar navbar-dark bg-dark">
          <div class="container">
              <span class="navbar-brand mb-0 h1"></span>
              <a href="signup.html" class="btn btn-outline-danger" role="button">Logout</a>
          </div>
      </nav>

      <div class="container">
              <div class="row">
                  <%

                      ArrayList<String> list = (ArrayList<String>) request.getAttribute("search");
                      Iterator iterator = list.iterator();
                  %>
                  <div class="card col-3">
                      <%

                          while(iterator.hasNext())
                              out.println(iterator.next());
                      %>
                          <div class="card-body"> </div>

                  </div>
              </div>

          </div>
</body>
</html>