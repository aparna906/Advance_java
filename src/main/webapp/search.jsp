<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

    <div class="container">

   <br>
   <br>
    <div class="row justify-content-center">
    <div class="col-md-6">
    <div class="card">
    <header class="card-header">
    	<a href="" class="float-right btn btn-outline-primary mt-1">Log in</a>
    	<h4 class="card-title mt-2">Search</h4>
    </header>
    <article class="card-body">

      <form action="search" method="post" >
    	<div class="form-row">
    		<div class="col form-group">
    			<label>First name </label>
    		  	<input type="text" class="form-control" placeholder="First Name" name="firstName">
    		</div>

    		<div class="col form-group">
    			<label>Last name</label>
    		  	<input type="text" class="form-control" placeholder="Last Name" name="lastName">
    		</div>
    	</div>

    	 <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block"> Search  </button>
            </div>
            </div>
</body>
</html>