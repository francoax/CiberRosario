<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
	%>
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
	<link rel="icon" href="images/pc.gif">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<header class="container" style="margin-top: 20px; border-bottom: 2px solid black;">
		<nav class="navbar has-background-light" role="navigation" aria-label="main navigation">
			<div class="navbar-brand">
				<a href="index.jsp" class="navbar-item">
					<img alt="logociberrosario" src="images/ordenador.png">
				</a>
			</div>
			<div class="navbar-menu">
				<div class="navbar-start">
					<a href="index.jsp" class="navbar-item">
						Inicio
					</a>
					<a href="bookings.jsp" class="navbar-item">
						Reservas
					</a>
					<a href="torneos.jsp" class="navbar-item">
						Torneos
					</a>
				</div>
				<div class="navbar-end">
					<div class="navbar-item">
					<%if(user!=null&&user.getRol().getIdRol()==1) { %>
						<div class="buttons">
							<a class="button is-warning" href="">
								<strong>Mi perfil</strong>
							</a>
							<a class="button" href="logout">
								Cerrar sesion
							</a>
						</div>
					<%} else if(user!=null&&user.getRol().getIdRol()==2){ %>
						<div class="buttons">
							<a class="button is-warning" href="signup.jsp">
								<strong>options in comming</strong>
							</a>
							<a class="button" href="logout">
								Cerrar sesion
							</a>
						</div>
					<%} else {%>
						<div class="buttons">
							<a class="button is-warning" href="signup.jsp">
								<strong>Registrarse</strong>
							</a>
							<a class="button" href="login.jsp">
								Iniciar Sesion<img alt="logologin" src="images/loginlogo.gif">
							</a>
						</div>
					<%} %>
					</div>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>