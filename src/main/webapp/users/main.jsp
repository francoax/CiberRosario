<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		if (user==null) {
			response.sendRedirect("../login.jsp");
		} else {
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
	<link rel="stylesheet" type="text/css" href="styles/style.css">
	<link rel="stylesheet" type="text/css" href="styles/normalize.css">
</head>
<body>
	<header>
		<nav>
			<ul>
				<li><a href="main.jsp"><img alt="Logo CiberRosario" src="images/ordenador.png"></a></li>
				<li><a href="main.jsp">Inicio</a></li>
				<li><a href="reservation.html">Realizar reserva</a></li>
				<li><a href="torneos.html">Torneos</a></li>
				<%if(user.getRol().getIdRol()==2) {%>
						<li><a href="../signup">Registrar usuario</a></li>
						<li><a href="main.jsp">Registrar reserva</a></li>
						<li><a href="main.jsp">Confirmar reserva</a></li>
						<li><a href="main.jsp">Finalizar reserva</a></li>
					<% } %>
				<li><a href="../logout">Cerrar Sesion</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>
<%} %>