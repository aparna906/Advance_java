<%@page errorPage="error.jsp" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Login Page</title>
  </head>

  <nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div>
  </div>
  <main class="login-form">
    <div class="cotainer">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header"><b>Welcome , </b> Please Login</div>
            <div class="card-body">

              <form action="login" name="login" method="post">
                <div class="form-group row">
                  <label for="userid" class="col-md-4 col-form-label text-md-right">User Email id</label>
                  <div class="col-md-6">
                    <input type="text" id="email_address" class="form-control" name="userId" required autofocus>
                  </div>
                </div> <br>
                <div class="form-group row">
                  <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                  <div class="col-md-6">
                    <input type="password" id="password" class="form-control" name="password" required>
                    <span style="color:red;">
                      <% if(null!=request.getAttribute("wrongLoginMsg")) {
                        out.println(request.getAttribute("wrongLoginMsg")); } %>
                    </span>
                  </div>
                  <br><br>

                  <div class="col-md-6 offset-md-4">
                    <a href="display.jsp"><button type="submit" class="btn btn-outline-primary b1"><b> Login </b></button></a>
                  </div>
                  <a href="signup.jsp">

                    <h6>New user? Create an account</h6>
                  </a>


                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  </body>

  </html>