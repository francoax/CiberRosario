<%@page import="dto.ReserveSpecification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<%if((String)request.getAttribute("error")==null){ %>
		<%ReserveSpecification reserve = (ReserveSpecification) request.getAttribute("reserveCanceled"); %>
		<div class="container box">
			<div class="notification">
				<p>La reserva de codigo <strong><%=reserve.getCode().toUpperCase() %></strong> fue cancelada con exito.</p>
				<h3 class="">Informacion detallada</h3>
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
							<th>Total</th>
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
							<td><%=reserve.getImporte() %></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons is-centered">
				<a class="button is-warning" href="../admin">Volver a administracion</a>
			</div>
		</div>
	<%} else {%>
		<p>${error}</p>
	<%} %>
	
</body>
</html>