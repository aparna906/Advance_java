<!DOCTYPE html>
<html lang="en">

<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
  <meta charset="UTF-8">
  <title>Title</title>
</head>

<body>

  <div class="container">
    <br><br>
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <header class="card-header">
            <a href="login.jsp" class="float-right btn btn-outline-secondary mt-1">Log out</a>
            <a href="display.jsp" class="float-right btn btn-outline-secondary mt-1">Back</a>
            <h4 class="card-title mt-2">Search</h4>
          </header>
          <article class="card-body">

            <form action="welcome.jsp" method="post">
              <div class="form-row">
                <div class="col form-group">
                  <label>First name </label>
                  <input type="text" class="form-control" placeholder="First Name" name="name1">
                </div>

                <div class="col form-group">
                  <label>Last name</label>
                  <input type="text" class="form-control" placeholder="Last Name" name="name2">
                </div>
              </div>

              <div class="form-group">
                <button type="submit" class="btn btn-primary btn-lg">Search</button>
                <a href="allRecord.jsp"><button type="button" class="btn btn-primary btn-lg">All Record</button></a>


              </div>
            </form>
          </article>
</body>

</html>