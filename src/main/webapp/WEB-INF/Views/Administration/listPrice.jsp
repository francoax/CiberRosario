<%@page import="dto.PriceSpecification"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="entities.Precio"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%LinkedList<PriceSpecification> precios = (LinkedList<PriceSpecification>) request.getAttribute("precioslist");
    	String dateFormat="dd/MM/yyyy";
		DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);%>
	<div class="box">
		<h3 class="title is-size-6">Lista precios actuales</h3>
		<%if(precios!=null){ %>
		<table class="table is-centered">
			<thead>
				<tr>
					<th>Computadora</th>
					<th>Fecha precio actual</th>
					<th>Precio actual</th>
					<th>Fecha precio proximo</th>
					<th>Precio proximo</th>
				</tr>
			</thead>
			<tbody>
				<%for (PriceSpecification price : precios){ %>
				<tr>
					<td><%=price.getPc_descripcion() %></td>
					<td><%=price.getFechaPrecioActual() %></td>
					<td><%=price.getPrecioActual() %></td>
					<td><%=price.getFechaPrecioProxima() %></td>
					<td><%=price.getPrecioProximo() %></td>
				</tr>
				<%} %>			
			</tbody>
		</table>
		<%} else { %>
			<h1 class="title">Sin precios cargados</h1>
		<%} %>
	</div>