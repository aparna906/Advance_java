<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page errorPage="error.jsp" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Update</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
				crossorigin="anonymous">
		</head>

		<body>
			<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand">Update Your Data</a>
					<form class="d-flex"></form>
				</div>
			</nav>
			<div class="container">
				<br>

				<form action="delete" method="post">
					<div class="form-row">

						<div class="form-group">
							<label for="inputAddress">partyId</label>
							<input type="text" class="form-control" id="inputAddress" name="partyId">
						</div>

						<div class="form-group">
							<label for="inputAddress">FirstName</label>
							<input type="text" class="form-control" id="inputAddress" name="firstName">
						</div>
						<div class="form-group">
							<label for="inputAddress">LastName</label>
							<input type="text" class="form-control" id="inputAddress" name="lastName">
						</div>
						<div class="form-group ">
							<label for="inputState">Address</label>
							<input type="text" class="form-control" id="inputCity" name="address">
						</div>
						<div class="form-group ">
							<label for="inputState" name="city">City</label>
							<input type="text" class="form-control" id="inputCity" name="city">

						</div>
						<div class="form-group ">
							<label for="inputZip">Zip</label>
							<input type="text" class="form-control" id="inputZip" name="zip">
						</div>


						<div class="form-group">
							<label for="inputAddress">State</label>
							<input type="text" class="form-control" id="inputAddress" name="state">
						</div>

						<div class="form-group ">
							<label for="inputZip">Country</label>
							<input type="text" class="form-control" id="inputZip" name="country">
						</div>

						<div class="form-group ">
							<label for="inputZip">Phone</label>
							<input type="text" class="form-control" id="inputZip" name="phone">
						</div>

						</br>

					</div>


					<button type="submit" class="btn btn-primary">Update</button>
					<a href="display.jsp"><button type="button" class="btn btn-primary btn-sm">Back</button></a>
					<a href="login.jsp"><button type="button" class="btn btn-primary btn-sm">logout</button></a>
				</form>
		</body>

		</html>