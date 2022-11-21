<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<%Usuario user = (Usuario) session.getAttribute("user"); %>

<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<jsp:include page="/includes/header.jsp"></jsp:include>
	
	<div class="container" style="width: auto;">
		<h2 class="title has-text-centered m-6">Informacion Personal</h2>
		<nav class="level" style="border-top: 5px; border-top-color: black;">
			<div class="level-item has-text-centered">
				<div>
					<p class="heading">Nombre y Apellido</p>
					<p class="title is-size-4"><%=user.getNombre()+" "+user.getApellido() %></p>
				</div>
			</div>
			<div class="level-item has-text-centered">
				<div>
					<p class="heading">Username</p>
					<p class="title is-size-4"><%=user.getUsername()%></p>
				</div>
			</div>
			<div class="level-item has-text-centered">
				<div>
					<p class="heading">Email registrado</p>
					<p class="title is-size-4"><%=user.getEmail()%></p>
				</div>
			</div>
			<div class="level-item has-text-centered">
				<div>
					<p class="heading">Horas viciadas</p>
					<p id="horasviciadas" class="title is-size-4"></p>
				</div>
			</div>
		</nav>
	</div>
	
	<jsp:include page="/reservesuser"></jsp:include>
	
	
</body>
</html>