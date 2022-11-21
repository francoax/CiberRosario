<%@page import="dto.ReserveSpecification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<% ReserveSpecification reserve = (ReserveSpecification) session.getAttribute("reservespec");%>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="container is-centered mt-6">
		<div class="card">
			<div class="card-header"><p class="card-header-title">Datos de reserva a confirmar</p></div>
			<div class="card-content">
				 <div class="content">
				 	<div class="table-container">
				 		<table class="table">
				 			<thead>
								<tr>
									<th>Codigo de Reserva</th>
									<th>Cliente</th>
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
									<td><%=reserve.getUser_nombre().toUpperCase()+" "+reserve.getUser_apellido().toUpperCase()%></td>
									<td><%=reserve.getFecha_de_reserva() %></td>
									<td><%=reserve.getFecha_a_reservar() %></td>
									<td><%=reserve.getHoraDesde() %></td>
									<td><%=reserve.getHoraHasta() %></td>
									<td><%=reserve.getIdPc() %></td>
									<td><strong>$<%=reserve.getImporte() %></strong> </td>
								</tr>
							</tbody>
				 		</table>
				 	</div>
				 	<div class="buttons is-centered">
						<a class="button is-warning" href="../admin">Volver a administracion</a>
						<form action="confirm" method="post"><button type="submit" class="button is-success">Validar y habilitar computadora</button></form>
					</div>
				 </div>
			</div>
		</div>
	</div>
</body>
</html>