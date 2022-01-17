<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page import="javax.servlet.http.*" %>
    <%@page import="java.sql.*" %>
      <%@page import="java.sql.Connection" %>
        <%@page import="java.sql.DriverManager" %>
          <%@page import="java.sql.ResultSet" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
              <meta charset="UTF-8">
              <meta http-equiv="X-UA-Compatible" content="IE=edge">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Profile</title>
              <link rel="stylesheet" href="display.css">
              <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
                id="bootstrap-css">
              <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
              <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">

            </head>

            <body>
              <div class="col-lg-8 mx-auto p-2 py-md-1">
                <header class="d-flex align-items-center pb-3 mb-3 border-bottom">
                  <span class="fs-1"></span>
                </header>
                <a href="login.jsp"><button type="button" class="btn btn-primary btn-sm">Logout</button></a>

                <% String userId=(String) session.getAttribute("userId");
                   String password="" ;
                   String firstName="" ;
                   String lastName="" ;
                   String city="" ; String zip="" ;
                   String state="" ; String country="" ;
                   String phone="" ;
                   String partyId="" ;
                   try {
                   Connection connection=null;
                    try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/aparna", "root" , "123456" );
                    }catch (SQLException sqlException){ sqlException.getMessage();
                   }
                    String query="select userLoginId from userlogin" ;
                    Statement statement=connection.createStatement();
                    ResultSet resultSet=statement.executeQuery(query);
                    while(resultSet.next()){
                    if(resultSet.getString("userLoginId").equalsIgnoreCase(userId)){
                    String dbquery="select * from party natural join userlogin where userLoginId = ?" ;
                    PreparedStatement  preparedStatement=connection.prepareStatement(dbquery);
                    preparedStatement.setString(1, userId);
                    ResultSet resultSet1=preparedStatement.executeQuery();
                    if(resultSet1.next()){
                    firstName=resultSet1.getString("firstName");
                    lastName=resultSet1.getString("lastName");
                    city=resultSet1.getString("city");
                    zip=resultSet1.getString("zip");
                    state=resultSet1.getString("state");
                    country=resultSet1.getString("country");
                    phone=resultSet1.getString("phone");
                    partyId=resultSet1.getString("partyId");
                  }
                }
              }
            }
                    catch(ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    }
                %>


                  <div class="container register">
                    <div class="text-right">
                      <div class="button">
                        <a href="search.jsp"><button type="button"
                          class="btn btn-outline-success btn-lg">Search</button></a>
                        <a href="update.jsp"><button type="button"
                            class="btn btn-outline-secondary btn-lg">Update</button></a>



                        <div class="col-11">
                          <PRE></PRE>
                          <button type="button" class="btn btn-outline-danger btn-lg" data-bs-toggle="modal"
                            data-bs-target="#deleteModal">
                            Delete
                          </button>

                          <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">Delete Profile</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                                   </div>
                                  <div class="modal-body">
                                  Are you sure you want to delete your profile? You will have to register again to
                                  access your profile.
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary btn-sm"
                                    data-bs-dismiss="modal">Close</button>
                                  <a class="btn btn-danger btn-sm" href="/delete" role="button">Delete</a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-4 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
                        <h3>Welcome to Your Profile</h3>
                        <h3 class="text-color mb-3">
                          <%= firstName%>

                          <%= lastName%>
                        </h3>


                        <br><br>

                      </div>
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                          <div class="form-group">
                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2"></span
                                class="text">
                              <b>Email : </b>
                              <%= userId%>
                              <b>Phone : </b>
                              <%= phone%>
                            </p>
                          </div>

                          <div class="form-group">
                            <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2"></span
                                class="text-colors">
                              <b> City : </b>
                              <%= city%>
                                <b> Zip : </b>
                              <%= zip%>
                                  </span>
                            </p>
                          </div>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                          <p class="small mb-0"><i class="far fa-star fa-lg"></i> <span class="mx-2"></span
                              class="text-colors">
                            <b> State :</b>
                            <%= state%>
                              <b> Country : </b>
                              <%= country%>
                                </span>
                          </p>
                        </div>
                      </div>
                    </div>


                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                      crossorigin="anonymous"></script>

            </body>

            </html>