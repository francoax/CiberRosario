<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
	%>
<html>
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
					<a href="streamers.jsp" class="navbar-item">
						Streamers<img alt="" src="images/vivir.png">
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
							<a class="button is-warning" href="admin">
								<strong>Panel de Control</strong>
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