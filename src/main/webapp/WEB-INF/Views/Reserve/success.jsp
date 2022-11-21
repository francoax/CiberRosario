<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<%Usuario user = (Usuario) session.getAttribute("user"); %>

<html>
<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="notification is-success">
		<h1 class="title">Reserva registrada con éxito!</h1>
		<p class="subtitle">Se te envio un mail con mas informacion a tu mail registrado.</p>
		<br>
		<p>Muchas gracias por reservar en CiberRosario</p>
		<br>
		<br>
		<a class="button" href="../index.jsp">Volver al inicio</a>
	</div>
	
</body>
</html>