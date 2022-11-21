<%@page import="dto.ReserveList"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%LinkedList<ReserveList> list = (LinkedList<ReserveList>) request.getAttribute("reservelist"); %>
	<div class="box">
	<%if(list!=null){ %>
		<table class="table is-centered">
			<thead>
				<tr>
					<th>Codigo Reserva</th>
					<th>Fecha de Reserva</th>
					<th>Fecha reservada</th>
					<th>Hora reservada</th>
					<th>Computadora</th>
					<th>Cliente (username)</th>
					<th>Estado reserva</th>
				</tr>
			</thead>
			<tbody>
				<%for (ReserveList item : list){ %>
				<tr>
					<%String s1 = item.getUser_name().substring(0, 1).toUpperCase();
				    String name = s1 + item.getUser_name().substring(1);
				    String s2 = item.getUser_lastname().substring(0, 1).toUpperCase();
				    String lastname = s2 + item.getUser_lastname().substring(1);%>
					<td><%=item.getCod_reserva() %></td>
					<td><%=item.getFecha_de_reserva() %></td>
					<td><%=item.getFecha_a_reservar() %></td>
					<td><%=item.getHoraDesde() %> a <%=item.getHoraHasta() %></td>
					<td>ID: <%=item.getIdComputadora()+" "+item.getDescripcion_pc().toUpperCase() %></td>
					<td><%=name+" "+lastname+" "+"("+item.getUsername()+")" %></td>
					<td><%=item.getEstado_reserva() %></td>
				</tr>
				<%} %>			
			</tbody>
		</table>
	<%} else { %>
		<h1 class="title">Sin reservas por el momento.</h1>
	<%} %>
	</div>