<%@page import="dto.ReserveSpecification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<% ReserveSpecification reserve = (ReserveSpecification) session.getAttribute("reservespec");%>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<%if(reserve==null){
		%> <p>${error}</p>
		<div class="buttons">
			<a href="../admin" class="button is-warning is-rounded">Volver a administracion</a>
		</div> <%
	} else {%>
	<table>
		<thead>
			<tr>
				<th>Codigo de Reserva</th>
				<th>DNI</th>
				<th>Nombre Completo cliente</th>
				<th>Fecha de reserva</th>
				<th>Fecha reservada</th>
				<th>Hora Desde</th>
				<th>Hora Hasta</th>
				<th>ID Computadora</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=reserve.getCode().toUpperCase() %></td>
				<td><%=reserve.getUser_dni() %></td>
				<td><%=reserve.getUser_nombre().toUpperCase()+" "+reserve.getUser_apellido().toUpperCase()%></td>
				<td><%=reserve.getFecha_de_reserva() %></td>
				<td><%=reserve.getFecha_a_reservar() %></td>
				<td><%=reserve.getHoraDesde() %></td>
				<td><%=reserve.getHoraHasta() %></td>
				<td><%=reserve.getIdPc() %></td>
			</tr>
		</tbody>
	</table>
	<div class="buttons">
		<a class="button is-warning" href="../admin">Volver a administracion</a>
		<a class="button is-danger ">Rechazar</a>
		<form action="confirm" method="post"><button type="submit" class="button is-success">Validar y habilitar computadora</button></form>
	</div>
	<p>${msgsuccess}</p>
	<%} %>
</body>
</html>