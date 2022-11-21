<%@page import="dto.ReserveList"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%LinkedList<ReserveList> list = (LinkedList<ReserveList>) request.getAttribute("reservelist"); %>
	<div class="box">
		<h3 class="title is-size-6">Lista de reservas</h3>
		<table class="table is-centered">
			<thead>
				<tr>
					<th>Codigo Reserva</th>
					<th>Fecha de Reserva</th>
					<th>Fecha reservada</th>
					<th>Hora reservada</th>
					<th>ID computadora</th>
					<th>Cliente</th>
				</tr>
			</thead>
			<tbody>
				<%for (ReserveList item : list){ %>
				<tr>
					<td><%=item.getCod_reserva() %></td>
					<td><%=item.getFecha_de_reserva() %></td>
					<td><%=item.getFecha_a_reservar() %></td>
					<td><%=item.getHoraDesde() %> a <%=item.getHoraHasta() %></td>
					<td><%=item.getIdComputadora() %></td>
					<td><%=item.getUser_name().toUpperCase()+" "+item.getUser_lastname().toUpperCase()+", DNI "+item.getUser_dni() %></td>
				</tr>
				<%} %>			
			</tbody>
		</table>
	</div>