<%@page import="entities.Reserva"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% Reserva r = (Reserva) session.getAttribute("reserva"); %>
<html>
<body>
	<div class="box">
		<h1 class="title is-6">Plataforma</h1>
		<p class="subtitle is-4"><%=r.getPlataforma_stream() %></p>
		<h1 class="title is-6">Streamer: </h1>
		<p class="subtitle is-4"><%=r.getName_stream()%></p>
		<h1 class="title is-6"></h1>
	</div>
</body>
</html>