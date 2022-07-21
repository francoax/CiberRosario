<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.time.LocalTime"%>
<%@page import="entities.Computadora"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("login.jsp");
		} else {
		Computadora pc = (Computadora) request.getAttribute("pc");
		String para = (String) request.getAttribute("for");
		LocalTime actual = LocalTime.now();
		int hactual = actual.getHour();
		int[] horas = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
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
    <script src="https://www.w3schools.com/lib/w3.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="title is-5">Reserva por computadora <%=pc.getTipo().getDescripcion().toUpperCase() %> para HOY</h1>
		<div class="container">
			<%if(para.contains("hoy")){%>
			<form action="save" method="post">
				<label class="label">Indique hora desde y hora hasta</label>
				<p style="color: red;" >${msgerror}</p>
				<div class="field">
					<div class="select">
						<select name="horadesde">
							<option selected>Desde</option>
							<%
							for (int i : horas) {
								if(hactual<=i&&i!=23) {
									LocalTime hdesde = LocalTime.of(i, 0);
									%> <option value="<%=hdesde %>"><%=hdesde %></option> <%
								}
							}%>
						</select>
					</div>
					<div class="select">
						<select name="horahasta">
							<option selected>Hasta</option>
							<%
							for (int j : horas){
								if(hactual<j){
									LocalTime hhasta = LocalTime.of(j, 0);
									%> <option value="<%=hhasta %>" ><%=hhasta %></option> <%
								}
							}
							%>
						</select>
					</div>
				</div>
				<input type="submit" value="Reservar">
				<input type="hidden" name="reserve" value="today">
			</form>
			<%} else { %>
			<form action="save" method="post">
				<label class="label">Indique hora desde y hora hasta</label>
				<p style="color: red;" >${msgerror}</p>
				<div class="field">
					<div class="select">
						<select name="horadesde">
							<option selected>Desde</option>
							<%
							for (int i : horas) {
								LocalTime hdesde = LocalTime.of(i, 0);
								%> <option value="<%=hdesde %>"><%=hdesde %></option> <%
							}%>
						</select>
					</div>
					<div class="select">
						<select name="horahasta">
							<option selected>Hasta</option>
							<%
							for (int j : horas){
								LocalTime hhasta = LocalTime.of(j, 0);
								%> <option value="<%=hhasta %>" ><%=hhasta %></option> <%
							}
							%>
						</select>
					</div>
				</div>
				<input type="submit" value="Reservar">
				<input type="hidden" name="reserve" value="tomorrow">
			</form>
			<%} %>
		</div>
		<form action="cancel" method="get">
			<input type="submit" value="Cancelar">
			<input type="hidden" name="pc" value="<%=pc.getIdComputadora() %>">
		</form>
	</div>
</body>
</html>
<%}%>