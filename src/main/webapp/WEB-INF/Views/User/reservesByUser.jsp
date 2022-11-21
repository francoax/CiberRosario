<%@page import="dto.UserReserves"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%LinkedList<UserReserves> list = (LinkedList<UserReserves>) request.getAttribute("userreserve"); %>


<div class="container" style="border-color: black; border: 20px;">
	<h2 class="title has-text-centered mt-6">Mis reservas</h2>
	<div class="table-container">
	<table class="table is-fullwidth">
		<thead>
			<tr>
				<th>Codigo de reserva</th>
				<th>Fecha de reserva</th>
				<th>Fecha reservada</th>
				<th>Horario reservado</th>
				<th>Cantidad de horas</th>
				<th>Computadora reservada</th>
				<th>Importe</th>
				<th>Estado reserva</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ for(UserReserves item : list){ %>
			<tr>
				<td><%=item.getCod_reserva() %></td>
				<td><%=item.getFecha_de_reserva() %></td>
				<td><%=item.getFecha_reservada() %></td>
				<td><%=item.getHoraDesde() %> a <%=item.getHorasHasta() %></td>
				<td><%=item.getCant_horas() %>hs</td>
				<td><%=item.getDescripcion_pc() %></td>
				<td>$<%=item.getImporte() %></td>
				<td><%=item.getEstado() %></td>
			</tr>
			<%}} %>
		</tbody>
	</table>
	</div>
</div>