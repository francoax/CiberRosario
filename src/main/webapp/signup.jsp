<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	boolean cond;
	Usuario user = (Usuario) session.getAttribute("user");
	if(user!=null&&user.getRol().getIdRol()==2) {
		cond = true;
	} else {
		cond = false;
	}
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
			<form action="signup" method="post" >
				<p class="msg">${msg}</p>
				<label for= "inputNombre">Nombre: </label>
				<input id="inputNombre" name="nombre" type="text" required> <br>
				
				<label for="inputApelldo" >Apellido: </label>
				<input id="inputApellido" name="apellido" type="text" required> <br>
				
				<label for="inputFnac">Fecha de nacimiento: </label>
				<input id="inputFnac" name="fechanac" type="date" required> <br> 
				
				<label for="inputDNI">DNI: </label>
				<input id="inputDNI" name="dni" type="text" required> <br>
				
				<label for="inputEmail">Email: </label>
				<input id="inputEmail" name="email" type="email" required> <br>
				
				<label for="inputTel">Telefono: </label>
				<input id="inputTel" name="tel" type="tel" required> <br>
								
				<p>Mediante este nombre vas a ser reconocido.</p>
				<label for="inputUser">Usuario: </label>
				<input id="inputUser" name="user" type="text" required> <br>
				
				<p class="error">${error}</p>
				<label for="inputPass">Contraseña: </label>
				<input id="inputpass" name="password" type="password" required> <br>
				<%if(cond) { %>
				<select name="typeuser">
					  <option value="user">Usuario</option>
					  <option value="admin" selected>Administrador</option>
				</select>
				<%} %>
				<label>Repetir contraseña: </label>
				<input type="password" required> <br>
				<input type="submit" value="Registrarse">
				<%if(user!=null) {%>
					<a href="users/main.jsp">Volver</a>
				<%} else { %>
					<a href="index.jsp">Volver</a>
				<%} %>
			</form>
</body>
</html>