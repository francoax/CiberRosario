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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<!-- <link rel="stylesheet" type="text/css" href="styles/normalize.css">-->
	
	
</head>
<body>
	<div class="container">
		<form class="box" action="login" method="post">
			<div class="field">
				<label class="label">Email</label>
				<div class="control has-icons-left">
					<input class="input" type="email" required="required" placeholder="tuemail@example.com" name="email">
					<span class="icon is-small is-left">
						<i class="fas fa-envelope"></i>
					</span>
				</div>
				<p class="help">Ingresa tu correo</p>
			</div>
			<div class="field">
				<label class="label">Password</label>
				<div class="control has-icons-left">
					<input class="input" type="password" required="required" placeholder="password" name="password">
					<span class="icon is-small is-left">
						<i class="fas fa-user"></i>
					</span>
				</div>
				<p class="help">Ingresa tu contraseña</p>
			<div class="field">
				<div class="control">
					<input class="button" type="submit" value="Ingresar">
				</div>
			</div>
			</div>
		</form>
	</div>
</body>
</html>