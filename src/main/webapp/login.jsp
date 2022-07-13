<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="CiberRosario">
	<meta name="description" content="CiberRosario es una empresa dedicada a brindar el servicio de computadoras para jugar, desarrollar y stremear.">
	<meta name="keywords" content="ciber, rosario ciber, computadora ciber, ciber computadora, ciber torneo">
	<meta name="copyright" content="CiberRosario inc.">
	<title>CiberRosario</title>
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<link rel="stylesheet" type="text/css" href="styles/normalize.css">
	
	
</head>
<body>
	<div>
		<h1>Iniciar sesion</h1>
		<h2>Completa los campos.</h2>
		<form id="form-login" action="login" method="post">
				<p class="error">${error}</p>
				<label for="username" class="labels">Email: </label>
				<input id="username" type="text" name="email" placeholder="example@example.com" required> <br>


				<label for="password" class="labels">Password: </label>
				<input id="password" type="password" name="password" placeholder="password" required>

				<input id="btn form-login" type="submit" value="Enviar">
				<p>No estas registrado? <a href="signup.jsp">Registrarse</a></p>
		</form>
	</div>
	<a href="index.jsp">Volver</a>
	
</body>
</html>