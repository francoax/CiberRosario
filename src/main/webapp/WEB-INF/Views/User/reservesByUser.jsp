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
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){int total = 0; for(UserReserves item : list){ %>
			<tr>
				<td><%=item.getCod_reserva().toUpperCase() %></td>
				<td><%=item.getFecha_de_reserva() %></td>
				<td><%=item.getFecha_reservada() %></td>
				<td><%=item.getHoraDesde() %> a <%=item.getHorasHasta() %></td>
				<td><%=item.getCant_horas() %>hs</td>
				<td><%=item.getDescripcion_pc() %></td>
				<td>$<%=item.getImporte() %></td>
				<td><%=item.getEstado() %></td>
				<%if(item.getEstado().equals("solicitada")){ %> 
				<td> <form action="profile" method="post" onsubmit="return confirm('Estas seguro de cancelar la reserva?');"> 
					<input class="is-sr-only" name="code" value="<%=item.getCod_reserva()%>">
					<input class="is-sr-only" name="idpc" value="<%=item.getIdpc()%>"> 
					<button type="submit" class="button is-small is-danger">Cancelar</button> 
				</form>
				</td>
				 <%} %>
				<%if(item.getEstado().equals("finalizada")){total = total + item.getCant_horas();} %>
			</tr>
			<%} %>
		</tbody>
	</table>
	<script type="text/javascript">
			var element = document.getElementById("horasviciadas");
			element.innerHTML += <%=total%>
	</script>
		<%}%>
	</div>

</div>