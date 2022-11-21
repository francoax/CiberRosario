<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="entities.Precio"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%LinkedList<Precio> precios = (LinkedList<Precio>) request.getAttribute("precioslist");
    	String dateFormat="dd/MM/yyyy";
		DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);%>
	<div class="box">
		<h3 class="title is-size-6">Lista precios actuales</h3>
		<table class="table is-centered">
			<thead>
				<tr>
					<th>Computadora</th>
					<th>Precio a Fecha</th>
					<th>Precio</th>
				</tr>
			</thead>
			<tbody>
				<%for (Precio price : precios){ %>
				<tr>
					<td><%=price.getIdTipoComputadora().toUpperCase()%></td>
					<td><%=price.getFecha_precio().format(format)%></td>
					<td>$<%=price.getPrecio()%></td>
				</tr>
				<%} %>			
			</tbody>
		</table>
	</div>